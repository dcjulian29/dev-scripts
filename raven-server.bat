@echo off
setlocal
call %~dp0_dev_settings.cmd

set PATH=%TOOLAPP%\ravendb-server;%PATH%

if [%1] NEQ [] goto PROCEED

%TOOLAPP%\ravendb-server\Raven.Server.exe --debug --browser

goto EOF

:PROCEED

%TOOLAPP%\ravendb-server\Raven.Server.exe %*

:EOF

endlocal
