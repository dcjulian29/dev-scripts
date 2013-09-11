setlocal
call %~dp0_dev_settings.cmd

if [%1] NEQ [] goto C1

echo.
echo Provide the version of Visual Studio to open the solution file in.
echo.

goto EOF

:C1

set VSV=%1

if [%VSV%] == [2012] set VSV=11.0
if [%VSV%] == [2010] set VSV=10.0
if [%VSV%] == [2008] set VSV=9.0

set PDIR="%ProgramFiles(x86)%\Microsoft Visual Studio %VSV%\Common7\IDE"

if %PDIR% == "\Microsoft Visual Studio %VSV%\Common7\IDE" goto B32

goto C2

:B32

set PDIR="%ProgramFiles%\Microsoft Visual Studio %VSV%\Common7\IDE"

:C2

set SN=%2

echo %SN%|findstr /r "[^0-9]" > nul
if errorlevel 1 goto C2A

goto C2B

:C2A

for /f "usebackq delims=" %%O in (`%DEVT%\vs-solutions.bat %SN%`) do SET SF=%%O

if "%SF%" NEQ "" goto C2C

echo.
echo Visual Studio solution number %SN% not found...
call %DEVT%\vs-solutions.bat
goto EOF

:C2C

set PROJNAME="%SF%"

goto C3

:C2B

if [%2] == [.] goto C3B

set PROJNAME=%2

if [%PROJNAME%] NEQ [] goto C3

:: If nothing provided on command line, just start Visual Studio...
if [%PROJNAME%] EQU [] goto STARTVS

:C3B

:: Attempt to determine the solution name if "." is provided.
::  Will only match if SLN file is same name as folder...
for %%A in (%CD:\= %) do set PROJNAME=%%A

echo.
echo Looking for a solution file named %PROJNAME%.sln

:C3

if exist %PROJNAME%.sln set SLN=%PROJNAME%.sln
if exist %PROJNAME% set SLN=%PROJNAME%

if exist %SLN% goto STARTVS

if [%PROJNAME%] NEQ [] goto NOTFOUND

echo.
echo Please provide the solution name.
echo.

goto EOF

:NOTFOUND

echo.
echo That solution file does not exist.
echo.

goto EOF

:STARTVS

call :TRIMPDIR %PDIR%
goto C4

:TRIMPDIR

set PDIR=%*
SET PDIR=%PDIR:"=%
goto EOF

:C4

if exist "%PDIR%\devenv.exe" goto C5

echo.
echo That version of Visual Studio is not installed on this system.
echo.

goto EOF

:C5

start "" "%PDIR%\devenv.exe" %SLN% /log

:EOF

endlocal
