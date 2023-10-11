
$Appname = "Google Chrome"

$RequiredVersion = [version]"84.0.4147.89"

$InstalledApp = Get-Package -Name "$Appname" -ErrorAction SilentlyContinue #117.0.5938.150 #118.0.5993.71 #84.0.4147.89

$InstalledVersion = [version]$InstalledApp.Version

#If (($InstalledVersion -ge $RequiredVersion) -or ($InstalledVersion -eq $null)){

If ($InstalledVersion -ge $RequiredVersion){
EXIT 0
}
else {
EXIT 1
}