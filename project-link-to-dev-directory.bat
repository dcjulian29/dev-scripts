@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd

SET PROJNAME=
SET PROJDIR=

if "%1" == "" GOTO GETPROJ

SET PROJNAME=%1
SET PROJDIR=%CD%\%PROJNAME%

GOTO CONT

:GETPROJ
FOR %%A in (%CD:\= %) DO SET PROJNAME=%%A
SET PROJDIR=%CD%

:CONT

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
