Unregister-ScheduledTask -TaskName "continue" -Confirm:$False

#non funziona se non sul desktop
Set-WinHomeLocation -GeoId 118

#sync time
net start w32time
w32tm /resync

changepk.exe /ProductKey NWHDX-K9VRX-KRHRM-VMTK2-8XDMX
$key = Read-Host "
Inserire la nuova key di windows"
changepk.exe /ProductKey $key

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


Set-Location "C:\temp\"
.\setup.exe /dowload "C:\temp\conf.xml"
.\setup.exe /configure "C:\temp\conf.xml"


$client = Read-Host "
Computer da:
1: sede
2: asili
3: nessuno
"
if ((Get-NetConnectionProfile).IPv4Connectivity -contains "Internet" -or (Get-NetConnectionProfile).IPv6Connectivity -contains "Internet") { 
    Invoke-WebRequest 'https://logins.livecare.net/liveletexecustomunified/GSTTQX6918RZR83K' -OutFile "$PD\teleassistenza.exe"
}

 Switch ($client)
{
    "1"  { 
        Invoke-WebRequest '' -OutFile "$PD\teleassistenza.exe"
     }
    "2"{ 
       Invoke-WebRequest '' -OutFile "$PD\teleassistenza.exe"
     }
     "3"{
        exit
     }
}

$PC = Read-Host "
Inserire il nuovo nominativo per il computer
"
Rename-Computer -NewName $PC

pause

# Remove-Item -Path C:\temp\config.ps1 -Recurse