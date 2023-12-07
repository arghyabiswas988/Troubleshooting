Write-Host "MS Store and Windows update policies..."

$WindowsUpdateREG = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate'

$DisableWindowsUpdateAccess = Get-ItemPropertyValue -Path $WindowsUpdateREG -Name 'DisableWindowsUpdateAccess'
if ($DisableWindowsUpdateAccess -eq  0){
  Write-Host "Windows Update Access enabled." -ForegroundColor Green}
else {
    Write-Host "ERROR:Windows Update Access disabled." -ForegroundColor Red}

$DoNotConnectToWindowsUpdate = Get-ItemPropertyValue -Path $WindowsUpdateREG -Name 'DoNotConnectToWindowsUpdateInternetLocations'
if ($DoNotConnectToWindowsUpdate -eq  0){
  Write-Host "Windows Update internet Access enabled." -ForegroundColor Green}
else {
    Write-Host "ERROR:Windows Update internet Access disabled." -ForegroundColor Red}

$MSStoreREG = 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore'

$RemoveWindowsStore = Get-ItemPropertyValue -Path $MSStoreREG -Name 'RemoveWindowsStore'
if ($RemoveWindowsStore -eq 0){
    Write-Host "MS Store enabled." -ForegroundColor Green}
else {
    Write-Host "ERROR:MS Store disaabled." -ForegroundColor Red}

$DisableStoreApps = Get-ItemPropertyValue -Path $MSStoreREG -Name 'DisableStoreApps'
if ($DisableStoreApps -eq 0){
    Write-Host "MS Store app enabled." -ForegroundColor Green}
else {
    Write-Host "ERROR:MS Store app disaabled." -ForegroundColor Red}

$AutoDownload = Get-ItemPropertyValue -Path $MSStoreREG -Name 'AutoDownload'
if ($AutoDownload -eq 4){
    Write-Host "MS Store automatic update enabled." -ForegroundColor Green}
else {
    Write-Host "ERROR:MS Store automatic update disaabled." -ForegroundColor Red}


Write-Host "Checking services..."

$InstallService = Get-Service -Name InstallService
if (($InstallService.Status -eq 'Running') -and ($InstallService.StartType -eq 'Automatic')){
    Write-Host "Microsoft Store Install Service: OK" -ForegroundColor Green
    }
else{ 
    Write-Host "Microsoft Store Install Service: ERROR" -ForegroundColor Red}

$WindowsUpdateService = Get-Service -Name 'wuauserv'
if (($WindowsUpdateService.Status -eq 'Running') -and ($WindowsUpdateService.StartType -eq 'Automatic')){
    Write-Host "Windows Update Service: OK" -ForegroundColor Green
    }
else{ 
    Write-Host "Windows Update Service: ERROR" -ForegroundColor Red}
