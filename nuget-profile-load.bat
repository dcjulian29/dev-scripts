@echo off

for /f "usebackq delims=" %%O in (`where nuget-profile-load.bat`) do set DEVT=%%~dpO

set NUGET-PROFILE=

if "%1" == "" goto NUGET-PL-C1

call %DEVT%\_nuget_LoadSettings.cmd NO %1
goto EOF

:NUGET-PL-C1

call %DEVT%\_nuget_LoadSettings.cmd YES

:EOF

:: Unload NuGet profile settings except for profile name
call %SYSTEMDRIVE%\etc\NuGet\_nuget_template.cmd

set DEVT=
