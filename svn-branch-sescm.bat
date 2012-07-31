:: branch a project
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.bat

SET BRANCH=v%date:~-4,4%%date:~-7,2%%date:~-10,2%
SET PROJNAME=ToolBox2

SET /p NV="What branch do you want to add to this project [%BRANCH%]? "
IF "" neq "%NV%" SET BRANCH=%NV% 

SET /p NP="What is the name of the project [%PROJNAME%]? "
IF "" neq "%NP%" SET PROJNAME=%NP% 

:: Trim input
SET PROJNAME=%PROJNAME: =%
SET BRANCH=%BRANCH: =%

echo.
echo.
echo.
echo Branching %PROJNAME% with %BRANCH%...

%SVN% copy %REPO%/%PROJNAME%/trunk %REPO%/%PROJNAME%/tags/%BRANCH% -m "Branching %PROJNAME% with %BRANCH%"

echo.
echo Done.
echo.
