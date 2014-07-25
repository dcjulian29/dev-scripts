@echo off
setlocal
call %~dp0_dev_settings.cmd

set PATH=%TOOLAPP%\ravendb-backup;%PATH%

%TOOLAPP%\ravendb-backup\Raven.Backup.exe %*

endlocal
