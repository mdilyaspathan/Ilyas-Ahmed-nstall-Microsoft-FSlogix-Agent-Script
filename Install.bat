REM change port number in below command.
REM Use FSLogix command line helper tool from microsoft. https://docs.microsoft.com/en-us/fslogix/command-line-utility-reference if needed
REM Install new FSlogix agent, delete files and scheduled tasks. Finally reboot.

c:\temp\FSLogixAppsSetup.exe /install /quiet /norestart
C:\Windows\system32\schtasks.exe /delete /tn FSLogixInstall /f
del c:\temp\FSLogixAppsSetup.exe /F
C:\Windows\System32\timeout.exe /t 5
C:\Windows\System32\shutdown.exe /r /t 20 /f
del c:\temp\install.bat /F
