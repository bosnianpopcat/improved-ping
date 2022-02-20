@echo off
color f0
title Ping 2.1
echo Type 1 and press Enter for GUI mode (looks better, but runs slower)
echo Type 2 and press Enter for NoGUI mode (looks worse, but runs faster)
echo NoGUI mode is compatible with older operating systems
echo and systems with no PowerShell.

set /p chooseGUI=
cls
if %chooseGUI% == 1 goto gui
if %chooseGUI% == 2 goto nongui

:gui
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter the URL of the website you want to ping:', 'Ping 2.0')}" > %TEMP%\out.tmp
set /p OUT=<%TEMP%\out.tmp
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter the number of times you want to ping the website(deafult is 3)', 'Ping 2.0')}" > %TEMP%\out2.tmp
set /p OUT2=<%TEMP%\out2.tmp
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter the size of the pings(in bytes)(deafult is 32 bytes)', 'Ping 2.0')}" > %TEMP%\out3.tmp
set /p OUT3=<%TEMP%\out3.tmp

ping.exe %OUT% -n %OUT2% -l %OUT3%
pause
exit

:nongui
set /p url= "Enter the URL of the website you want to ping: "
set /p num= "Enter the number of times you want to ping the website(deafult is 3): "
set /p size= "Enter the size of the pings(in bytes)(deafult is 32 bytes): "
echo Pinging %url% %num% times...
ping.exe %url% -n %num% -l %size%
pause
exit

