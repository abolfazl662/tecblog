$profilePath = Join-Path $env:USERPROFILE 'Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1'
if(-not(Test-Path $profilePath)){
    New-Item -ItemType File -Path $profilePath -Force | Out-Null
}
$here = @'
# Added by Copilot: fluttergen fallback
if (-not (Get-Command fluttergen -ErrorAction SilentlyContinue)) {
    function fluttergen { & 'E:\pain\tecblog\fluttergen.bat' @args }
}
'@
Add-Content -Path $profilePath -Value $here
. $profilePath
fluttergen
Write-Output 'Done'
