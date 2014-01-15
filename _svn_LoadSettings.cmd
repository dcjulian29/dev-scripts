:: Set SVN General Settings and load SVN profile
:: Prompt user is SVN profile has not been loaded.


if [%SVN-PROFILE%] == [] goto SVN-PROFILE-INIT

set SPN=%SVN-PROFILE%
goto SVN-CHECK-PROFILE-EXISTS

:SVN-PROFILE-INIT

set SVN-PROFILE=

call %SYSTEMDRIVE%\etc\svn\_svnprofile_template.cmd

:: If profile is not defined, check the first parameter to
::  see if we should prompt for the profile
if [%1] == [YES] goto SVN-PROMPT-PROFILE
if [%1] == [NO] set SPN=%2
goto SVN-CHECK-PROFILE-EXISTS

:SVN-PROMPT-PROFILE

set /p SPN="What is the name of the SVN profile to use? "

:SVN-CHECK-PROFILE-EXISTS

set SPN=%SPN: =%

if exist "%SYSTEMDRIVE%\etc\svn\_svnprofile_%SPN%.cmd" goto SVN-LOAD-PROFILE

echo.
echo The SVN profile does not exist.
echo.

exit /b 1

:SVN-LOAD-PROFILE

call %SYSTEMDRIVE%\etc\svn\_svnprofile_%SPN%.cmd

if "" neq "%SPN%" set SVN-PROFILE=%SPN%
