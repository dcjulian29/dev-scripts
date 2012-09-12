@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd

SET SDIR=%DEVF%\nuget-packages\build.bat

pushd %DEVF%\nuget-packages\

CALL %SDIR% ToolBox
CALL %SDIR% ToolBox.Data.Dataflow
CALL %SDIR% ToolBox.Data.NHibernate
CALL %SDIR% ToolBox.Wpf

popd