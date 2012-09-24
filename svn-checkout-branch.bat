:: Checkout a branch of a project
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd
CALL %DEVT%\_svn_LoadSettings.cmd YES
call C:\bin\development-tools\_ask-project-directory.cmd NO .svn %1
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
