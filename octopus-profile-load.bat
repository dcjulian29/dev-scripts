@echo off

for /f "usebackq delims=" %%O in (`where octopus-profile-load.bat`) do set DEVT=%%~dpO

set OCTOPUS-PROFILE=

if "%1" == "" goto OCTOPUS-PL-C1

call %DEVT%\_octo_loadSettings.cmd NO %1
goto EOF

:OCTOPUS-PL-C1

call %DEVT%\_octo_loadSettings.cmd YES

:EOF

:: Unload settings except for profile name
call %SYSTEMDRIVE%\etc\octopus\template.cmd

set DEVT=
