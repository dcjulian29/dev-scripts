:: Copy a development project from the directory that is shared with the Marriott Standard Desktop VM
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd

SET PROJNAME=
FOR %%A in (%CD:\= %) DO SET PROJNAME=%%A

SET SDIR=C:\Users\jeast836\Dropbox\%PROJNAME%
SET DDIR=%DEVF%\%PROJNAME%

IF EXIST %SDIR% GOTO DOCOPY

echo.
echo This project does not have a copy, please create the copy and try again.
echo.
GOTO EOF

:DOCOPY

echo.
echo Copying %PROJNAME% from Marriott VM Directory...
echo.

robocopy %SDIR% %DDIR% /MIR /Z

:EOF
