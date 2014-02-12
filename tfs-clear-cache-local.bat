@echo off

setlocal

echo.
echo.
echo Clearing cache for TFS...
echo.

set TFAPP=%USERPROFILE%\AppData\Local\Microsoft\Team Foundation

call :REMOVECACHE 2.0
call :REMOVECACHE 3.0
call :REMOVECACHE 4.0
call :REMOVECACHE 5.0

endlocal

goto EOF

:REMOVECACHE


if not exist "%TFAPP%\%1\Cache" goto EOF

call %SYSTEMDRIVE%\tools\binaries\dir-rm.bat "%TFAPP%\%1\Cache"
mkdir "%TFAPP%\%1\Cache"

:EOF
