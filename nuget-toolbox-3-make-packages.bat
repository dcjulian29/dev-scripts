@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd

SET BUILD=%DEVF%\nuget-packages\build.bat

pushd %DEVF%\nuget-packages\

CALL %BUILD% ToolBox
CALL %BUILD% ToolBox.Aspects
CALL %BUILD% ToolBox.Data.Dataflow
CALL %BUILD% ToolBox.Data.EntityFramework
CALL %BUILD% ToolBox.Data.NHibernate
CALL %BUILD% ToolBox.Wpf

popd