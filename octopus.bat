@echo off

setlocal

call %SYSTEMDRIVE%\bin\development-tools\_dev_settings.cmd

if [%1] NEQ [] goto PROCEED

%DEVT%\Octopus\octo.exe
goto EOF

:PROCEED

call %DEVT%\Octopus\_loadSettings.cmd YES
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

set PATH=%DEVT%\Octopus;%PATH%

%DEVT%\Octopus\octo.exe %* --server %OCTOPUS-URL% --apiKey %OCTOPUS-API%

:EOF

endlocal
