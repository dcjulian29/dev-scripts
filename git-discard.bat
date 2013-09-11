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

IF "%1" == "" GOTO PROVIDEFILE
IF NOT EXIST %1 GOTO FILEERROR

GOTO CONTINUE

:PROVIDEFILE

echo.
echo Please provide a file name to discard.
echo.

GOTO EOF

:FILEERROR

echo.
echo The file does not exist.
echo.

GOTO EOF

:CONTINUE

%git% checkout %1

:EOF
