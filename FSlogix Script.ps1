$vdilist = Get-Content C:\temp\list.txt

foreach ($vdi in $vdilist) {
Write-Host "Working on $vdi"
    if (!(Test-Path -Path \\$vdi\c$\temp)) {
        New-Item -ItemType Directory -Path \\$vdi\c$ -Name Temp
        Copy-Item "\\localhost\FSlogixSetup\Install.bat" -Destination \\$vdi\c$\temp -Force
        Copy-Item "\\localhost\FSlogixSetup\FSLogixAppsSetup.exe" -Destination \\$vdi\c$\temp -Force
    }
    else {
        Copy-Item "\\localhost\FSlogixSetup\Install.bat" -Destination \\$vdi\c$\temp -Force
        Copy-Item "\\localhost\FSlogixSetup\FSLogixAppsSetup.exe" -Destination \\$vdi\c$\temp -Force

    }
        Invoke-Command -ComputerName $vdi -Scriptblock {
        $time = (Get-Date).AddMinutes(3)
        $action = New-ScheduledTaskAction -Execute 'c:\temp\install.bat'
        $trigger = New-ScheduledTaskTrigger -Once -At $time
        $principal = New-ScheduledTaskPrincipal  -RunLevel Highest -UserID "NT AUTHORITY\SYSTEM" -LogonType S4U

        Register-ScheduledTask -Action $action -Trigger $trigger -Principal $principal -TaskName "FSlogixInstall" -Description "FSlogix Agnet Install" 

    } 


}

