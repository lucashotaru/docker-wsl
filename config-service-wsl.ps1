New-Service -Name "WSL - Startup" -BinaryPathName "C:\Windows\System32\wsl.exe -d ubuntu -u root /etc/init.sh" -Description "Inicio do wsl automatico"
