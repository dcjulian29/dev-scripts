@echo off
setlocal
call %~dp0_dev_settings.cmd

call %DEVT%\_ask-project-directory.cmd YES .git %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

pushd %DEVF%\%PROJNAME%

call %DEVT%\git-backup-remove.bat >NUL

echo.
echo Backup project (Just In Case)...
echo.

call %DEVT%\git-backup.bat >NUL

echo.
echo Commiting project to TFS: %PROJNAME%
::if [%2] neq [] echo                Work Item: %2
echo.

set TFS-COMMAND=tfs rcheckin
::if [%2] neq [] set TFS-COMMAND=%TFS-COMMAND% --work-item %2
:: With multiple local commits being pushed to TFS, the work-item gets set on
:: the first commit... might be better to use checkintool for this situation
call "%GIT%" %TFS-COMMAND%

echo.
choice /C:YN /M "Was the commit successful"
set RESULT=%ERRORLEVEL%
echo.

if %RESULT% EQU 1 call %DEVT%\git-backup-remove.bat

popd

:EOF
