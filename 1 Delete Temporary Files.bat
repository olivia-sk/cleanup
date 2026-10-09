@echo off
rem Empties your temp folder and the Windows temp folder.
rem Only the contents are deleted; the folders and their permissions are left alone.

net session >nul 2>&1
if errorlevel 1 (
    echo Please right-click this file and choose "Run as administrator".
    pause
    exit /b 1
)

if not defined TEMP (
    echo Could not find your temp folder. Nothing was deleted.
    pause
    exit /b 1
)

for %%D in ("%TEMP%" "%SystemRoot%\Temp") do (
    if exist "%%~D\" (
        echo Cleaning %%~D
        del /f /s /q "%%~D\*" >nul 2>&1
        for /d %%S in ("%%~D\*") do rd /s /q "%%S" >nul 2>&1
    )
)

echo.
echo Done. Files that running programs are using were skipped.
pause
