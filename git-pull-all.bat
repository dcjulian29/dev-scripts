@echo off
setlocal
call %~dp0_dev_settings.cmd

ECHO.
ECHO Pulling from remote repository for GIT projects in this directory...
ECHO.

FOR /d %%D in (%CD%\*) DO (
  IF EXIST %%D\.git (
    ECHO == %%D
    pushd %%D
    %GIT% remote -v
    %GIT% pull --all
    popd
  )
  ECHO.
)
PAUSE
