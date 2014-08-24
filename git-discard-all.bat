@echo off
setlocal
call %~dp0_dev_settings.cmd

call %DEVT%\_check-scm.cmd .git
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%


echo.
CHOICE /C:YN /M "Are you sure that you want to discard all changes"
SET RESULT=%ERRORLEVEL%
echo.

IF %RESULT% EQU 1 GOTO DISCARDWORK

GOTO EOF

:DISCARDWORK

echo.
echo Discarding all changes in this project...
echo.

%GIT% reset HEAD
%GIT% stash save --keep-index
%GIT% stash drop

:EOF

endlocal
