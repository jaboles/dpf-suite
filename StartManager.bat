@echo off
start wizmo quiet play=welcome.wav
banner "Welcome!"

echo Starting scheduler...
start /min "Scheduler" "C:\Program Files\American Systems\EZ Scheduler\EZScheduler.exe"
echo Done!

echo Waiting 40 seconds for network to connect...
:: wait 40 seconds
ping 127.0.0.1 -n 40 > NUL
echo Done!

:: connect to the downstairs photo server
echo Starting server connection...
net use p: \\192.168.0.5\Photos blahblahblah /PERSISTENT:NO > NUL
echo Done!

echo Starting server connection...
start /min cmd /c USBMonitor.bat
echo Done!

:: Starting slideshow...
echo Starting slideshow...
wizmo quiet blank
echo Done!
