Write-Host @'
 =============================
< Windows Subsystem for Linux >
< (Ubuntu >= 20.04) installer >
 =============================
   \
    \
        .--.
       |o_o |
       |:_/ |
      //   \ \
     (|     | )
    /'\_   _/`\
    \___)=(___/
'@

if ([Environment]::OSVersion.Version.Major -ne 10) {
  Write-Error 'Upgrade to Windows 10 before running this script'
  Exit
}

if (('Unrestricted', 'RemoteSigned') -notcontains (Get-ExecutionPolicy)) {
  Write-Error @'
The execution policy on your machine is Restricted, but it must be opened up for this
installer with:
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
'@
}

if (!(Get-Command 'boxstarter' -ErrorAction SilentlyContinue)) {
  Write-Error @'
You need Boxstarter to run this script; install with:
. { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force; refreshenv
'@
  Exit
}

#--- Windows Update ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -AcceptEula


if ((Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").ReleaseId -lt 1803) {
  Write-Error 'You need to run Windows Update and install Feature Updates to at least version 1803'
  Exit
}

#--- Windows Subsystems/Features ---
choco install Microsoft-Hyper-V-All -source WindowsFeatures -y
choco install Microsoft-Windows-Subsystem-Linux -source WindowsFeatures -y

ECHO Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

ECHO Configure chocolatey

choco feature enable -n allowGlobalConfirmation

ECHO Installing Windows Apps
ECHO Installing WSL2
choco install wsl2
ECHO Installing Ubuntu 2004
choco install wsl-ubuntu-2004
ECHO Installing Windows Terminal
choco install microsoft-windows-terminal

ECHO Installing Insomnia
choco install insomnia-rest-api-client

# -- Visual Studio Code
choco install VisualStudioCode
refreshenv
code --install-extension coenraads.bracket-pair-colorizer-2
code --install-extension dbaeumer.vscode-eslint
code --install-extension ritwickdey.liveserver