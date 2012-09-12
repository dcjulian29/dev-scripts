:: Publish ToolBox libraries to their nuget package source folders
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd

SET SDIR=%DEVF%\ToolBox\build
SET DDIR=%DEVF%\nuget-packages


:: ToolBox
copy /Y /V %SDIR%\ToolBox.dll %DDIR%\ToolBox\src\lib\net40\
copy /Y /V %SDIR%\ToolBox.xml %DDIR%\ToolBox\src\lib\net40\
copy /Y /V %SDIR%\ToolBox.chm %DDIR%\ToolBox\src\content\


:: ToolBox.Data.Dataflow
copy /Y /V %SDIR%\ToolBox.Data.Dataflow.dll %DDIR%\ToolBox.Data.Dataflow\src\lib\net40\
copy /Y /V %SDIR%\ToolBox.Data.Dataflow.xml %DDIR%\ToolBox.Data.Dataflow\src\lib\net40\


:: ToolBox.Data.NHibernate
copy /Y /V %SDIR%\ToolBox.Data.NHibernate.dll %DDIR%\ToolBox.Data.NHibernate\src\lib\net40\
copy /Y /V %SDIR%\ToolBox.Data.NHibernate.xml %DDIR%\ToolBox.Data.NHibernate\src\lib\net40\


:: ToolBox.Wpf
copy /Y /V %SDIR%\ToolBox.Wpf.dll %DDIR%\ToolBox.Wpf\src\lib\net40\
copy /Y /V %SDIR%\ToolBox.Wpf.xml %DDIR%\ToolBox.Wpf\src\lib\net40\


:: Get Version Number of ToolBox
pushd %DEVF%\ToolBox

%NANT% -buildfile:%DEVF%\ToolBox\build.xml version

:: Update NuGet Package Files...
if not exist %DEVF%\nuget-packages\tmp GOTO CONTMKDIR
rmdir /Q /S %DEVF%\nuget-packages\tmp

:CONTMKDIR
mkdir %DEVF%\nuget-packages\tmp

copy /Y /V %DEVF%\ToolBox\build\version.txt %DEVF%\nuget-packages\tmp\

IF EXIST %DEVF%\ToolBox\.git GOTO GIT
IF EXIST %DEVF%\ToolBox\.svn GOTO SVN

echo Unable to determine source control engine...
GOTO EOF

:GIT
echo "GIT" > %DEVF%\nuget-packages\tmp\git
GOTO CONTNANT

:SVN
echo "SVN" > %DEVF%\nuget-packages\tmp\svn
GOTO CONTNANT

:CONTNANT
popd

pushd %DEVF%\nuget-packages

%NANT% -buildfile:nuget-toolbox.xml update-nuget-toolbox-version

rmdir /Q /S %DEVF%\nuget-packages\tmp
popd

:EOF