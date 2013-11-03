:: %1 -- Should Project Directory exist?
:: %2 -- Project Name

if [%1] == [] goto ERROR
if [%2] == [] goto PROVIDENAME

set PROJNAME=%2
goto CONTINUE

:PROVIDENAME

set PROJNAME=
for %%A in (%CD:\= %) do set PROJNAME=%%A
set OPNAME=%PROJNAME%
set /p NP="What is the name of the project [%PROJNAME%]? "
if "" neq "%NP%" set PROJNAME=%NP% 

:CONTINUE

call :TRIMPROJ %PROJNAME%
goto CHECKDIR

:TRIMPROJ

set PROJNAME=%*
set PROJNAME=%PROJNAME:"=%
goto EOF

:CHECKDIR

set DDIR=%CD%\%PROJNAME%
if [%OPNAME%] == [%PROJNAME%] set DDIR=%CD%

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
