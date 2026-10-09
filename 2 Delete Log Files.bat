@echo off
rem Deletes .log files older than 7 days from Windows' log folder and the temp folders.
rem It no longer searches the whole drive, because some apps (browsers, Discord,
rem Windows Search) keep data in .log files.

net session >nul 2>&1
if errorlevel 1 (
    echo Please right-click this file and choose "Run as administrator".
    pause
    exit /b 1
)

for %%D in ("%SystemRoot%\Logs" "%SystemRoot%\Temp" "%TEMP%") do (
    if exist "%%~D\" (
        echo Cleaning old logs in %%~D
        forfiles /p "%%~D" /s /m *.log /d -7 /c "cmd /c del /f /q @path" >nul 2>&1
    )
)

echo.
echo Done. Logs that are in use were skipped.
pause
