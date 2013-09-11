@echo off
setlocal
call %~dp0_dev_settings.cmd

CALL %DEVT%\_svn_LoadSettings.cmd YES

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

%SVN% copy %SVN-URL%/%PROJNAME%/trunk %SVN-URL%/%PROJNAME%/tags/%TAGVER% -m "Tagging %PROJNAME% with %TAGVER%"

echo.
echo Done.
echo.
