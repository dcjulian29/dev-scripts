:: %1 -- SCM folder to exist

if [%1] == [] goto ERROR

if [%1] == [NA] goto EOF
if exist "%CD%\%1" goto EOF

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
