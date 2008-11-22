@echo off
start wizmo quiet play=macstartup.wav
banner "Welcome!"

echo Starting scheduler...
start /min "Scheduler" "C:\Program Files\American Systems\EZ Scheduler\EZScheduler.exe"
echo Done!

echo Waiting for network to connect...
:: wait for network to connect
::ping 127.0.0.1 -n 15 > NUL
:retryping
ping 192.168.0.11 -n 2 | find "TTL=" > NUL
echo Network Errorlevel: %errorlevel%
if errorlevel 1 goto retryping
echo Done!

:: connect to the downstairs photo server
echo Starting server connection...
:retryserverconnection
ping 127.0.0.1 -n 6 > NUL
net use p: \\192.168.0.11\Photos yessyess /PERSISTENT:NO > NUL
echo File-share Errorlevel: %errorlevel%, retrying...
if errorlevel 1 goto retryserverconnection
echo Done!

echo Starting server connection...
start /min cmd /c USBMonitor.bat
echo Done!

:: Starting slideshow...
echo Starting slideshow...
wizmo quiet blank
echo Done!
