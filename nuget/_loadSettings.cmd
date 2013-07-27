:: Set NuGet generic settings and load profile settings

if [%NUGET-PROFILE%] == [] goto NUGET-PROFILE-INIT

set TPN=%NUGET-PROFILE%
goto NUGET-CHECK-PROFILE-EXISTS

:NUGET-PROFILE-INIT

set NUGET-PROFILE=
call %DEVT%\NuGet\_nuget_template.cmd

:: If profile is not defined, check the first parameter to
::  see if we should prompt for the profile
if [%1] == [YES] goto NUGET-PROMPT-PROFILE
if [%1] == [NO] set TPN=%2
goto NUGET-CHECK-PROFILE-EXISTS

:NUGET-PROMPT-PROFILE

set /p TPN="What is the name of the NuGet profile to use? "

:NUGET-CHECK-PROFILE-EXISTS

set TPN=%TPN: =%

if exist "%DEVT%\NuGet\_nuget_%TPN%.cmd" goto NUGET-LOAD-PROFILE

echo.
echo The NuGet profile does not exist.
echo.

exit /b 1

:NUGET-LOAD-PROFILE

call %DEVT%\NuGet\_nuget_%TPN%.cmd

if "" neq "%TPN%" set NUGET-PROFILE=%TPN%
