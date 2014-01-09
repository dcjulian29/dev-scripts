@echo off
setlocal
call %~dp0_dev_settings.cmd

if [%1] NEQ [] goto PROCEED

%DEVT%\Octopus\octo.exe
goto EOF

:PROCEED

call %DEVT%\_octo_LoadSettings.cmd YES
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

set PATH=%DEVT%\Octopus;%PATH%

%SYSTEMDRIVE%\Tools\apps\octopus\octo.exe %* --server %OCTOPUS-URL% --apiKey %OCTOPUS-API%

:EOF

endlocal
