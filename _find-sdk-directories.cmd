IF "%1" == "" GOTO ERROR

set PDIR="%ProgramFiles(x86)%\Microsoft SDKs"

if %PDIR% == "\Microsoft SDKs" goto B32

goto CONT

:B32

set PDIR="%ProgramFiles%\Microsoft SDKs"

:CONT

set PDIR=%PDIR:"=%

if exist "%PDIR%\Windows\v6.0A" set WSDK="%PDIR%\Windows\v6.0A\bin"
if exist "%PDIR%\Windows\v7.0A" set WSDK="%PDIR%\Windows\v7.0A\bin"
if exist "%PDIR%\Windows\v8.0A" set WSDK="%PDIR%\Windows\v8.0A\bin\NETFX 4.0 Tools"




IF [%1] == [WINDOWS] GOTO CHECKWSDK

goto EOF

:CHECKWSDK

if [%WSDK%] == [] goto INSTALLWSDK

goto EOF

:ERROR

echo.
echo This script was called with missing parameters...
echo.

exit /B 1

:INSTALLWSDK

echo.
echo Windows SDK is not installed. Install it to run this command.
echo.

exit /b 2

:EOF
