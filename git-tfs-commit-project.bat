@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.bat

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
echo Commiting project to TFS: %PROJNAME%
::if [%2] neq [] echo                Work Item: %2
echo.

set TFS-COMMAND=tfs rcheckin
::if [%2] neq [] set TFS-COMMAND=%TFS-COMMAND% --work-item %2
:: With multiple local commits being pushed to TFS, the work-item gets set on
:: the first commit... might be better to use checkintool for this situation
CALL %GIT% %TFS-COMMAND%

echo.
CHOICE /C:YN /M "Was the commit successful"
SET RESULT=%ERRORLEVEL%
echo.

IF %RESULT% EQU 1 CALL %DEVT%\git-backup-remove.bat

popd

:EOF
