@echo off
setlocal
call %~dp0_dev_settings.cmd

set PROJNAME=
for %%A in (%CD:\= %) do set PROJNAME=%%A

set SDIR=%DEVF%\%PROJNAME%
set DDIR=%DEVR%\%PROJNAME%.7z

if not exist %DDIR% goto DOARCHIVE

echo.
echo This project has already been retired, please delete or rename the archive and try again.
echo.
GOTO EOF

:DOARCHIVE

call %DEVT%\project-clean.bat

cd ..

echo.
echo Retiring %PROJNAME%...

%ZIP% a -t7z -mx9 -y -r  %DDIR% %SDIR%

rmdir /Q /S %SDIR%

:EOF

endlocal
