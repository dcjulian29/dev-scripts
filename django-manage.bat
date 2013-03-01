@echo off

if exist "%CD%\manage.py" goto :C1

echo.
echo This directory does not contain a Django project.
echo.

goto EOF

:C1

%SYSTEMDRIVE%\bin\python.bat %CD%\manage.py %*

:EOF
