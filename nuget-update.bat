@echo off
setlocal
call %~dp0_dev_settings.cmd

%DEVT%\nuget\nuget.exe update -Self

endlocal
