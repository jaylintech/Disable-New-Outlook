@echo off
setlocal enableextensions
net session >nul 2>&1 || (echo ERROR: Run as Administrator & pause & exit /b 1)

echo Applying Outlook registry settings...

set "BASE=HKCU\Software\Microsoft\Office\16.0\Outlook"
set "REG=REG ADD"
set "DWORD=/t REG_DWORD /f"

%REG% "%BASE%\Options\General" /v HideNewOutlookToggle          %DWORD% /d 1
%REG% "%BASE%\Options\General" /v DoNewOutlookAutoMigration      %DWORD% /d 0
%REG% "%BASE%\Options\General" /v NewOutlookAutoMigrationRetryIntervals %DWORD% /d 0
%REG% "%BASE%\Preferences"     /v UseNewOutlook                  %DWORD% /d 0

set "POL=HKCU\Software\Policies\Microsoft\Office\16.0\Outlook"
%REG% "%POL%\Options\General"  /v HideNewOutlookToggle           %DWORD% /d 1

if %errorlevel% equ 0 (
    echo All settings applied successfully.
) else (
    echo WARNING: One or more settings may have failed.
    pause
)
