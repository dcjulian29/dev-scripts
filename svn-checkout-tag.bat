:: Checkout a specific tag of project 
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd
CALL %DEVT%\_svn_LoadSettings.cmd YES

SET PROJNAME=ToolBox2

SET /p NP="What is the name of the project [%PROJNAME%]? "
IF "" neq "%NP%" SET PROJNAME=%NP% 

SET /p TAGVER="What tag do you what to checkout? "
IF "" equ "%TAGVER%" EXIT
:: Trim input
SET PROJNAME=%PROJNAME: =%
SET TAGVER=%TAGVER: =%


echo.
echo.
echo.
echo Checking out %PROJNAME% with the tag %TAGVER%...

%SVN% co %SVN-URL%/%PROJNAME%/tags/%TAGVER% %DEVF%\%PROJNAME%-%TAGVER%

echo.
echo Done.
echo.
