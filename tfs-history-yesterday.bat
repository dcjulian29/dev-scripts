@echo off
setlocal
call %~dp0_dev_settings.cmd

set YEAR=%date:~-4,4%
set MONTH=%date:~-10,2%
set FROMDAY=%date:~-7,2%
set TODAY=%date:~-7,2%

set /A "FROMDAY=FROMDAY-1"

set FILTER=/version:D%YEAR%-%MONTH%-%FROMDAY%~D%YEAR%-%MONTH%-%TODAY%

call %DEVT%\tfs-history.bat %1 %FILTER% *
