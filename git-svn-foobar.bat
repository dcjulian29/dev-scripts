:: Restore the GIT backup over a foobar SVN commit.
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd
call C:\bin\development-tools\_ask-project-directory.cmd YES .git %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

SET BVER=%date:~-4,4%%date:~-10,2%%date:~-7,2%
SET SDIR=%TEMP%\%PROJNAME%-backup-%BVER%
SET DDIR=%DEVF%\%PROJNAME%
SET FDIR=%TEMP%\%PROJNAME%-foobar-%BVER%

IF NOT EXIST %SDIR% GOTO NOBACK

echo.
echo Restoring from backup...
echo.

robocopy %DDIR% %FDIR% /MIR /Z

rm -f -r %DDIR%/*

robocopy %SDIR% %DDIR% /MIR /Z 

GOTO EOF

:NOBACK
echo.
echo This project does not contain a backup for today
echo.

:EOF
