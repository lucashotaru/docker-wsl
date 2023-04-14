Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;

wsl --update

wsl --unregister docker-desktop-data
wsl --unregister docker-desktop

Copy-Item -Path "${PWD}\wslconfig" -Destination "C:\Users\$env:USERNAME\.wslconfig"

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

$ip_address = wsl hostname -i
$host_name = "wsldocker"
Add-Content -Path "C:\Windows\System32\drivers\etc\hosts" -Value "$ip_address    $host_name"

wsl --shutdown