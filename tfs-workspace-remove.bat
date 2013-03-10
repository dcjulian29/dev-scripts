@echo off

setlocal

call C:\bin\development-tools\_dev_settings.cmd
call %DEVT%\_tfs_LoadSettings.cmd YES
call %DEVT%\_tfs_Command.cmd

set TFCMD=%TFCMD% workspace
set TFCMD=%TFCMD% /delete
set TFCMD=%TFCMD% /collection:"%TFS-URL%" %1

%TFCMD% 
