@echo off

:: %1 -- CSV file
:: %2 -- Database
:: %3 -- Collection

setlocal

if [%3] == [] goto NOCOLLECTION
if [%2] == [] goto NODATABASE
if [%1] == [] goto HELP

if exist "%1" goto IMPORT

echo.
echo The CSV file does not exist.
echo.

goto EOF

:NOCOLLECTION

echo.
echo Collection name not provided.
echo.

goto EOF

:NODATABASE

echo.
echo Database name not provided.
echo.

goto EOF

:HELP

echo.
echo [csvfile] [database] [collection]
echo.

goto EOF

:IMPORT

call %SYSTEMDRIVE%\bin\path-mongo.bat

mongoimport --type csv --headerline %1 -d %2 -c %3

:EOF

endlocal
