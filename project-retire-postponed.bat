:: Retire a development project
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.bat

IF "%1" == "" GOTO PROVIDEPROJECT

GOTO CONTINUE

:PROVIDEPROJECT

ECHO.
ECHO Please provide the project name.
ECHO.

GOTO EOF

:CONTINUE

SET SDIR=%DEVP%\%1.7z

IF EXIST %SDIR% GOTO SETUPVAR

ECHO.
ECHO Postponed project does not exist.
ECHO.

GOTO EOF

:SETUPVAR

SET DDIR=%DEVR%\%1.7z

IF NOT EXIST %DDIR% GOTO DOARCHIVE

echo.
echo This project has already been retired, please delete or rename the archive and try again.
echo.
GOTO EOF

:DOARCHIVE

echo Retiring %SDIR%...

move "%SDIR%" "%DDIR%"

:EOF
