
$Appname = "Google Chrome"

$RequiredVersion = [version]"117.0.5938"

$InstalledApp = Get-Package -Name "$Appname" -ErrorAction SilentlyContinue #117.0.5938.150 #118.0.5993.71

$InstalledVersion = [version]$InstalledApp.Version

If (($InstalledVersion -ge $RequiredVersion) -or ($InstalledVersion -eq $null)){
EXIT 0
}
else {
EXIT 1
}
