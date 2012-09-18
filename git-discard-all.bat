@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd

IF "%1" == "" GOTO PROVIDEPROJECT

SET PROJNAME=%1
GOTO CONTINUE

:PROVIDEPROJECT

SET PROJNAME=
FOR %%A in (%CD:\= %) DO SET PROJNAME=%%A

:CONTINUE

SET PROJNAME=%PROJNAME: =%
SET DDIR=%DEVF%\%PROJNAME%

if exist "%DDIR%\.git" GOTO GITDIR

echo.
echo This directory does not contain a GIT repository
echo.
echo.
GOTO EOF

:GITDIR

IF EXIST %DDIR% GOTO CHECKGIT

echo.
echo This project does not exist.
echo.

GOTO EOF

:CHECKGIT

pushd %DEVF%\%PROJNAME%

if exist "%CD%\.git" GOTO GITDIR

echo.
echo This directory does not contain a GIT repository
echo.
echo.
GOTO EOF

:GITDIR

echo.
CHOICE /C:YN /M "Are you sure that you want to discard all changes"
SET RESULT=%ERRORLEVEL%
echo.

IF %RESULT% EQU 1 GOTO DISCARDWORK

GOTO EOF

:DISCARDWORK

pushd %DDIR%

echo.
echo Discarding all changes in this project...
echo.

%git% reset HEAD
%git% stash save --keep-index
%git% stash drop

popd

:EOF
