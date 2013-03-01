@echo off

if exist "%CD%\manage.py" goto :C1

echo.
echo This directory does not contain a Django project.
echo.

goto EOF

:C1

start %SYSTEMDRIVE%\python\python.exe %CD%\manage.py runserver %*

sleep 2
start http://127.0.0.1:8000



:EOF
