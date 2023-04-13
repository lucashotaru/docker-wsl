Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

$arquivo = "${PWD}\wsl_update_x64.msi"

Invoke-WebRequest -Uri "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi" -OutFile $arquivo
Start-Process -FilePath $arquivo -Wait
Remove-Item -Path $arquivo

Copy-Item -Path "${PWD}\wslconfig" -Destination "C:\Users\$env:USERNAME\.wslconfig"

wsl --update

Start-Process wsl.exe "--install -d ubuntu" -Wait

wsl sudo apt -y update 
wsl sudo apt -y upgrade

wsl sudo apt install -y apt-transport-https
wsl sudo apt install -y ca-certificate
wsl sudo apt install -y curl
wsl sudo apt install -y gnupg
wsl sudo apt install -y lsb-release

wsl sudo sh ./get-docker.sh
wsl sudo cp ./wsl.conf /etc/wsl.conf
wsl --shutdown