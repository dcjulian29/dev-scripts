@echo off
setlocal
call %~dp0_dev_settings.cmd

set PATH=%TOOLAPP%\octopus;%PATH%

if [%1] NEQ [] goto PROCEED

%TOOLAPP%\octopus\octo.exe

goto EOF

:PROCEED

call %DEVT%\_octo_LoadSettings.cmd YES
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

%TOOLAPP%\octopus\octo.exe %* --server %OCTOPUS-URL% --apiKey %OCTOPUS-API%

:EOF

endlocal
