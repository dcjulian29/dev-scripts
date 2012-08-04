:: Checkout a project
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd

SET PROJNAME=ToolBox2

SET /p NP="What is the name of the project [%PROJNAME%]? "
IF "" neq "%NP%" SET PROJNAME=%NP% 

:: Trim input
SET PROJNAME=%PROJNAME: =%

echo.
echo.
echo.
echo Checking out %PROJNAME%...

%SVN% co %REPO%/%PROJNAME%/trunk %DEVF%\%PROJNAME%

echo.
echo Done.
echo.
