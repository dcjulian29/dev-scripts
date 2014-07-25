@echo off
setlocal
call %~dp0_dev_settings.cmd

set PATH=%TOOLAPP%\ravendb-smuggler;%PATH%

%TOOLAPP%\ravendb-smuggler\Raven.Smuggler.exe %*

endlocal
