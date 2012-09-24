:: Merge development branch into master after updating from SVN.
@echo off

setlocal

call C:\bin\development-tools\_dev_settings.cmd
call C:\bin\development-tools\_ask-project-directory.cmd YES .git %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

pushd %DEVF%\%PROJNAME%

set SDIR=%DEVF%\%PROJNAME%

echo.
echo Updating %PROJNAME% with changes from SVN...
echo.

%GIT% stash

%GIT% checkout master

call %DEVT%\git-backup-remove.bat >NUL

echo.
echo Backup project (Just In Case)...
echo.

call %DEVT%\git-backup.bat >NUL

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
