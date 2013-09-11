@echo off

setlocal

call C:\bin\development-tools\_dev_settings.cmd

set PROJNAME=
for %%A in (%CD:\= %) do set PROJNAME=%%A

set SDIR=%DEVF%\%PROJNAME%
set DDIR=%DEVP%\%PROJNAME%.7z

if not exist %DDIR% goto DOPOSTPONE

echo.
echo This project has already been postponed, please delete or rename the file and try again.
echo.
GOTO EOF

:DOPOSTPONE

call %DEVT%\project-clean.bat

cd ..

echo.
echo Postponing %PROJNAME%...

%ZIP% a -t7z -mx9 -y -r  %DDIR% %SDIR%

rmdir /Q /S %SDIR%

:EOF

endlocal
