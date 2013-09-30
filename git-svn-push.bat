@echo off
setlocal
call %~dp0_dev_settings.cmd

call %DEVT%\_check-scm.cmd .git
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

call %DEVT%\git-backup-remove.bat >NUL

echo.
echo Backup project (Just In Case)...
echo.

call %DEVT%\git-backup.bat >NUL

echo.
echo Commiting project to subversion: %PROJNAME%
echo.

call %GIT% svn dcommit --rmdir

echo.
CHOICE /C:YN /M "Was the commit successful"
SET RESULT=%ERRORLEVEL%
echo.

IF %RESULT% EQU 1 call %DEVT%\git-backup-remove.bat

:EOF

endlocal
