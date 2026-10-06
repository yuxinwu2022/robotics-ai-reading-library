# Read only the signed-in GitHub Desktop account needed for this repository.
function Get-MagazineGitHubToken {
    if (-not ('MagazineDesktopCredential' -as [type])) {
        Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;
using System.Text;
public static class MagazineDesktopCredential {
 [DllImport("advapi32.dll", EntryPoint="CredReadW", CharSet=CharSet.Unicode, SetLastError=true)]
 private static extern bool CredRead(string target, int type, int flags, out IntPtr credential);
 [DllImport("advapi32.dll")] private static extern void CredFree(IntPtr credential);
 [StructLayout(LayoutKind.Sequential, CharSet=CharSet.Unicode)]
 private struct Credential {
  public uint Flags; public uint Type; public string TargetName; public string Comment;
  public System.Runtime.InteropServices.ComTypes.FILETIME LastWritten;
  public uint CredentialBlobSize; public IntPtr CredentialBlob; public uint Persist;
  public uint AttributeCount; public IntPtr Attributes; public string TargetAlias; public string UserName;
 }
 public static string Read(string account) {
  IntPtr ptr;
  if (!CredRead("GitHub - https://api.github.com/" + account, 1, 0, out ptr))
   throw new InvalidOperationException("GitHub Desktop credentials unavailable. Sign in to GitHub Desktop.");
  try {
   Credential c=(Credential)Marshal.PtrToStructure(ptr,typeof(Credential));
   byte[] bytes=new byte[c.CredentialBlobSize];
   Marshal.Copy(c.CredentialBlob,bytes,0,bytes.Length);
   return Encoding.UTF8.GetString(bytes).TrimEnd('\0');
  } finally { CredFree(ptr); }
 }
}
'@
    }
    return [MagazineDesktopCredential]::Read('yuxinwu2022')
}

function Invoke-MagazineAuthenticatedGit {
    param([string]$GitExe, [string[]]$GitArguments)
    $token = Get-MagazineGitHubToken
    $names = @('GIT_CONFIG_COUNT','GIT_CONFIG_KEY_0','GIT_CONFIG_VALUE_0','GIT_TERMINAL_PROMPT','GCM_INTERACTIVE')
    $saved = @{}
    $savedPreference = $ErrorActionPreference
    foreach ($name in $names) { $saved[$name] = [Environment]::GetEnvironmentVariable($name, 'Process') }
    try {
        $env:GIT_CONFIG_COUNT='1'
        $env:GIT_CONFIG_KEY_0='http.https://github.com/.extraheader'
        $env:GIT_CONFIG_VALUE_0='AUTHORIZATION: basic '+[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('yuxinwu2022:'+$token))
        $env:GIT_TERMINAL_PROMPT='0'
        $env:GCM_INTERACTIVE='Never'
        $ErrorActionPreference='Continue'
        & $GitExe @GitArguments
        if ($LASTEXITCODE -ne 0) { throw "Authenticated Git command failed with exit code $LASTEXITCODE." }
    } finally {
        $ErrorActionPreference=$savedPreference
        foreach ($name in $names) { [Environment]::SetEnvironmentVariable($name, $saved[$name], 'Process') }
        $token=$null
    }
}
