:: Publish local nuget packages to the marriott nuget server
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd

SET SDIR=%DEVF%\nuget-packages\_packages
SET DDIR=\\HDQNCVMESE1\packages

echo.
echo Copying NuGet packages to Marriott NuGet package directory...
echo.

robocopy %SDIR% %DDIR% /MIR /Z

:EOF
