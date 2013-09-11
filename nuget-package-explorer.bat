@echo off
setlocal
call %~dp0_dev_settings.cmd

start %DEVT%\nuget\NuGetPackageExplorer.application
