@echo off

setlocal

set NUPKG=%1

set CURRENT=%CD%
set SOURCE=%~dp1
cd /D %SOURCE%
set SOURCE=%CD%
cd %CURRENT%

if [%NUPKG:NUPKG=%] EQU [%NUPKG%] goto JUSTPACKAGE

echo.
echo Provide just the package name, not the name of the package file.
echo.

goto EOF

:JUSTPACKAGE

if exist "%NUPKG%*" GOTO PACKAGE

echo.
echo The specified nuget/chocolatey package does not exists.
echo.

goto EOF

:PACKAGE

cinst %NUPKG% -source "%SOURCE%" -verbose -debug

endlocal

:EOF
