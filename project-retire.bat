@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd

IF "%1" == "" GOTO PROVIDEPROJECT

if [%1] == [--this] goto THISDIR
if [%1] == [-this] goto THISDIR

GOTO CONTINUE

:PROVIDEPROJECT

ECHO.
ECHO Please provide the project name.
ECHO.

GOTO EOF

:CONTINUE

IF EXIST %DEVF%\%1 GOTO SETUPVAR

:NOPROJ

ECHO.
ECHO Project directory does not exist.
ECHO.

GOTO EOF

:THISDIR

IF "%2" == "" GOTO PROVIDEPROJECT
IF NOT EXIST %CD%\%2 GOTO NOPROJ

SET SDIR=%CD%\%2
SET DDIR=%DEVR%\%2.7z

IF EXIST %DDIR% GOTO ALREADYRETIRED

pushd %SDIR%

goto DOARCHIVE

:SETUPVAR

PUSHD %1

SET PROJNAME=
FOR %%A in (%CD:\= %) DO SET PROJNAME=%%A

SET SDIR=%DEVF%\%PROJNAME%
SET DDIR=%DEVR%\%PROJNAME%.7z

IF NOT EXIST %DDIR% GOTO DOARCHIVE

:ALREADYRETIRED

echo.
echo This project has already been retired, please delete or rename the archive and try again.
echo.
GOTO EOF

:DOARCHIVE

popd

echo.
echo Retiring %PROJNAME%...

if not exist %SDIR%\build.xml GOTO NOBUILDXML

echo.
echo      Cleaning Build Outputs...
echo.

%NANT% -buildfile:%SDIR%\build.xml clean

:NOBUILDXML

%ZIP% a -t7z -mx9 -y -r  %DDIR% %SDIR%

if [%SDIR%] == [%CD%] cd ..

rmdir /Q /S %SDIR%

:EOF
