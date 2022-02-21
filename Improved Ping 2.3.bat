@echo off
color 07
title Improved Ping 2.3
echo Type 1 for GUI mode (newer systems)
echo Type 2 for NoGUI mode (older systems)
echo NoGUI mode is compatible with older operating systems.
set /p chooseGUI=
cls
if %chooseGUI% == 1 goto gui
if %chooseGUI% == 2 goto nogui

:gui
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter the URL of the website you want to ping:', 'Improved Ping 2.3')}" > %TEMP%\out.tmp
set /p OUT=<%TEMP%\out.tmp
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter the number of times you want to ping the website:', 'Improved Ping 2.3')}" > %TEMP%\out2.tmp
set /p OUT2=<%TEMP%\out2.tmp
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter the size of the pings (in bytes):', 'Improved Ping 2.3')}" > %TEMP%\out3.tmp
set /p OUT3=<%TEMP%\out3.tmp
ping.exe %OUT% -n %OUT2% -l %OUT3%
pause
exit

:nogui
set /p url= "Enter the URL of the website you want to ping: "
set /p num= "Enter the number of times you want to ping the website: "
set /p size= "Enter the size of the pings (in bytes): "
cls
echo Pinging %url% %num% times...
ping.exe %url% -n %num% -l %size%
pause
exit

