setlocal

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

set PROJNAME=%2

if [%PROJNAME%] NEQ [] goto C3

:: if project name/solution file not provided, try to find it.
for %%A in (%CD:\= %) do set PROJNAME=%%A

:C3

if exist %PROJNAME%.sln set SLN=%PROJNAME%.sln
if exist %PROJNAME% set SLN=%PROJNAME%

if exist %SLN% goto STARTVS

echo.
echo Please provide the solution name.
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
