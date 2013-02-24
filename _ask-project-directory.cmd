:: %1 -- Should Project Directory exist?
:: %2 -- SCM folder to exist
:: %3 -- Project Name
if [%1] == [] goto ERROR
if [%2] == [] goto ERROR
if [%3] == [] goto PROVIDENAME

set PROJNAME=%3
goto CONTINUE

:PROVIDENAME

SET PROJNAME=
FOR %%A in (%CD:\= %) DO SET PROJNAME=%%A

SET /p NP="What is the name of the project [%PROJNAME%]? "
IF "" neq "%NP%" SET PROJNAME=%NP% 

:CONTINUE

call :TRIMPROJ %PROJNAME%
goto CHECKDIR

:TRIMPROJ

set PROJNAME=%*
SET PROJNAME=%PROJNAME:"=%
goto EOF

:CHECKDIR

SET DDIR=%DEVF%\%PROJNAME%

:: Should project directory exist?
IF [%1] == [YES] GOTO YESPROJ
IF [%1] == [NO] GOTO NOPROJ
GOTO ERROR

:YESPROJ

IF EXIST "%DDIR%" GOTO CHECKSCM

echo.
echo The project directory does not exist.
echo.

exit /B 1

:NOPROJ

IF NOT EXIST "%DDIR%" GOTO EOF

echo.
echo The project directory already exists.
echo.

exit /B 2

:CHECKSCM

if [%2] == [NA] goto EOF
if exist "%DDIR%\%2" goto EOF

echo.
echo This project does not contain the proper source control information.
echo.

exit /B 3

:ERROR

echo.
echo This script was called with missing parameters...
echo.

exit /B 5

:EOF

exit /B 0
