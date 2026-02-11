@echo off
setlocal

:: 1. Set the name of your new script
set "PS_ScriptName=Change_PC_Name.ps1"
set "PS_FullScriptPath=%~dp0%PS_ScriptName%"

:: 2. Check for Administrative privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo [SUCCESS] Running ChangeName with Admin rights...
    
    :: 3. Execute the PowerShell script
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%PS_FullScriptPath%"
) else (
    echo [INFO] Requesting Administrative privileges...
    
    :: Relaunch this batch file as Administrator
    powershell.exe -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

pause