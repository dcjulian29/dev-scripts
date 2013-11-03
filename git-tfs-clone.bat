@echo off
setlocal
call %~dp0_dev_settings.cmd

call %DEVT%\_tfs_LoadSettings.cmd YES
call %DEVT%\_ask-project-directory.cmd NO .git %1

set ERR=%ERRORLEVEL%
if %ERR% equ 2 goto ALREADYCLONE
if %ERR% neq 0 exit /b %ERRORLEVEL%

goto DOCLONE

:ALREADYCLONE

echo This project has already been cloned, please delete or rename the project and try again.
echo.

GOTO EOF

:DOCLONE

echo.
echo.
echo.
echo Cloning %PROJNAME%...

"%GIT%" tfs clone "%TFS-URL%/%TFS-COLLECTION%" "%TFS-NS%/%PROJNAME%" "%DEVF%\%PROJNAME%"

if not exist "%DEVF%\%PROJNAME%" goto REPONOTEXIST

pushd "%DEVF%\%PROJNAME%"

echo.
echo Optimizing GIT repository...
"%GIT%" repack -d
"%GIT%" gc

popd

:DONE

echo.
echo Done.
echo.

goto EOF

:REPONOTEXIST

echo The repository directory does not exist. Please check to see if clone was successful.
echo.

:EOF
