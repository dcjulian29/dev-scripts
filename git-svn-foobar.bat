:: Restore the GIT backup over a foobar SVN commit.
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.bat

if exist "%CD%\.git" GOTO GITDIR

echo.
echo This directory does not contain a GIT repository
echo.
echo.
GOTO EOF

:GITDIR

SET BVER=%date:~-4,4%%date:~-10,2%%date:~-7,2%

SET PROJNAME=
FOR %%A in (%CD:\= %) DO SET PROJNAME=%%A

SET SDIR=%TEMP%\%PROJNAME%-backup-%BVER%
SET DDIR=%DEVF%\%PROJNAME%
SET FDIR=%TEMP%\%PROJNAME%-foobar-%BVER%

IF NOT EXIST %SDIR% GOTO NOBACK

echo.
echo Restoring from backup...
echo.

robocopy %DDIR% %FDIR% /MIR /Z

RM -f -r %DDIR%/*

robocopy %SDIR% %DDIR% /MIR /Z 

GOTO EOF

:NOBACK
echo.
echo This project does not contain a backup for today
echo.

:EOF
