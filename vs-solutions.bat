@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd

if [%1] NEQ [] SET LOOKINGFOR=%1

set NUMSLN=0

for /f "usebackq delims=" %%O in (`dir /B /S *.sln`) do call :LIST %%O

if %NUMSLN% == 0 echo No Visual Studio solution files found.
goto EOF

:LIST

set SLN=%*
set SLNFILE=

set IGNORE=0

set SLN=%SLN: =/%
FOR %%A in (%SLN:\= %) DO call :STRIP %%A

if %IGNORE% == 0 goto SHOW
goto EOF

:SHOW

if [%LOOKINGFOR%] NEQ [] goto NOOUTPUT

if %NUMSLN% == 0 echo.

:NOOUTPUT

set /A "NUMSLN=NUMSLN+1"

set SLNFILE=%SLNFILE:/= %

if [%LOOKINGFOR%] NEQ [] goto LOOKING

if %NUMSLN% LSS 10 echo: %NUMSLN%: %SLNFILE%
if %NUMSLN% GTR 9 echo %NUMSLN%: %SLNFILE%

goto EOF

:LOOKING

if [%LOOKINGFOR%] == [%NUMSLN%] echo %SLNFILE%

goto EOF

:STRIP

if [%*] == [.git] set IGNORE=1
if [%SLNFILE%] NEQ [] set SLNFILE=%SLNFILE%\%*
if [%SLNFILE%] == [] set SLNFILE=%*
if [%SLNFILE%] == [%CD%] set SLNFILE=

:EOF
