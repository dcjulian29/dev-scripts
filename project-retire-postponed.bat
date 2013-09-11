@echo off

setlocal

call C:\bin\development-tools\_dev_settings.cmd

set SDIR=%DEVP%\%1.7z

if exist %SDIR% goto SETUPVAR

echo.
echo Postponed project does not exist.
echo.

goto EOF

:SETUPVAR

set DDIR=%DEVR%\%1.7z

if not exist %DDIR% goto DOARCHIVE

echo.
echo This project has already been retired, please delete or rename the archive and try again.
echo.
goto EOF

:DOARCHIVE

echo Retiring %SDIR%...

move "%SDIR%" "%DDIR%"

:EOF
