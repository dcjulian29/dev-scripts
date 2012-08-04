:: Copy a development project to the directory that is shared with the Marriott Standard Desktop VM
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd

SET PROJNAME=
FOR %%A in (%CD:\= %) DO SET PROJNAME=%%A

SET SDIR=%DEVF%\%PROJNAME%
SET DDIR=C:\Users\jeast836\Dropbox\%PROJNAME%

IF NOT EXIST %DDIR% GOTO DOCOPY

echo.
echo This project already has been copied, please delete the copy and try again.
echo.
GOTO EOF

:DOCOPY

echo.
echo Copying %PROJNAME% to Marriott VM Directory...
echo.

MKDIR %DDIR%

robocopy %SDIR% %DDIR% /MIR /Z

:EOF
