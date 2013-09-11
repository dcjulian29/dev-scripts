@echo off
setlocal
call %~dp0_dev_settings.cmd

%DEVT%\vs-common.cmd 2012 %*

endlocal
