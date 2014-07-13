@echo off
setlocal
call %~dp0_dev_settings.cmd

if not exist %CD%\build.xml GOTO NOBUILDXML

echo.
echo      Cleaning Build Outputs...
echo.

%NANT% -buildfile:%SDIR%\build.xml clean

:NOBUILDXML

dir /b /s *.sln 1>nul 2>nul
if %ERRORLEVEL% NEQ 0 goto EOF

for /f "usebackq delims=" %%O in (`dir /B /S *.sln`) do call :PROCESSSLN %%O

endlocal

goto EOF

:PROCESSSLN

set SLN=%*
set SLNFILE=

set IGNORE=0

set SLN=%SLN: =/%
FOR %%A in (%SLN:\= %) DO call :STRIP %%A

if %IGNORE% == 0 goto CLEANSOLUTION

goto EOF

:CLEANSOLUTION

set SLNFILE=%SLNFILE:/= %

echo.
echo Cleaning %SLNFILE%...
if [%1] NEQ [] echo     Configuration: %1...
echo.

if [%1] NEQ [] goto BUILDCONFIG

call %DEVT%\project-clean.bat "%SLNFILE%"

goto EOF

:BUILDCONFIG

call %DEVT%\project-clean.bat "%SLNFILE%" %1

goto EOF

:STRIP

if [%*] == [.git] set IGNORE=1
if [%SLNFILE%] NEQ [] set SLNFILE=%SLNFILE%\%*
if [%SLNFILE%] == [] set SLNFILE=%*
if [%SLNFILE%] == [%CD%] set SLNFILE=

:EOF
