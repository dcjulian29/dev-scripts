:: Set TFS General Settings and load TFS profile
:: Prompt user is TFS profile has not been loaded.


if [%TFS-PROFILE%] == [] goto TFS-PROFILE-INIT

set TPN=%TFS-PROFILE%
goto TFS-CHECK-PROFILE-EXISTS

:TFS-PROFILE-INIT

set TFS-PROFILE=

call %SYSTEMDRIVE%\etc\tfs\template.cmd

:: If profile is not defined, check the first parameter to
::  see if we should prompt for the profile
if [%1] == [YES] goto TFS-PROMPT-PROFILE
if [%1] == [NO] set TPN=%2
goto TFS-CHECK-PROFILE-EXISTS

:TFS-PROMPT-PROFILE

set /p TPN="What is the name of the TFS profile to use? "

:TFS-CHECK-PROFILE-EXISTS

set TPN=%TPN: =%

if exist "%SYSTEMDRIVE%\etc\tfs\%TPN%.cmd" goto TFS-LOAD-PROFILE

echo.
echo The TFS profile does not exist.
echo.

exit /b 1

:TFS-LOAD-PROFILE

call %SYSTEMDRIVE%\etc\tfs\%TPN%.cmd

if "" neq "%TPN%" set TFS-PROFILE=%TPN%
