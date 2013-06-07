@echo off

setlocal

set FVER=%date:~-4,4%%date:~-10,2%%date:~-7,2%

call C:\bin\development-tools\_dev_settings.cmd

if "%1" == "" GOTO PROVIDEPROJECT

if [%1] == [--this] goto THISDIR
if [%1] == [-this] goto THISDIR

goto CONTINUE

:PROVIDEPROJECT

echo.
echo Please provide the project name.
echo.

goto EOF

:CONTINUE

if exist %DEVF%\%1 GOTO SETUPVAR

:NOPROJ

ECHO.
ECHO Project directory does not exist.
ECHO.

GOTO EOF

:THISDIR

IF "%2" == "" GOTO PROVIDEPROJECT
IF NOT EXIST %CD%\%2 GOTO NOPROJ

SET SDIR=%CD%\%2
SET DDIR=%DEVR%\%2.%FVER%.7z

IF EXIST %DDIR% GOTO ALREADYCOPIED

pushd %SDIR%

goto DOARCHIVE

:SETUPVAR

PUSHD %1

SET PROJNAME=
FOR %%A in (%CD:\= %) DO SET PROJNAME=%%A

SET SDIR=%DEVF%\%PROJNAME%
SET DDIR=%DEVR%\%PROJNAME%.%FVER%.7z

IF NOT EXIST %DDIR% GOTO DOCOPY

:ALREADYCOPIED

echo.
echo This project has already been copied, please delete or rename the copy file and try again.
echo.
GOTO EOF

:DOCOPY

POPD

echo.
echo Copying %PROJNAME% to %DDIR%...

if not exist %SDIR%\build.xml GOTO NOBUILDXML

echo.
echo      Cleaning Build Outputs...
echo.

%NANT% -buildfile:%SDIR%\build.xml clean

:NOBUILDXML

%ZIP% a -t7z -mx9 -y -r  %DDIR% %SDIR%

:EOF
