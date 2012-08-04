:: Checkout a branch of a project
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd
CALL %DEVT%\_svn_LoadSettings.cmd YES

SET PROJNAME=ToolBox2

SET /p NP="What is the name of the project [%PROJNAME%]? "
IF "" neq "%NP%" SET PROJNAME=%NP% 

SET /p BRANCH="What tag do you what to checkout? "
IF "" equ "%BRANCH%" EXIT
:: Trim input
SET PROJNAME=%PROJNAME: =%
SET BRANCH=%BRANCH: =%

echo.
echo.
echo.
echo Checking out %PROJNAME% with the tag %BRANCH%...

%SVN% co %SVN-URL%/%PROJNAME%/branches/%BRANCH% %DEVF%\%PROJNAME%-%BRANCH%

echo.
echo Done.
echo.
