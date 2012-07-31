:: Create and imports a project from Marriott SVN Repository to a local repository
:: The local repository will not have any references to the SVN Repository afterwards.
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.bat

SET PROJNAME=ToolBox2

SET REPO=https://sescm.marriott.com/svn
SET GIT=%DEVT%\msysgit\bin\git.exe

SET /p NP="What is the name of the project [%PROJNAME%]? "
IF "" neq "%NP%" SET PROJNAME=%NP% 

:: Trim input
SET PROJNAME=%PROJNAME: =%


echo.
echo.
echo.
echo Importing %PROJNAME%...

%GIT% svn clone %REPO%/%PROJNAME% --authors-file=%DEVT%\svn-users-mi.txt --no-metadata -s %DEVF%\%PROJNAME%

pushd %DEVF%\%PROJNAME%

echo.
echo.
echo.
echo Fixing tags...
xcopy /E /I /Y .git\refs\remotes\tags\* .git\refs\tags\
rmdir /S /Q .git\refs\remotes\tags

echo.
echo.
echo.
echo Fixing branches...
xcopy /E /I /Y .git\refs\remotes\* .git\refs\heads\
rmdir /S /Q .git\refs\remotes

popd

echo.
echo Done.
echo.

pause