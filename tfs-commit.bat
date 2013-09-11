@echo off
setlocal
call %~dp0_dev_settings.cmd

call %DEVT%\_tfs_Command.cmd

set TFCMD=%TFCMD% checkin

%TFCMD%

:EOF
