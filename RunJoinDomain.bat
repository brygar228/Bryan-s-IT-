@echo off
setlocal

:: Define the script name
set "PS_ScriptName=Join_Domain2.ps1"
set "PS_FullScriptPath=%~dp0%PS_ScriptName%"

:: Check for Administrative privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo [SUCCESS] Running with Administrative privileges.
    
    :: Execute the PowerShell script
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%PS_FullScriptPath%"
) else (
    echo [INFO] Requesting Administrative privileges...
    
    :: Relaunch this batch file as Administrator
    powershell.exe -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

pause