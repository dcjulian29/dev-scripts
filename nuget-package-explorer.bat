@echo off

setlocal

call C:\bin\development-tools\_dev_settings.cmd

start %DEVT%\nuget\NuGetPackageExplorer.application
