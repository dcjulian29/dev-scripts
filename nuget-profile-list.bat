@echo off

setlocal

call %~dp0_dev_settings.cmd

dir %DEVT%\NuGet\_nuget_*.cmd /b /p

endlocal
