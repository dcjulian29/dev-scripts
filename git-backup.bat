@echo off
setlocal
call %~dp0_dev_settings.cmd

if exist "%CD%\.git" GOTO GITDIR

echo.
echo This directory does not contain a GIT repository
echo.
echo.
GOTO EOF

:GITDIR

set BVER=%date:~-4,4%%date:~-10,2%%date:~-7,2%
for %%A in (%CD:\= %) do set PROJNAME=%%A

set SDIR=%CD%
set DDIR=%TEMP%\%PROJNAME%-backup-%BVER%

if not exist %DDIR% goto DOBACK

echo.
echo This project already has a backup for today, please delete the backup and try again.
echo.
goto EOF

:DOBACK

echo.
echo Backing up %PROJNAME%...
echo.

mkdir %DDIR%

robocopy %SDIR% %DDIR% /MIR /Z /SL /MT /XJ /R:5 /W:5

:EOF
