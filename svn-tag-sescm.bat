:: tag a project with a version string
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.bat

SET TAGVER=v%date:~-4,4%%date:~-10,2%%date:~-7,2%
SET PROJNAME=ToolBox2

SET /p NV="What tag/version are we adding to this project [%TAGVER%]? "
IF "" neq "%NV%" SET TAGVER=%NV% 

SET /p NP="What is the name of the project [%PROJNAME%]? "
IF "" neq "%NP%" SET PROJNAME=%NP% 

:: Trim input
SET PROJNAME=%PROJNAME: =%
SET TAGVER=%TAGVER: =%


echo.
echo.
echo.
echo Tagging %PROJNAME% with %TAGVER%...

%SVN% copy %REPO%/%PROJNAME%/trunk %REPO%/%PROJNAME%/tags/%TAGVER% -m "Tagging %PROJNAME% with %TAGVER%"

echo.
echo Done.
echo.
