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

IF EXIST %DEVF%\%1 GOTO SETUPVAR

ECHO.
ECHO Project directory does not exist.
ECHO.

GOTO EOF


:SETUPVAR

PUSHD %1

SET PROJNAME=
FOR %%A in (%CD:\= %) DO SET PROJNAME=%%A

SET SDIR=%DEVF%\%PROJNAME%
SET DDIR=%DEVR%\%PROJNAME%.7z

IF NOT EXIST %DDIR% GOTO DOARCHIVE

echo.
echo This project has already been retired, please delete or rename the archive and try again.
echo.
GOTO EOF

:DOARCHIVE

POPD

echo.
echo Retiring %PROJNAME%...

if not exist %SDIR%\build.xml GOTO NOBUILDXML

echo.
echo      Cleaning Build Outputs...
echo.

%NANT% -buildfile:%SDIR%\build.xml clean

:NOBUILDXML

%ZIP% a -t7z -mx9 -y -r  %DDIR% %SDIR%

RMDIR /Q /S %SDIR%

:EOF
