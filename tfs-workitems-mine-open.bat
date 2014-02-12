@echo off
setlocal

call %~dp0_dev_settings.cmd
call %DEVT%\_tfs_LoadSettings.cmd YES

pushd ..
for /f "usebackq tokens=* delims=" %%U in (`my-username.bat`) do set FULLNAME=%%U
popd

echo.
echo Work items for %FULLNAME% from %TFS-URL%/%TFS-COLLECTION%...
echo.

%PSHELL% Get-TfsWorkItem -TfsServer (Get-TfsServer %TFS-URL% %TFS-COLLECTION%) -User '%FULLNAME%' -ExcludeResolved -ExcludeClosed

echo.

endlocal

:EOF
