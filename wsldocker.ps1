# dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
# dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Invoke-WebRequest -Uri 'https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi' -OutFile 'C:\wsl_update_x64.msi'
# Start-Process -FilePath 'C:\wsl_update_x64.msi' -Wait
# Remove-Item -Path "C:\wsl_update_x64.msi"

# Start-Process wsl.exe "--install -d ubuntu" 

# wsl --update

wsl sudo apt -y update 
wsl sudo apt -y upgrade

wsl sudo apt install -y apt-transport-https
wsl sudo apt install -y ca-certificate
wsl sudo apt install -y curl
wsl sudo apt install -y gnupg
wsl sudo apt install -y lsb-release

wsl curl -fsSL https://get.docker.com -o get-docker.sh 
wsl sudo sh ./get-docker.sh