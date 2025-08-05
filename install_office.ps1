$client = Read-Host "
Che office va installato?:
1: 365
2: 2021
3: nessuno
"

Switch ($client)
{
    "1"  { 
        
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