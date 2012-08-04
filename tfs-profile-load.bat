@echo off

for /f "usebackq delims=" %%O in (`where tfs-profile-load.bat`) do set DEVT=%%~dpO

set TFS-PROFILE=

if "%1" == "" goto TFS-PL-C1

call %DEVT%\_tfs_LoadSettings.cmd NO %1
goto EOF

:TFS-PL-C1

call %DEVT%\_tfs_LoadSettings.cmd YES

:EOF

:: Unload TFS settings execpt for profile name
call %DEVT%\_tfsprofile_template.cmd

set DEVT=
