@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd

IF "%1" == "" GOTO PROVIDEPROJECT

SET PROJNAME=%1
GOTO CONTINUE

:PROVIDEPROJECT

SET PROJNAME=ToolBox2

SET /p NP="What is the name of the project [%PROJNAME%]? "
IF "" neq "%NP%" SET PROJNAME=%NP% 

:CONTINUE

:: Trim input
SET PROJNAME=%PROJNAME: =%

SET DDIR=%DEVF%\%PROJNAME%

IF EXIST %DDIR% GOTO UPDATEPROJECT

echo.
echo This project does not exist.
echo.

GOTO EOF

:UPDATEPROJECT

pushd %DEVF%\%PROJNAME%

if exist "%CD%\.git" GOTO GITDIR

echo.
echo This directory does not contain a GIT repository
echo.
echo.
GOTO EOF

:GITDIR

CALL %DEVT%\git-backup-remove.bat >NUL

echo.
echo Backup project (Just In Case)...
echo.

CALL %DEVT%\git-backup.bat >NUL

echo.
echo Updating project from TFS: %PROJNAME%
echo.

CALL %GIT% tfs pull

echo.
CHOICE /C:YN /M "Was the update successful"
SET RESULT=%ERRORLEVEL%
echo.

IF %RESULT% EQU 1 CALL %DEVT%\git-backup-remove.bat

popd

:EOF
