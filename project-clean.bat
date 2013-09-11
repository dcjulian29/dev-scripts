@echo off
setlocal
call %~dp0_dev_settings.cmd

if not exist %CD%\build.xml GOTO NOBUILDXML

echo.
echo      Cleaning Build Outputs...
echo.

%NANT% -buildfile:%SDIR%\build.xml clean

:NOBUILDXML

:NOVSSOLUTION

:EOF

endlocal
