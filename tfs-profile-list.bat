@echo off

setlocal

call %~dp0_dev_settings.cmd

dir %SYSTEMDRIVE%\etc\tfs\*.cmd /b /p

endlocal
