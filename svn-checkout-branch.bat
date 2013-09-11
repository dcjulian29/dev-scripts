@echo off
setlocal
call %~dp0_dev_settings.cmd

CALL %DEVT%\_svn_LoadSettings.cmd YES
call %DEVT%\_ask-project-directory.cmd NO .svn %1

if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

SET /p BRANCH="What branch do you what to checkout? "
IF "" equ "%BRANCH%" EXIT
SET BRANCH=%BRANCH: =%

echo.
echo.
echo.
echo Checking out the %BRANCH% of %PROJNAME%...

%SVN% co %SVN-URL%/%PROJNAME%/branches/%BRANCH% %DEVF%\%PROJNAME%-%BRANCH%

echo.
echo Done.
echo.
