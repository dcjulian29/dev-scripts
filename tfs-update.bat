@echo off
setlocal
call %~dp0_dev_settings.cmd

call %DEVT%\_tfs_LoadSettings.cmd YES
call %DEVT%\_tfs_Command.cmd

if [%2] == [*] goto JUSTFILTER

set PROJNAME=%1
set FILTER=%2
goto C5

:JUSTFILTER

set PROJNAME=
set FILTER=%1

:C5

echo.
echo.
echo Updating %TFS-NS%/%PROJNAME%...
echo.

set TFCMD=%TFCMD% get
set TFCMD=%TFCMD% "%TFS-NS%/%PROJNAME%"
set TFCMD=%TFCMD% /recursive

%TFCMD%

:EOF
