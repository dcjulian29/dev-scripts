@echo off
setlocal
call %~dp0_dev_settings.cmd

CALL %DEVT%\_svn_LoadSettings.cmd YES
call %DEVT%\_ask-project-directory.cmd NO .svn %1

if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

SET /p TAGVER="What tag do you what to checkout? "
IF "" equ "%TAGVER%" EXIT
SET TAGVER=%TAGVER: =%

echo.
echo.
echo.
echo Checking out %PROJNAME% with the tag %TAGVER%...

%SVN% co %SVN-URL%/%PROJNAME%/tags/%TAGVER% %DEVF%\%PROJNAME%-%TAGVER%

echo.
echo Done.
echo.
