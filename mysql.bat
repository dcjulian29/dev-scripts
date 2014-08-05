@echo off

setlocal

if [%1] == [] goto HELP

set SC=%WINDIR%\System32\sc.exe


if [%1] == [START] goto PARSED-START
if [%1] == [STOP] goto PARSED-STOP
if [%1] == [QUERY] goto PARSED-QUERY
if [%1] == [CLIENT] goto PARSED-CLIENT

if [%1] == [start] goto PARSED-START
if [%1] == [stop] goto PARSED-STOP
if [%1] == [query] goto PARSED-QUERY
if [%1] == [client] goto PARSED-CLIENT

goto HELP

:PARSED-START

call %SYSTEMDRIVE%\tools\binaries\_isElevated.cmd YES "%0" %*
if %ERRORLEVEL% NEQ 99 goto EOF

call :START MySQL

goto EOF

:PARSED-STOP

call %SYSTEMDRIVE%\tools\binaries\_isElevated.cmd YES "%0" %*
if %ERRORLEVEL% NEQ 99 goto EOF

call :STOP MySQL

goto EOF

:PARSED-QUERY

:: Check to see if service exists
%SC% query MySQL > nul
if %ERRORLEVEL% == 1060 goto NOSQL


%SC% query MySQL | %WINDIR%\System32\find.exe "RUNNING" > nul
If %ERRORLEVEL% NEQ 0 goto NOTRUNNING

echo MySQL Server is running...
echo.

goto EOF

:NOSQL

echo MySQL Server is not installed...
echo.

goto EOF

:NOTRUNNING

echo MySQL Server is not running...
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

:PARSED-CLIENT

"%SYSTEMDRIVE%\Program Files\MySQL\MySQL Server 5.6\bin\mysql.exe" --defaults-file=%SYSTEMDRIVE%\data\my.ini -uroot -p"

goto EOF

:HELP

echo.
echo MySQL Server Helper Script
echo.
echo This script helps to automate and script functions related to the MySQL Server Service.
echo.
echo Usage: %0 [START^|STOP^|QUERY^|CLIENT]

:EOF
