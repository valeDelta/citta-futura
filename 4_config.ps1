Unregister-ScheduledTask -TaskName "continue" -Confirm:$False

#non funziona se non sul desktop
Set-WinHomeLocation -GeoId 118
pause

#sync time
net start w32time
w32tm /resync

Get-AppxPackage -AllUsers "MSTeams" | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers "McAfeeWPSSparsePackage" | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers "Microsoft.XboxIdentityProvider" | -AppxPackage -AllUsers
Get-AppxPackage -AllUsers "Microsoft.Copilot" | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers "Microsoft.XboxSpeechToTextOverlay" | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers "Microsoft.XboxGamingOverlay" | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers "Microsoft.Xbox.TCUI" | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers "Microsoft.MicrosoftOfficeHub" | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers "Microsoft.XboxGameCallableUI" | Remove-AppxPackage -AllUsers


Get-AppPackage -AllUsers "Microsoft.GamingApp" | Remove-AppPackage -AllUsers
Get-AppPackage -AllUsers "Microsoft.OutlookForWindows" | Remove-AppPackage -AllUsers

Set-Location "C:\Program Files\McAfee\WebAdvisor"
.\uninstaller.exe /s


Set-Location "C:\Program Files\McAfee\wps\1.31.148.1"
.\mc-update.exe -uninstall -silent -force