Unregister-ScheduledTask -TaskName "continue" -Confirm:$False

$PD = "C:\Users\Public\Desktop"

#non funziona se non sul desktop
Set-WinHomeLocation -GeoId 118

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

#disinstall mcafee
Set-Location "C:\Program Files\McAfee\WebAdvisor"
.\uninstaller.exe /s
Set-Location "C:\Program Files\McAfee"
Set-Location "C:\Program Files\McAfee\wps\1.*"
.\mc-update.exe -uninstall -silent -force

$PC = Read-Host "
Inserire il nuovo nominativo per il computer
"

$client = Read-Host "
Computer da:
1: asili
2: sede
3: nessuno
"
if ((Get-NetConnectionProfile).IPv4Connectivity -contains "Internet" -or (Get-NetConnectionProfile).IPv6Connectivity -contains "Internet") { 
    Invoke-WebRequest 'https://logins.livecare.net/liveletexecustomunified/GSTTQX6918RZR83K' -OutFile "$PD\teleassistenza.exe"
}

Switch ($client)
{
    "1"  { 
        Invoke-WebRequest 'https://redirector.eset.systems/li-handler/?uuid=epi_win-dea2c64c-ca8b-4bf6-9449-cda56cb83add' -OutFile "C:\temp\eset.exe"
        Set-Location "C:\temp\"
        eset.exe
     }
    "2"{ 
       Invoke-WebRequest 'https://redirector.eset.systems/li-handler/?uuid=epi_win-b208bcc5-97da-424f-b62f-ee836e00c809' -OutFile "C:\temp\eset.exe"
       Set-Location "C:\temp\"
        eset.exe
     }
     "3"{
        continue
     }
}

if (Get-ChildItem -Path "C:\temp" -Filter "config.ps1") { 
    # creo le azioni da eseguire
    Set-ExecutionPolicy Unrestricted -Scope LocalMachine
    $action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument "C:\temp\key.ps1 -WindowStyle Maximized"
    #creo il trigger e impostazioni per l'attività
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    $task = New-ScheduledTaskPrincipal -RunLevel Highest -UserId Saidea

    # registro le attività
    Register-ScheduledTask -Action $action -Trigger $trigger -Principal $task -TaskName "windowskey"

} 
else { 
    exit
}

Rename-Computer -NewName $PC

changepk.exe /ProductKey NWHDX-K9VRX-KRHRM-VMTK2-8XDMX



pause

# Remove-Item -Path C:\temp\config.ps1 -Recurse