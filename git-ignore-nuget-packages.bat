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

SET PROJNAME=
FOR %%A in (%CD:\= %) DO SET PROJNAME=%%A

SET SDIR=%DEVF%\%PROJNAME%

echo.
echo Adding an exclusion for NuGet Packages in this project...
echo.

call %DEVT%\git-add-ignore [Pp]ackages/

:EOF
