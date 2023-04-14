Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

$arquivo = "${PWD}\wsl_update_x64.msi"

Invoke-WebRequest -Uri "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi" -OutFile $arquivo
Start-Process -FilePath $arquivo -Wait
Remove-Item -Path $arquivo

$msg = "O seu computador irá reiniciar em 30 segundos. Para cancelar o reinício, digite 'parar'."
Write-Host $msg
$countdown = 30
do {
    Write-Host "Reiniciando em $countdown segundos..."
    Start-Sleep -Seconds 1
    $countdown--
    $stop = Read-Host
    if ($stop -eq "parar") {
        Write-Host "O reinício foi cancelado."
        exit
    }
} while ($countdown -ge 0)

Restart-Computer -Force