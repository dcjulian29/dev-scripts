@echo off

setlocal

call C:\bin\development-tools\_dev_settings.cmd
call %DEVT%\_tfs_LoadSettings.cmd YES
call %DEVT%\_tfs_Command.cmd

set TFCMD=%TFCMD% workspaces
set TFCMD=%TFCMD% /collection:"%TFS-URL%" %*

%TFCMD%
