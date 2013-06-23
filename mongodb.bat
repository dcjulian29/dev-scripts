::@echo off

setlocal

if [%1] == [] goto HELP

set SC=%WINDIR%\System32\sc.exe


if [%1] == [START] goto PARSED-START
if [%1] == [STOP] goto PARSED-STOP
if [%1] == [QUERY] goto PARSED-QUERY

if [%1] == [start] goto PARSED-START
if [%1] == [stop] goto PARSED-STOP
if [%1] == [query] goto PARSED-QUERY

goto HELP

:PARSED-START

call %SYSTEMDRIVE%\bin\_isElevated.cmd YES "%0" %*
if %ERRORLEVEL% NEQ 99 goto EOF

call :START MongoDB

goto EOF

:PARSED-STOP

call %SYSTEMDRIVE%\bin\_isElevated.cmd YES "%0" %*
if %ERRORLEVEL% NEQ 99 goto EOF

call :STOP MongoDB

goto EOF

:PARSED-QUERY

:: Check to see if service exists
%SC% query MongoDB > nul
if %ERRORLEVEL% == 1060 goto NOSQL


%SC% query MongoDB | %WINDIR%\System32\find.exe "RUNNING" > nul
If %ERRORLEVEL% NEQ 0 goto NOTRUNNING

echo MongoDB Server is running...
echo.

goto EOF

:NOSQL

echo MongoDB Server is not installed...
echo.

goto EOF

:NOTRUNNING

echo MongoDB Server is not running...
echo.

goto EOF

:START

call :ACTION %1 STOPPED start

goto EOF

:STOP

call :ACTION %1 RUNNING stop

goto EOF

:ACTION

:: Check to see if service exists
%SC% query %1 > nul
if %ERRORLEVEL% == 1060 goto EOF


%SC% query %1 | %WINDIR%\System32\find.exe "%2" > nul
If %ERRORLEVEL% NEQ 0 goto EOF

net %3 %1

goto EOF

:HELP

echo.
echo MongoDB Server Helper Script
echo.
echo This script helps to automate and script functions related to the MongoDB Server Service.
echo.
echo Usage: %0 [START^|STOP^|QUERY]

:EOF
