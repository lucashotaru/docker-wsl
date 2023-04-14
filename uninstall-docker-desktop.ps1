Get-Service -Name *docker* | Stop-Service -Force

Start-Process 'C:\Program Files\Docker\Docker\Docker Desktop Installer' -ArgumentList 'uninstall --force' -Wait

$directories = "${Env:ProgramData}\Docker", "${Env:ProgramFiles}\Docker", "${Env:ProgramFiles(x86)}\Docker", "${Env:UserProfile}\AppData\Roaming\Docker", "${Env:UserProfile}\AppData\Roaming\Docker Desktop", "${Env:UserProfile}\AppData\Local\Docker"

foreach ($directory in $directories) {
    if (Test-Path $directory) {
        Remove-Item -Recurse -Force $directory
    }
}

Write-Host "Docker Desktop foi desinstalado."