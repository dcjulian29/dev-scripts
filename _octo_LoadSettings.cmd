:: Set Octopus generic settings and load profile settings

if [%OCTOPUS-PROFILE%] == [] goto OCTOPUS-PROFILE-INIT

set TPN=%OCTOPUS-PROFILE%
goto OCTOPUS-CHECK-PROFILE-EXISTS

:OCTOPUS-PROFILE-INIT

set OCTOPUS-PROFILE=
call %DEVT%\Octopus\_octo_template.cmd

:: If profile is not defined, check the first parameter to
::  see if we should prompt for the profile
if [%1] == [YES] goto OCTOPUS-PROMPT-PROFILE
if [%1] == [NO] set TPN=%2
goto OCTOPUS-CHECK-PROFILE-EXISTS

:OCTOPUS-PROMPT-PROFILE

set /p TPN="What is the name of the OCTOPUS profile to use? "

:OCTOPUS-CHECK-PROFILE-EXISTS

set TPN=%TPN: =%

if exist "%SYSTEMDRIVE%\etc\octopus\%TPN%.cmd" goto OCTOPUS-LOAD-PROFILE

echo.
echo The OCTOPUS profile does not exist.
echo.

exit /b 1

:OCTOPUS-LOAD-PROFILE

call %SYSTEMDRIVE%\etc\octopus\%TPN%.cmd

if "" neq "%TPN%" set OCTOPUS-PROFILE=%TPN%
