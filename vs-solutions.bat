@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd

set NUMSLN=0

for /f "usebackq delims=" %%O in (`dir /B /S *.sln`) do call :LIST %%O

if %NUMSLN% == 0 echo No Visual Studio solution files found.
goto EOF

:LIST

set SLN=%*
set SLNFILE=

set IGNORE=0

FOR %%A in (%SLN:\= %) DO call :STRIP %%A

if %IGNORE% == 0 goto SHOW
goto EOF

:SHOW

if %NUMSLN% == 0 echo.

set /A "NUMSLN=NUMSLN+1"

if %NUMSLN% LSS 10 echo: %NUMSLN%: %SLNFILE%
if %NUMSLN% GTR 9 echo %NUMSLN%: %SLNFILE%
goto EOF

:STRIP

if [%*] == [.git] set IGNORE=1
if [%SLNFILE%] NEQ [] set SLNFILE=%SLNFILE%\%*
if [%SLNFILE%] == [] set SLNFILE=%*
if [%SLNFILE%] == [%CD%] set SLNFILE=

:EOF
