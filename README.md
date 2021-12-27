# Ilyas-Ahmed-nstall-Microsoft-FSlogix-Agent-Script
Scripts to Install FSLogix Agent PowerShell Script
Install Microsoft FSlogix Agent Script
Scripts to Install FSLogix Agent PowerShell Script

Description
Install FSLogix Agnet on Virtual and Physical Machines or Servers. 

Prerequisites
Download FSLogixAppsSetup.exe from https://docs.microsoft.com/en-us/fslogix/install-ht

FSLogix licensing and entitlement
FSLogix tools are not independently licensed. Before downloading and using FSLogix, review the entitlement and configuration requirements.

Usage
Customize and copy install.bat FSLogixAppsSetup.exe to a network share.
Run FSlogix Script.ps1 file. It will copy install.bat and FSLogixAppsSetup.exe from network share to c:\temp on every computer or server in the list.
How does it work
Creates Scheduled tasks to installing new FSlogix Agent.
Executes FSLogixInstall scheduled task. This scheduled task runs after 3 minutes it is created. Once started, it runs install.bat file and restarts the computer. No user login is required.
After installation is complete, it deletes install.bat FSLogixAppsSetup.exe files from c:\temp and also deletes FSLogixInstall scheduled tasks.
Built With
PowerShell
Batch Script
Authors
Ilyas Ahmed
