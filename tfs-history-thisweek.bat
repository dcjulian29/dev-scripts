@echo off

setlocal

call C:\bin\development-tools\_dev_settings.cmd

set YEAR=%date:~-4,4%
set MONTH=%date:~-10,2%
set FROMDAY=%date:~-7,2%
set TODAY=%date:~-7,2%
set DAYOFWEEK=%date:~0,3%

if %DAYOFWEEK% == Mon set DAYOFWEEK=0
if %DAYOFWEEK% == Tue set DAYOFWEEK=1
if %DAYOFWEEK% == Wed set DAYOFWEEK=2
if %DAYOFWEEK% == Thu set DAYOFWEEK=3
if %DAYOFWEEK% == Fri set DAYOFWEEK=4
if %DAYOFWEEK% == Sat set DAYOFWEEK=5
if %DAYOFWEEK% == Sun set DAYOFWEEK=6

set /A "FROMDAY=FROMDAY-DAYOFWEEK"

set FILTER=/version:D%YEAR%-%MONTH%-%FROMDAY%~D%YEAR%-%MONTH%-%TODAY%

call %DEVT%\tfs-history.bat %1 %FILTER% *
