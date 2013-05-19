@echo off

for /f "usebackq delims=" %%O in (`where octopus-profile-load.bat`) do set DEVT=%%~dpO

set OCTOPUS-PROFILE=

if "%1" == "" goto OCTOPUS-PL-C1

call %DEVT%\Octopus\_loadSettings.cmd NO %1
goto EOF

:OCTOPUS-PL-C1

call %DEVT%\Octopus\_loadSettings.cmd YES

:EOF

:: Unload TFS settings except for profile name
call %DEVT%\Octopus\_octo_template.cmd

set DEVT=
