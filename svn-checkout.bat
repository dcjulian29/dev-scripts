@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd
CALL %DEVT%\_svn_LoadSettings.cmd YES
call C:\bin\development-tools\_ask-project-directory.cmd NO .svn %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

echo.
echo.
echo.
echo Checking out %PROJNAME%...

%SVN% co %SVN-URL%/%PROJNAME%/trunk %DEVF%\%PROJNAME%

echo.
echo Done.
echo.
