@echo off

setlocal

call %~dp0_dev_settings.cmd

if [%1] NEQ [] goto CHECK

echo.
echo Please provide the solution/csproj file to clean.
echo.

goto EOF

:CHECK

if exist %1.sln set SLN=%1.sln
if exist %1.csproj set SLN=%1.csproj
if exist %1 set SLN=%1

if exist %SLN% goto PROCESS

echo.
echo Could not find a solution/csproj file with that name.
echo.

goto EOF

:PROCESS

if [%2] NEQ [] goto BUILDCONFIG

%MSBUILD% "%SLN%" /m /t:clean /p:configuration="Debug"

goto EOF

:BUILDCONFIG

%MSBUILD% "%SLN%" /m /t:clean /p:configuration="%2"

:EOF

endlocal
