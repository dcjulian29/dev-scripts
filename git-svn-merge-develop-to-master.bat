:: Merge development branch into master after updating from SVN.
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.bat

if exist "%CD%\.git" GOTO GITDIR

echo.
echo This directory does not contain a GIT repository
echo.
echo.
GOTO EOF

:GITDIR

SET PROJNAME=
FOR %%A in (%CD:\= %) DO SET PROJNAME=%%A

SET SDIR=%DEVF%\%PROJNAME%

echo.
echo Updating %PROJNAME% with changes from SVN...
echo.

%GIT% stash

%GIT% checkout master

CALL %DEVT%\git-backup-remove.bat >NUL

echo.
echo Backup project (Just In Case)...
echo.

CALL %DEVT%\git-backup.bat >NUL

echo.
echo Updating project from subversion: %PROJNAME%
echo.

%GIT% svn rebase

echo.
CHOICE /C:YN /M "Was the update successful"
SET RESULT=%ERRORLEVEL%
echo.

IF %RESULT% EQU 2 GOTO EOF

echo.
echo Merging Development branch into Master branch...
echo.

%GIT% checkout develop
%GIT% rebase master
%GIT% checkout master
%GIT% merge --ff develop

%GIT% checkout develop
%GIT% stash pop

:EOF
