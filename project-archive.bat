@echo off
setlocal
call %~dp0_dev_settings.cmd

for %%A in (%CD:\= %) do set PROJNAME=%%A

set ERR=%ERRORLEVEL%
if %ERR% neq 0 exit /b %ERRORLEVEL%

set SDIR=%CD%\
set DDIR=..\%PROJNAME%.7z

if not exist %DDIR% goto DOARCHIVE

echo.
echo This project has already been archived, please delete or rename the archive and try again.
echo.

popd

GOTO EOF

:DOARCHIVE

call %DEVT%\project-clean-all.bat

echo.
echo Archiving %PROJNAME%...

call %ZIP% a -t7z -mx9 -y -r %DDIR% .

:EOF

popd

endlocal
