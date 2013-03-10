@echo off

setlocal

call C:\bin\development-tools\_dev_settings.cmd
call %DEVT%\_tfs_LoadSettings.cmd YES
call %DEVT%\_tfs_Command.cmd

if [%2] == [*] goto JUSTFILTER

set PROJNAME=%1
set FILTER=%2
goto C5

:JUSTFILTER

set PROJNAME=
set FILTER=%1

:C5

if not [%PROJNAME%] == [] goto C1

::echo No project specified... Getting history for entire namespace.

:C1

echo.
echo.
echo Getting history for %TFS-NS%/%PROJNAME%...
echo.

set TFCMD=%TFCMD% history
set TFCMD=%TFCMD% /server:"%TFS-URL%/%TFS-COLLECTION%" "%TFS-NS%/%PROJNAME%"
set TFCMD=%TFCMD% /recursive /noprompt /sort:ascending

if [%FILTER%] == [] goto C4

set TFCMD=%TFCMD% %FILTER%

:C4

%TFCMD%

:EOF
