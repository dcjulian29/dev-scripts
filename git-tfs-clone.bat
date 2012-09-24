@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd
CALL %DEVT%\_tfs_LoadSettings.cmd YES
call C:\bin\development-tools\_ask-project-directory.cmd NO .git %1
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

%GIT% tfs clone %TFS-URL%/%TFS-COLLECTION% $/%PROJNAME% %DEVF%\%PROJNAME%

pushd %DEVF%\%PROJNAME%

echo.
echo Fixing tags...
xcopy /E /I /Y .git\refs\remotes\tags\* .git\refs\tags\

echo.
echo.
echo Copying remote branches to local repository...
xcopy /E /I /Y .git\refs\remotes\* .git\refs\heads\

echo.
echo Optimizing GIT repository...
%GIT% repack -d
%GIT% gc

popd

echo.
echo Done.
echo.

:EOF
