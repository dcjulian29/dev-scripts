@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd

FOR %%A in (%CD:\= %) DO SET PROJNAME=%%A
SET PROJDIR=%CD%

PUSHD %DEVF%

SET PD=%PROJDIR:~0,2%
SET DD=%DEVF:~0,2%

IF [%PD%] == [%DD%] GOTO JUNCTION

:SYMLINK

MKLINK /D %PROJNAME% %PROJDIR%

GOTO EOF

:JUNCTION

MKLINK /J %PROJNAME% %PROJDIR%

:EOF
echo.
