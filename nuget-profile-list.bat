@echo off

setlocal

call %~dp0_dev_settings.cmd

dir %DEVT%\NuGet\*.cmd /b /p

endlocal
