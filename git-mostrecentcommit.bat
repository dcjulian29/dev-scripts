@echo off
setlocal
call %~dp0_dev_settings.cmd

pushd

:: Find base of git directory

:LOOP

if %CD:~0,3% EQU %CD% goto CONT
dir /b | findstr /L /C:".git" >nul
if %ERRORLEVEL% EQU 0 goto CONT
cd ..
goto LOOP

:CONT

IF EXIST %CD%\.git (
  echo == Most Recent Commit
  %GIT% --no-pager log --max-count=1
  ECHO.

  ECHO Type 'git log' for more commits...
) ELSE (
  ECHO Not a git repository.
)

popd

endlocal
