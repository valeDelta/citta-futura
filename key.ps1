Unregister-ScheduledTask -TaskName "windowskey" -Confirm:$False
$key = Read-Host "
Inserire la nuova key di windows"
changepk.exe /ProductKey $key
Restart-Computer /Force 