IF "%1" == "" GOTO ERROR
IF "%2" == "" GOTO PROVIDEDOCNAME

SET DOCNAME=%2
GOTO CONTINUE

:PROVIDEDOCNAME

SET DOCNAME=UserGuide

SET /p NP="What is the name of the DocBook project [%DOCNAME%]? "
IF "" neq "%NP%" SET DOCNAME=%NP% 

:CONTINUE

:: Trim input
SET DOCNAME=%DOCNAME: =%

SET DOCDIR=%CD%\%DOCNAME%

:: Should document directory exist?
IF [%1] == [YES] GOTO YES
IF [%1] == [NO] GOTO NO
GOTO ERROR

:YES

IF EXIST "%DOCDIR%" GOTO EOF

echo.
echo This DocBook project does not exist.
echo.

exit /B 1

:NO

IF NOT EXIST "%DOCDIR%" GOTO EOF

echo.
echo This DocBook project already exists.
echo.

exit /B 2

:ERROR

echo.
echo This script was called with missing parameters...
echo.

exit /B 3

:EOF
