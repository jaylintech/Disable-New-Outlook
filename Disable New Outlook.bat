@echo off
REM Set registry values for Outlook and Windows Update

REM ----- CURRENT USER KEYS -----
REG ADD "HKCU\Software\Microsoft\Office\16.0\Outlook\Options\General" /v HideNewOutlookToggle /t REG_DWORD /d 1 /f
REG ADD "HKCU\Software\Microsoft\Office\16.0\Outlook\Options\General" /v DoNewOutlookAutoMigration /t REG_DWORD /d 0 /f
REG ADD "HKCU\Software\Microsoft\Office\16.0\Outlook\Options\General" /v NewOutlookAutoMigrationRetryIntervals /t REG_DWORD /d 0 /f

REG ADD "HKCU\Software\Policies\Microsoft\Office\16.0\Outlook\Options\General" /v HideNewOutlookToggle /t REG_DWORD /d 1 /f

REG ADD "HKCU\Software\Microsoft\Office\16.0\Outlook\Preferences" /v UseNewOutlook /t REG_DWORD /d 0 /f

echo.
echo Registry settings applied.
pause