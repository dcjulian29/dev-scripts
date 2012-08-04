@echo off

for /f "usebackq delims=" %%O in (`where svn-profile-load.bat`) do set DEVT=%%~dpO

set SVN-PROFILE=

if "%1" == "" goto SVN-PL-C1

call %DEVT%\_svn_LoadSettings.cmd NO %1
goto EOF

:SVN-PL-C1

call %DEVT%\_svn_LoadSettings.cmd YES

:EOF

:: Unload SVN settings execpt for profile name
call %DEVT%\_svnprofile_template.cmd

set DEVT=
