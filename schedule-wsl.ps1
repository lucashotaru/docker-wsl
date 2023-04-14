$Action = New-ScheduledTaskAction -Execute 'C:\Windows\System32\wsl.exe' -Argument '-d ubuntu -u root /etc/init.sh'
$Trigger = New-ScheduledTaskTrigger -AtStartup
$TaskName = "Run Ubuntu on Startup"
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger
Register-ScheduledTask -InputObject $Task