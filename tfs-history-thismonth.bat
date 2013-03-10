@echo off

setlocal

call C:\bin\development-tools\_dev_settings.cmd

set YEAR=%date:~-4,4%
set MONTH=%date:~-10,2%
set FROMDAY=1
set TODAY=%date:~-7,2%

set FILTER=/version:D%YEAR%-%MONTH%-%FROMDAY%~D%YEAR%-%MONTH%-%TODAY%

call %DEVT%\tfs-history.bat %1 %FILTER% *
