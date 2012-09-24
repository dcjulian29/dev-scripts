@echo off

setlocal

call C:\bin\development-tools\_dev_settings.cmd
call C:\bin\development-tools\_ask-project-directory.cmd YES .git %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%


echo.
CHOICE /C:YN /M "Are you sure that you want to discard all changes"
SET RESULT=%ERRORLEVEL%
echo.

IF %RESULT% EQU 1 GOTO DISCARDWORK

GOTO EOF

:DISCARDWORK

pushd %DDIR%

echo.
echo Discarding all changes in this project...
echo.

%git% reset HEAD
%git% stash save --keep-index
%git% stash drop

popd

:EOF
