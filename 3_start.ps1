if (Get-ChildItem -Path "C:\temp" -Filter "config.ps1") { 
    # creo le azioni da eseguire
    Set-ExecutionPolicy Unrestricted -Scope LocalMachine
    $action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument "C:\temp\config.ps1 -WindowStyle Maximized"
    #creo il trigger e impostazioni per l'attività
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    $task = New-ScheduledTaskPrincipal -RunLevel Highest -UserId Saidea

    # registro le attività
    Register-ScheduledTask -Action $action -Trigger $trigger -Principal $task -TaskName "continue"

} 
else { 
    exit
}