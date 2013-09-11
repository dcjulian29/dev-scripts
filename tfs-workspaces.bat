@echo off
setlocal
call %~dp0_dev_settings.cmd

call %DEVT%\_tfs_LoadSettings.cmd YES
call %DEVT%\_tfs_Command.cmd

set TFCMD=%TFCMD% workspaces
set TFCMD=%TFCMD% /collection:"%TFS-URL%" %*

%TFCMD%
