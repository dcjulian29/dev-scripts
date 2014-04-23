@echo off
setlocal
call %~dp0_dev_settings.cmd

if not exist %SYSTEMDRIVE%\etc\tfs\_common.bat goto LOADPROFILE

call %SYSTEMDRIVE%\etc\tfs\_common.bat

goto EXECUTE

:LOADPROFILE

call %TOOLDEV%\_tfs_LoadSettings.cmd YES

:EXECUTE

call %TOOLDEV%\_tfs_Command.cmd

set TFCMD=%TFCMD% workspaces
set TFCMD=%TFCMD% /collection:"%TFS-URL%/%TFS-COLLECTION%" /format:detailed

%TFCMD%

endlocal
