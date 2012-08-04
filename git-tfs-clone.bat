:: Create and clone a project from a TFS Repository
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd
CALL %DEVT%\_tfs_LoadSettings.cmd YES

IF "%1" == "" GOTO PROVIDEPROJECT

SET PROJNAME=%1
GOTO CONTINUE

:PROVIDEPROJECT

SET PROJNAME=ToolBox2

SET /p NP="What is the name of the project [%PROJNAME%]? "
IF "" neq "%NP%" SET PROJNAME=%NP% 

:CONTINUE

:: Trim input
SET PROJNAME=%PROJNAME: =%

SET DDIR=%DEVF%\%PROJNAME%

IF NOT EXIST %DDIR% GOTO DOCLONE

echo.
echo This project has already been cloned, please delete or rename the project and try again.
echo.

GOTO EOF

:DOCLONE

echo.
echo.
echo.
echo Cloning %PROJNAME%...

%GIT% tfs clone %TFS-URL%/%TFS-COLLECTION% $/%PROJNAME% %DEVF%\%PROJNAME%

pushd %DEVF%\%PROJNAME%


echo.
echo.
echo Fixing tags...
xcopy /E /I /Y .git\refs\remotes\tags\* .git\refs\tags\

echo.
echo.
echo Copying remote branches to local repository...
xcopy /E /I /Y .git\refs\remotes\* .git\refs\heads\

echo.
echo.
echo Cleaning GIT repository...
%GIT% gc

popd

echo.
echo Done.
echo.

:EOF
