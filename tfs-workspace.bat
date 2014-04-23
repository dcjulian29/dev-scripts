@echo off
setlocal
call %~dp0_dev_settings.cmd
call %SYSTEMDRIVE%\etc\tfs\_common.bat
call %DEVT%\_tfs_Command.cmd

set TFCMD=%TFCMD% workspaces
set TFCMD=%TFCMD% /collection:"%TFS-URL%/%TFS-COLLECTION%" /format:detailed

%TFCMD%

endlocal
