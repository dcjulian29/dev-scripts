:: Backup a GIT repository
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

SET SDIR=%DEVF%\%PROJNAME%
SET DDIR=%TEMP%\%PROJNAME%-backup-%BVER%

IF NOT EXIST %DDIR% GOTO DOBACK

echo.
echo This project already has a backup for today, please delete the backup and try again.
echo.
GOTO EOF

:DOBACK

echo.
echo Backing up %PROJNAME%...
echo.

MKDIR %DDIR%

xcopy %SDIR% %DDIR% /E /V /H 


:EOF
