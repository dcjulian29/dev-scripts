@echo off

setlocal

echo.
echo.
echo Clearing cache for TFS...
echo.

set TFAPP=%USERPROFILE%\AppData\Local\Microsoft\Team Foundation

call :REMOVECACHE 2.0
call :REMOVECACHE 3.0
call :REMOVECACHE 4.0

goto EOF

:REMOVECACHE

%SYSTEMDRIVE%\bin\dir-rm.bat %TFAPP%\%1\Cache
mkdir %TFAPP%\%1\Cache

:EOF
