@echo off
setlocal
call %~dp0_dev_settings.cmd

call %DEVT%\_ask-project-name.cmd YES %1

set ERR=%ERRORLEVEL%
if %ERR% neq 0 exit /b %ERRORLEVEL%

set FVER=%date:~-4,4%%date:~-10,2%%date:~-7,2%
set SDIR=%DDIR%
set DDIR=%SDIR%\..\%PROJNAME%.%FVER%.7z

if not exist %DDIR% goto DOCOPY

echo.
echo This project has already been copied, please delete or rename the copy file and try again.
echo.
goto EOF

:DOCOPY

cd %SDIR%
call %DEVT%\project-clean.bat
cd ..

echo.
echo Copying %PROJNAME% to %DDIR%...

%ZIP% a -t7z -mx9 -y -r  %DDIR% %SDIR%

:EOF

endlocal
