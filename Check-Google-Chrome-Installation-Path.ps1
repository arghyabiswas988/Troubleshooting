##################
$ChromeInstallPath = "$Env:ProgramFiles\Google\Chrome\Application\chrome.exe"

if (Test-Path $ChromeInstallPath){
EXIT 0
}
else {
EXIT 1
}