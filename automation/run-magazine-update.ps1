param(
    [Parameter(Mandatory=$true)][string]$ConfigPath,
    [switch]$ValidateOnly
)
$ErrorActionPreference='Stop'
$config=Get-Content -LiteralPath $ConfigPath -Raw -Encoding UTF8 | ConvertFrom-Json
$stateRoot=Split-Path -Parent $ConfigPath
$logRoot=Join-Path $stateRoot 'logs'
[IO.Directory]::CreateDirectory($logRoot) | Out-Null
$zone=[TimeZoneInfo]::FindSystemTimeZoneById('Central Standard Time')
$today=[TimeZoneInfo]::ConvertTimeFromUtc([DateTime]::UtcNow,$zone).Date
$anchor=[DateTime]::ParseExact('2026-10-05','yyyy-MM-dd',[Globalization.CultureInfo]::InvariantCulture)
$elapsedDays=[int]($today-$anchor).TotalDays
if ($elapsedDays -lt 0) { throw 'Current date precedes schedule anchor.' }
$edition=$anchor.AddDays(14*[Math]::Floor($elapsedDays/14))
$dateLabel=$edition.ToString('yyyy-MM-dd')
$logPath=Join-Path $logRoot ($dateLabel+'-run.log')
$mutex=New-Object Threading.Mutex($false,'Local\RoboticsAiBiweeklyMagazineUpdate')
$locked=$false
function Log([string]$Message) {
    Add-Content -LiteralPath $logPath -Value ((Get-Date -Format o)+' '+$Message) -Encoding UTF8
}
function Git([string[]]$Arguments) {
    $output=& $config.git_exe @Arguments 2>&1
    if ($LASTEXITCODE -ne 0) { throw "Git command failed: $($Arguments[0]). $output" }
    return $output
}
function Validate-Edition([string]$Checkout,[string]$Label) {
    $folder=Join-Path $Checkout ('magazines/'+$Label+'-magazine-update')
    $manifest=Get-Content -LiteralPath (Join-Path $folder 'articles.json') -Raw -Encoding UTF8 | ConvertFrom-Json
    $articles=@($manifest.articles)
    if ($manifest.edition_date -ne $Label -or $manifest.period_end -ne $Label -or $manifest.timezone -ne 'America/Chicago') { throw 'Invalid edition metadata.' }
    $expectedStart=([DateTime]::ParseExact($Label,'yyyy-MM-dd',[Globalization.CultureInfo]::InvariantCulture)).AddDays(-13).ToString('yyyy-MM-dd')
    if ($manifest.period_start -ne $expectedStart) { throw 'Invalid coverage window.' }
    if ($articles.Count -gt 4) { throw 'More than four magazine articles.' }
    $seen=@{}
    foreach ($previous in Get-ChildItem -LiteralPath (Join-Path $Checkout 'magazines') -Directory) {
        if ($previous.FullName -eq $folder) { continue }
        $oldFile=Join-Path $previous.FullName 'articles.json'
        if (Test-Path -LiteralPath $oldFile) {
            $old=Get-Content -LiteralPath $oldFile -Raw -Encoding UTF8 | ConvertFrom-Json
            foreach ($entry in $old.articles) { $seen[$entry.url.TrimEnd('/')]= $true }
        }
    }
    foreach ($article in $articles) {
        if (-not $article.title -or -not $article.publication -or $article.url -notmatch '^https://') { throw 'Incomplete article metadata.' }
        $url=$article.url.TrimEnd('/')
        if ($seen.ContainsKey($url)) { throw 'Duplicate article URL.' }
        $seen[$url]=$true
        $published=[DateTime]::ParseExact($article.published_date,'yyyy-MM-dd',[Globalization.CultureInfo]::InvariantCulture)
        if ($published -gt [DateTime]::ParseExact($Label,'yyyy-MM-dd',[Globalization.CultureInfo]::InvariantCulture)) { throw 'Future-dated article.' }
        if ($article.published_date -lt $expectedStart -and -not $article.older_selection_reason) { throw 'Older selection is not explained.' }
        if ($article.note -notmatch '^0[1-4]-[a-z0-9-]+\.md$') { throw 'Invalid note filename.' }
        $note=Get-Content -LiteralPath (Join-Path $folder $article.note) -Raw -Encoding UTF8
        if (-not $note.Contains($article.url) -or $note -notmatch '(?i)summary' -or $note -notmatch '(?i)takeaway' -or $note -notmatch '(?i)MUST LEARN') { throw 'Incomplete article note.' }
    }
    if (@(Get-ChildItem -LiteralPath $folder -Filter '0*.md').Count -ne $articles.Count) { throw 'Manifest and article-note count differ.' }
    $latest=Get-Content -LiteralPath (Join-Path $Checkout 'magazines/latest.json') -Raw -Encoding UTF8 | ConvertFrom-Json
    if ($latest.edition_date -ne $Label -or $latest.folder -ne ($Label+'-magazine-update') -or $latest.article_count -ne $articles.Count) { throw 'Invalid latest-edition pointer.' }
    $editionReadme=Get-Content -LiteralPath (Join-Path $folder 'README.md') -Raw -Encoding UTF8
    foreach ($article in $articles) { if (-not $editionReadme.Contains($article.note)) { throw 'Edition index omits an article.' } }
    return $articles.Count
}
try {
    $locked=$mutex.WaitOne(0)
    if (-not $locked) { exit 0 }
    Log 'Starting scheduled magazine check.'
    . (Join-Path $PSScriptRoot 'github-auth.ps1')
    $checkout=Join-Path $stateRoot 'checkout'
    if (-not (Test-Path -LiteralPath (Join-Path $checkout '.git'))) {
        Invoke-MagazineAuthenticatedGit -GitExe $config.git_exe -GitArguments @('clone','--quiet',$config.repository_url,$checkout)
    }
    Set-Location -LiteralPath $checkout
    $dirty=Git @('status','--porcelain')
    if ($dirty) { throw 'Automation checkout has unfinished changes; review its log and files before retrying.' }
    Invoke-MagazineAuthenticatedGit -GitExe $config.git_exe -GitArguments @('fetch','--quiet','origin','main')
    $localHead=(Git @('rev-parse','HEAD')).Trim()
    $remoteHead=(Git @('rev-parse','origin/main')).Trim()
    if ($localHead -ne $remoteHead) {
        & $config.git_exe merge-base --is-ancestor origin/main HEAD
        if ($LASTEXITCODE -eq 0) {
            # Retry publication of a prior locally committed edition after a network failure.
            $aheadPaths=Git @('diff','--name-only','origin/main..HEAD')
            foreach ($path in $aheadPaths) { if ($path -notlike 'magazines/*') { throw 'Unpublished changes extend outside magazines.' } }
            $pending=Get-Content -LiteralPath 'magazines/latest.json' -Raw -Encoding UTF8 | ConvertFrom-Json
            $null=Validate-Edition $checkout $pending.edition_date
            Invoke-MagazineAuthenticatedGit -GitExe $config.git_exe -GitArguments @('push','origin','HEAD:main')
        } else { $null=Git @('merge','--ff-only','origin/main') }
    }
    $latest=Get-Content -LiteralPath 'magazines/latest.json' -Raw -Encoding UTF8 | ConvertFrom-Json
    if ($ValidateOnly -or $latest.edition_date -ge $dateLabel) {
        $count=Validate-Edition $checkout $latest.edition_date
        Log ("SUCCESS: repository synchronized; current edition "+$latest.edition_date+" has "+$count+" articles. No new edition due.")
        exit 0
    }
    $codexExe=$config.codex_exe
    if (-not (Test-Path -LiteralPath $codexExe)) {
        $candidate=Get-ChildItem -LiteralPath $config.codex_bin_root -Recurse -Filter 'codex.exe' | Sort-Object LastWriteTime -Descending | Select-Object -First 1
        if (-not $candidate) { throw 'Codex executable not found.' }
        $codexExe=$candidate.FullName
    }
    $prompt=Get-Content -LiteralPath (Join-Path $PSScriptRoot 'magazine-update-prompt.md') -Raw -Encoding UTF8
    $prompt=$prompt.Replace('{{EDITION_DATE}}',$dateLabel).Replace('{{PERIOD_START}}',$edition.AddDays(-13).ToString('yyyy-MM-dd'))
    $OutputEncoding=New-Object Text.UTF8Encoding($false)
    $oldThread=[Environment]::GetEnvironmentVariable('CODEX_THREAD_ID','Process')
    [Environment]::SetEnvironmentVariable('CODEX_THREAD_ID',$null,'Process')
    $savedPreference=$ErrorActionPreference
    try {
        $ErrorActionPreference='Continue'
        $prompt | & $codexExe exec --ephemeral --sandbox workspace-write -c 'approval_policy="never"' -c 'web_search="live"' -c 'sandbox_workspace_write.network_access=true' -C $checkout --color never - >> $logPath 2>&1
        if ($LASTEXITCODE -ne 0) { throw "Codex generation failed with exit code $LASTEXITCODE." }
    } finally {
        $ErrorActionPreference=$savedPreference
        [Environment]::SetEnvironmentVariable('CODEX_THREAD_ID',$oldThread,'Process')
    }
    $count=Validate-Edition $checkout $dateLabel
    $allowedFolder='magazines/'+$dateLabel+'-magazine-update/'
    $changed=@(Git @('diff','--name-only'))
    $changed+=@(Git @('ls-files','--others','--exclude-standard'))
    foreach ($path in $changed) {
        if ($path -ne 'magazines/README.md' -and $path -ne 'magazines/latest.json' -and -not $path.StartsWith($allowedFolder)) { throw 'Generated changes extend outside the current magazine edition.' }
    }
    $null=Git @('-c','core.autocrlf=false','add','--','magazines')
    $null=Git @('diff','--cached','--check')
    $null=Git @('-c',('user.name='+$config.git_user_name),'-c',('user.email='+$config.git_user_email),'commit','-m',('Add '+$dateLabel+' magazine update ('+$count+' articles)'))
    Invoke-MagazineAuthenticatedGit -GitExe $config.git_exe -GitArguments @('push','origin','HEAD:main')
    Log ("SUCCESS: published "+$dateLabel+" magazine update with "+$count+" articles.")
} catch {
    Log ('FAILED: '+$_.Exception.Message)
    Write-Error $_.Exception.Message
    exit 1
} finally {
    if ($locked) { $mutex.ReleaseMutex() }
    $mutex.Dispose()
}
