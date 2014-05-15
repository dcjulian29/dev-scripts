@echo off

setlocal

call %~dp0_dev_settings.cmd

dir %SYSTEMDRIVE%\etc\octo\*.cmd /b /p

endlocal
