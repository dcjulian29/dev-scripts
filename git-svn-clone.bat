:: Create and clone a project from SVN Repository
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd
CALL %DEVT%\_svn_LoadSettings.cmd YES

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

%GIT% svn clone %SVN-URL%/%PROJNAME% --authors-file=%DEVT:\=/%%SVN-AUTHORSFILE% -s --prefix=svn/ %DEVF%\%PROJNAME%

pushd %DEVF%\%PROJNAME%

echo.
echo Fixing tags...
xcopy /E /I /Y .git\refs\remotes\tags\* .git\refs\tags\

echo.
echo Removing SVN branches that contain the revision number (ie. trunk@8190)...
FOR /R .git\refs\remotes %%X IN (*@*) DO (DEL %%X)

echo.
echo Copying remote branches to local repository...
xcopy /E /I /Y .git\refs\remotes\* .git\refs\heads\

echo.
echo Optimizing GIT repository...
%GIT% repack -d
%GIT% gc

popd

echo.
echo Done.
echo.

:EOF
