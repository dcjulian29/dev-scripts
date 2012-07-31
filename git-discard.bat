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

IF "%1" == "" GOTO FILEERROR
IF NOT EXIST %1 GOTO FILEERROR

GOTO CONTINUE

:FILEERROR

echo.
echo The file does not exist.
echo.

GOTO EOF

:CONTINUE

%git% checkout %1

:EOF
