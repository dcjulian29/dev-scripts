@echo off

setlocal

if exist "%CD%\.git" GOTO GITDIR

echo.
echo This directory does not contain a GIT repository...
echo.

goto EOF

:GITDIR

if [%1] == [] goto NOTAGPROVIDED

call %~dp0_dev_settings.cmd

%GIT% tag '%1'
%GIT% push origin '%1'

goto EOF

:NOTAGPROVIDED

echo.
echo Provide the release name to tag this repository with...
echo.

:EOF

endlocal
