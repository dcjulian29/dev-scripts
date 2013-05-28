@echo off

setlocal

call C:\bin\development-tools\_dev_settings.cmd

%DEVT%\nuget\nuget.exe update -Self