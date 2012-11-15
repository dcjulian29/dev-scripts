@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd
CALL %DEVT%\_svn_LoadSettings.cmd YES
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

%GIT% svn clone %SVN-URL%/%PROJNAME% --authors-file=%DEVT:\=/%%SVN-AUTHORSFILE% -s --prefix=svn/ %DEVF%\%PROJNAME%

pushd %DEVF%\%PROJNAME%

echo.
echo Optimizing GIT repository...
%GIT% repack -d
%GIT% gc

popd

echo.
echo Done.
echo.

:EOF
