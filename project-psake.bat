@echo off

setlocal

call %~dp0_dev_settings.cmd

if [%1] EQU [] set PSAKE=Build.ps1
if exist %1 set PSAKE=%1
if exist %1.ps1 set PSAKE=%1.ps1

if exist %PSAKE% goto PROCESS

echo.
if [%1] EQU [] echo Could not find the default psake file.
if [%1] NEQ [] echo Could not find a psake file with that name.
echo.

goto EOF

:PROCESS

shift
set PARAMS=%1

:LOOP

shift
if [%1]==[] goto AFTERLOOP
set PARAMS=%PARAMS% %1
goto LOOP

:AFTERLOOP

:: Example:
::  Invoke-psake "%PSAKE%" -parameters @{"p1"="v1";"p2"="v2"}
::                         %PARAMS% ---->

set PCMD=Invoke-Psake '%PSAKE%' %PARAMS%

%PSHELL% %PCMD%

:EOF

endlocal
