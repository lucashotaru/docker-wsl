Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;

wsl --update

Copy-Item -Path "${PWD}\wslconfig" -Destination "C:\Users\$env:USERNAME\.wslconfig"

Start-Process wsl.exe "--install -d ubuntu" -Wait

wsl --unregister docker-desktop-data
wsl --unregister docker-desktop

wsl sudo apt -y update 
wsl sudo apt -y upgrade

wsl sudo apt install -y apt-transport-https
wsl sudo apt install -y ca-certificate
wsl sudo apt install -y curl
wsl sudo apt install -y gnupg
wsl sudo apt install -y lsb-release

wsl sudo sh ./get-docker.sh
wsl sudo cp ./wsl.conf /etc/wsl.conf
wsl sudo cp ./init.sh /etc/init.sh
wsl sudo chmod +x /etc/init.sh

wsl apt install net-tools

$ip_address = wsl hostname -i

if ($ip_address -eq "127.0.1.1") {
    $ip_address = wsl hostname -I
}

$ip_address = $ip_address.replace('127.0.1.1', '')

$host_name = "wsldocker"
Add-Content -Path "C:\Windows\System32\drivers\etc\hosts" -Value "$ip_address    $host_name"

powershell.exe .\schedule-wsl.ps1
powershell.exe .\docker-portainer.ps1
powershell.exe .\uninstall-docker-desktop.ps1

wsl --shutdown