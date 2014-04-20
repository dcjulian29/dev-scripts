@echo off

setlocal

call %~dp0_dev_settings.cmd

set PROMPT=YES
if [%1] NEQ [] set PROMPT=NO

call %DEVT%\_tfs_LoadSettings.cmd %PROMPT% %1
call %DEVT%\_tfs_Command.cmd

echo.
echo.
echo Updating %TFS-NS%...
echo.

set TFCMD=%TFCMD% get
set TFCMD=%TFCMD% "%TFS-NS%"
set TFCMD=%TFCMD% /recursive

%TFCMD%

endlocal
