@echo off
setlocal
call %~dp0_dev_settings.cmd

call %DEVT%\_ask-project-name.cmd YES %1

set ERR=%ERRORLEVEL%
if %ERR% neq 0 exit /b %ERRORLEVEL%

set SDIR=%DDIR%
set DDIR=%DEVR%\%PROJNAME%.7z

if not exist %DDIR% goto DOARCHIVE

echo.
echo This project has already been retired, please delete or rename the archive and try again.
echo.
GOTO EOF

:DOARCHIVE

cd %SDIR%
call %DEVT%\project-clean.bat
cd ..

echo.
echo Retiring %PROJNAME%...

%ZIP% a -t7z -mx9 -y -r  %DDIR% %SDIR%

rmdir /Q /S %SDIR%

:EOF

endlocal
