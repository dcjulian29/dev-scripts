@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd
call C:\bin\development-tools\_ask-project-directory.cmd YES .git %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

pushd %DEVF%\%PROJNAME%

CALL %DEVT%\git-backup-remove.bat >NUL

echo.
echo Backup project (Just In Case)...
echo.

CALL %DEVT%\git-backup.bat >NUL

echo.
echo Commiting project to subversion: %PROJNAME%
echo.

CALL %GIT% svn dcommit --rmdir

echo.
CHOICE /C:YN /M "Was the commit successful"
SET RESULT=%ERRORLEVEL%
echo.

IF %RESULT% EQU 1 CALL %DEVT%\git-backup-remove.bat

popd

:EOF
