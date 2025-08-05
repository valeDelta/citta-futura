$client = Read-Host "
Che office va installato?:
1: 365
2: 2021
3: nessuno
"

Switch ($client)
{
    "1"  { 
        Invoke-WebRequest 'https://redirector.eset.systems/li-handler/?uuid=epi_win-dea2c64c-ca8b-4bf6-9449-cda56cb83add' -OutFile "C:\temp\eset.exe"
        Set-Location "C:\temp\"
        eset.exe
     }
    "2"{ 
       #install office
        Set-Location "C:\temp\"
        .\setup.exe /dowload "C:\temp\office.xml"
        .\setup.exe /configure "C:\temp\office.xml"

     }
     "3"{
        continue
     }
}