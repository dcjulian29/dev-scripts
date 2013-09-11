@echo off
setlocal
call %~dp0_dev_settings.cmd

dir %DEVT%\%1*.bat /d /p

endlocal
