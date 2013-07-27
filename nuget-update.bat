@echo off

setlocal

call %SYSTEMDRIVE%\bin\development-tools\_dev_settings.cmd

%DEVT%\nuget\nuget.exe update -Self

endlocal
