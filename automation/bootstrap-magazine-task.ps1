param([Parameter(Mandatory=$true)][string]$Payload)
$ErrorActionPreference='Stop'
$stateRoot=Join-Path $env:LOCALAPPDATA 'RoboticsAiMagazineScheduled'
try {
    $bytes=[Convert]::FromBase64String($Payload)
    $inputStream=New-Object IO.MemoryStream(,$bytes)
    $gzip=New-Object IO.Compression.GZipStream($inputStream,[IO.Compression.CompressionMode]::Decompress)
    $reader=New-Object IO.StreamReader($gzip,[Text.Encoding]::UTF8)
    try { $packet=$reader.ReadToEnd() | ConvertFrom-Json } finally { $reader.Dispose(); $inputStream.Dispose() }
    [IO.Directory]::CreateDirectory($stateRoot) | Out-Null
    $utf8=New-Object Text.UTF8Encoding($false)
    foreach ($entry in $packet.files.PSObject.Properties) {
        if ($entry.Name -notin @('run-magazine-update.ps1','github-auth.ps1','magazine-update-prompt.md')) { throw 'Unexpected bootstrap file.' }
        [IO.File]::WriteAllText((Join-Path $stateRoot $entry.Name),$entry.Value,$utf8)
    }
    $configPath=Join-Path $stateRoot 'config.json'
    [IO.File]::WriteAllText($configPath,($packet.config | ConvertTo-Json),$utf8)
    & (Join-Path $stateRoot 'run-magazine-update.ps1') -ConfigPath $configPath
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    exit 0
} catch {
    if (Test-Path -LiteralPath $stateRoot) {
        Add-Content -LiteralPath (Join-Path $stateRoot 'bootstrap-error.log') -Value ((Get-Date -Format o)+' '+$_.Exception.Message) -Encoding UTF8
    }
    exit 1
}
