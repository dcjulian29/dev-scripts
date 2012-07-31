:: Publish ToolBox libraries to their nuget package source folders
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.bat

SET SDIR=%DEVF%\nuget-packages\build.bat

pushd %DEVF%\nuget-packages\

CALL %SDIR% ToolBox push.local
CALL %SDIR% ToolBox.Data.Dataflow push.local
CALL %SDIR% ToolBox.Data.NHibernate push.local
CALL %SDIR% ToolBox.Wpf push.local

popd