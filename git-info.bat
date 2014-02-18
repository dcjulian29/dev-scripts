@echo off
setlocal
call %~dp0_dev_settings.cmd

:: Show various information about this git directory
:: Based on discussion at http://kerneltrap.org/mailarchive/git/2007/11/12/406496

pushd

:: Find base of git directory

:LOOP

::while [ ! -d .git ] && [ ! `pwd` = "/" ]; do cd ..; done
if %CD:~0,3% EQU %CD% goto CONT
dir /b | findstr /L /C:".git" >nul
if %ERRORLEVEL% EQU 0 goto CONT
cd ..
goto LOOP

:CONT

IF EXIST %CD%\.git (
  ECHO == Remote URLs:
  %GIT% remote -v
  ECHO.

  ECHO == Branches:
  %GIT% branch -a
  ECHO.

  ECHO == Configuration:
  %GIT% config --local --list
  ECHO.

  echo == Most Recent Commit
  %GIT% --no-pager log --max-count=1
  ECHO.

  ECHO Type 'git log' for more commits, or 'git show' for full commit details.
) ELSE (
  ECHO Not a git repository.
)

popd

endlocal
