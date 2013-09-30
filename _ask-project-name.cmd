:: %1 -- Should Project Directory exist?
:: %2 -- Project Name

if [%1] == [] goto ERROR
if [%2] == [] goto PROVIDENAME

set PROJNAME=%2
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

SET DDIR=%CD%\%PROJNAME%

:: Should project directory exist?
IF [%1] == [YES] GOTO YESPROJ
IF [%1] == [NO] GOTO NOPROJ
GOTO ERROR

:YESPROJ

IF EXIST "%DDIR%" GOTO EOF

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

:ERROR

echo.
echo This script was called with missing parameters...
echo.

exit /B 5

:EOF

exit /B 0
