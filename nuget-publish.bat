@echo off
setlocal
call %~dp0_dev_settings.cmd

if [%1] NEQ [] goto PROCEED

echo.
echo Please provide the package name to publish
echo.

goto EOF

:PROCEED

if exist "%1" GOTO PUBLISH

echo.
echo The specified package does not exists.
echo.

goto EOF

:PUBLISH

call %DEVT%\_nuget_LoadSettings.cmd YES
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

%SYSTEMDRIVE%\Tools\apps\nuget\nuget.exe push %1 %NUGET-API% -Source %NUGET-URL%

:EOF

endlocal
