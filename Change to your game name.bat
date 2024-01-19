@echo off
setlocal

:: Save the original resolution
echo Saving original resolution...
set original_width=1920
set original_height=1080

:: Set the new desired resolution
echo Set new desired resolution...
set width=1280
set height=720

:: Change the screen resolution using QRes
echo Changing resolution using QRes...
qres.exe /x:%width% /y:%height%

:: Run your program or executable (replace 'your_program.exe' with the path to your executable)
echo Running the program...
start "Your Game" "C:/Games/your_game_location.exe"

:WAITFORPROGRAM (replace 'your_game.exe' with the executable name, look on Task Manager)
:: Wait for the program to complete
echo Waiting for program completion...
timeout /t 1 /nobreak >nul
tasklist | find "your_game.exe" >nul
if %errorlevel% equ 0 goto WAITFORPROGRAM

:: Restore the original resolution (1920x1080)
echo Restoring original resolution...
qres.exe /x:%original_width% /y:%original_height%
echo Completed.