:: Create and clone a project from Marriott SVN Repository
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.bat

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

%GIT% svn clone %REPO%/%PROJNAME% --authors-file=%DEVT%\svn-users-mi.txt -s %DEVF%\%PROJNAME%

pushd %DEVF%\%PROJNAME%

echo.
echo.
echo Adding Global Ignores to project...
CALL %DEVT%\git-add-global-ignores.bat

echo.
echo.
echo Fixing tags...
xcopy /E /I /Y .git\refs\remotes\tags\* .git\refs\tags\

echo.
echo.
echo Removing SVN branches that contain the revision number (ie. trunk@8190)...
FOR /R .git\refs\remotes %%X IN (*@*) DO (DEL %%X)

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
