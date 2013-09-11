@echo off
setlocal
call %~dp0_dev_settings.cmd

echo.
echo ----- MSBuild Scripts
echo.

dir /b .msbuild\*.xml

echo.
echo ----- CSharp Project Files
echo.

dir /b /s *.csproj

echo.

:EOF
