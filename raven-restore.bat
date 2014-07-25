@echo off
setlocal
call %~dp0_dev_settings.cmd

set PATH=%TOOLAPP%\ravendb-server;%PATH%

if [%1][%2] NEQ [][] goto PROCEED

echo.
echo Please provide the source directory of the backup and the database name to restore it to.
echo.

goto EOF

:PROCEED

if exist "C:\data\raven\Databases\%2" rmdir /S /Q "C:\data\raven\Databases\%2"

%TOOLAPP%\ravendb-server\Raven.Server.exe -src %1 -dest C:\data\raven\Databases\%2 -restore

:EOF

endlocal
