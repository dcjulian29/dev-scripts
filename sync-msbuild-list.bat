@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd

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
