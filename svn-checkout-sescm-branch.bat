:: Checkout a branch of a project
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.bat

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

%SVN% co %REPO%/%PROJNAME%/branchs/%BRANCH% %DEVF%\%PROJNAME%-%BRANCH%

echo.
echo Done.
echo.
