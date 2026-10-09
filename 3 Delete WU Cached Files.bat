@echo off
rem Clears Windows Update's downloaded files, then starts the update services again.
rem Your update history (SoftwareDistribution\DataStore) is kept.

net session >nul 2>&1
if errorlevel 1 (
    echo Please right-click this file and choose "Run as administrator".
    pause
    exit /b 1
)

echo Stopping update services...
net stop wuauserv >nul 2>&1
net stop UsoSvc >nul 2>&1
net stop bits >nul 2>&1
net stop dosvc >nul 2>&1

set "DL=%SystemRoot%\SoftwareDistribution\Download"
if exist "%DL%\" (
    echo Deleting downloaded update files...
    del /f /s /q "%DL%\*" >nul 2>&1
    for /d %%S in ("%DL%\*") do rd /s /q "%%S" >nul 2>&1
)

echo Starting update services...
net start dosvc >nul 2>&1
net start bits >nul 2>&1
net start UsoSvc >nul 2>&1
net start wuauserv >nul 2>&1

echo.
echo Done.
pause
