@echo off
start wizmo quiet play=copystart.wav
banner "Pls wait,"
banner "files are"
ping 127.0.0.1 -n 4 > NUL
cls
banner "being"
banner "copied!"
ping 127.0.0.1 -n 4 > NUL
cls

:: The purpose of 'start /wait cmd /c <command>' is to open the copying in a
:: new window in front of everything else, so that it's easy to see when it's finished.
:: /S = recurse subdirs
:: /R = set retry count for failures, default is (stupidly) 1 million
:: /W = set retry wait for failures, default is (stupidly) 30sec
:: /XO = exclude older files, in case 2 copies of the script try to copy concurrently.
robocopy d:\ p:\ *.jpg /S /R:0 /W:0 /XO /XD .Trashes

:: Unmount the USB drive. RemoveDrive is from:
::    http://www.uwe-sieber.de/usbstick_e.html
removedrive d: -l

cls
start wizmo quiet play=copydone.wav
banner "File copy"
banner "done..."
ping 127.0.0.1 -n 4 > NUL
cls
banner "Now safe"
banner "to unplug"
ping 127.0.0.1 -n 20 > NUL
cls
wizmo quiet blank