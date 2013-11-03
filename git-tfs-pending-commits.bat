@echo off
setlocal
call %~dp0_dev_settings.cmd

call %DEVT%\_ask-project-directory.cmd YES .git %1

if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

pushd %DEVF%\%PROJNAME%

echo.
echo Pending commits to push to TFS:
echo.

"%GIT%" rev-list HEAD --not --remotes --pretty

popd

:EOF
