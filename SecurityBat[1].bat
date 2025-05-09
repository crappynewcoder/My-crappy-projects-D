@echo off
echo Starting Basic Vulnerability Scan...

:: Check for Windows Updates
echo Checking if Windows Update service is enabled...
sc qc wuauserv | findstr /I "START_TYPE"
if %errorlevel% equ 0 (
    echo Windows Update service is enabled.
) else (
    echo WARNING: Windows Update service is not enabled. Enable it for security patches.
)

:: Check if Firewall is enabled
echo Checking if Windows Firewall is enabled...
netsh advfirewall show allprofiles state | findstr /I "ON"
if %errorlevel% equ 0 (
    echo Windows Firewall is enabled.
) else (
    echo WARNING: Windows Firewall is not enabled. Enable it for added protection.
)

:: Check for Antivirus software (using Windows Defender as an example)
echo Checking for Antivirus status...
sc query Windefend | findstr /I "STATE"
if %errorlevel% equ 0 (
    echo Windows Defender Antivirus is running.
) else (
    echo WARNING: Antivirus software is not running. Make sure you have an antivirus solution.
)

:: Check for Unnecessary Services Running
echo Checking for unnecessary services running...
netstat -an | findstr "LISTENING"
if %errorlevel% equ 0 (
    echo Some services are listening. Review which services are open.
) else (
    echo No unnecessary services are currently listening.
)

:: Check if System Restore is Enabled (important for recovery)
echo Checking if System Restore is enabled...
vssadmin list shadowstorage
if %errorlevel% equ 0 (
    echo System Restore is enabled.
) else (
    echo WARNING: System Restore is not enabled. Enable it for system recovery in case of attack.
)

:: Check for missing critical security patches (Windows Update status)
echo Checking for Windows Update status...
wuauclt /detectnow
echo Windows Update status should be checked for missing critical patches.
pause
exit
