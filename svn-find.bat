:: find a project with a non-case sensitive search
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd
CALL %DEVT%\_svn_LoadSettings.cmd YES

SET PROJNAME=%1

IF NOT "%PROJNAME%" == "" GOTO TRIMINPUT

SET /p NP="What is the name of the project [%PROJNAME%]? "
IF "" neq "%NP%" SET PROJNAME=%NP% 

:TRIMINPUT

SET PROJNAME=%PROJNAME: =%

SET OUTPUT=%TEMP%\%PROJNAME%-FIND.txt


echo.
echo.
echo.
echo Looking for %PROJNAME%...

echo.
echo    REV  Author                Date         Project Name  > %OUTPUT%
echo    --------------------------------------------------------------  >> %OUTPUT%
%SVN% list -v %SVN-URL% | %WINDIR%\System32\find.exe /I "%PROJNAME%"  >> %OUTPUT%

echo.
echo.
cat %OUTPUT%
echo.
echo Done.
echo.
