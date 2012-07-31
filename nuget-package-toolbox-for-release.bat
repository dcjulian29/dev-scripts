:: Publish ToolBox libraries to their nuget package source folders
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.bat

SET SDIR=%DEVF%\ToolBox

pushd %SDIR%

%SDIR%\build.bat release.package

popd

echo Now publish the NuGet packages.
