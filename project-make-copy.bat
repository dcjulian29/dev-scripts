@echo off
setlocal
call %~dp0_dev_settings.cmd

set PROJNAME=
for %%A in (%CD:\= %) do set PROJNAME=%%A

set FVER=%date:~-4,4%%date:~-10,2%%date:~-7,2%
set SDIR=%DEVF%\%PROJNAME%
set DDIR=%DEVR%\%PROJNAME%.%FVER%.7z

if not exist %DDIR% goto DOCOPY

echo.
echo This project has already been copied, please delete or rename the copy file and try again.
echo.
goto EOF

:DOCOPY

call %DEVT%\project-clean.bat

echo.
echo Copying %PROJNAME% to %DDIR%...

%ZIP% a -t7z -mx9 -y -r  %DDIR% %SDIR%

:EOF

endlocal
