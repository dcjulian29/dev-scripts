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

call %DEVT%\NuGet\_loadSettings.cmd YES
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

set PATH=%DEVT%\NuGet;%PATH%

%DEVT%\NuGet\nuget.exe push %1 %NUGET-API% -Source %NUGET-URL%

:EOF

endlocal
