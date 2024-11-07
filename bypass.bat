@echo off
setlocal

set "ruleName=Packet Tracer Bypass by ottersec"
set "ruleDesc=A simple rule to bypass Cisco Packet Tracer Login"
set "ruleProfile=any"
set "ruleAction=block"
set "ruleEnabled=yes"
set "packetTracerPath="

for /f "tokens=*" %%i in ('dir /b /s /a:d "C:\Program Files\Cisco Packet Tracer*" 2^>nul') do (
    if exist "%%i\bin\PacketTracer.exe" (
        set "packetTracerPath=%%i\bin\PacketTracer.exe"
        goto :found
    )
)

:found
if not defined packetTracerPath (
    echo [ottersec] PacketTracer.exe not found in Program Files directory.
    exit /b 1
)

echo [ottersec] PacketTracer.exe found at: %packetTracerPath%

netsh advfirewall firewall add rule ^
    name="%ruleName%" ^
    description="%ruleDesc%" ^
    dir=out ^
    action=%ruleAction% ^
    enable=%ruleEnabled% ^
    profile=%ruleProfile% ^
    program="%packetTracerPath%" ^
    protocol=any ^
    localip=any ^
    remoteip=any

if %errorlevel% equ 0 (
    echo [ottersec] Firewall rule created successfully.
) else (
    echo [ottersec] Failed to create firewall rule.
)

endlocal
pause
