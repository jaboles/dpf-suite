@echo off
:start
:: Main batch loop

:: Delay a little while (couple of seconds)
ping 127.0.0.1 -n 2 > NUL

:: If the USB drive is connected, snaffle all the JPEGs off it
if exist d:/ start /wait cmd /c snafflepix

:: Loop back to beginning
goto start
