@echo off
setlocal
call %~dp0_dev_settings.cmd

call %DEVT%\_check-scm.cmd .git
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

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

"%GIT%" checkout %1

:EOF

endlocal
