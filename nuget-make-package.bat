@echo off

setlocal

call %SYSTEMDRIVE%\bin\development-tools\_dev_settings.cmd

set PKG=

if [%1] EQU [] GOTO DEFAULTPACKAGE

set PKG=%1

goto PROCEED

:DEFAULTPACKAGE

set PKG=package.nuspec

:PROCEED

if exist "%PKG%" GOTO PACKAGE

echo.
echo The specified package specification does not exists.
echo.

goto EOF

:PACKAGE

%DEVT%\nuget\nuget.exe pack %PKG% -Verbosity detailed

endlocal
