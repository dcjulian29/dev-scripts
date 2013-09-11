@echo off
setlocal
call %~dp0_dev_settings.cmd

ECHO.
ECHO Executing a Garbage Collection for GIT projects...
ECHO.

FOR /d %%D in (%CD%\*) DO (
  IF EXIST %%D\.git (
    ECHO == %%D
    echo.
    pushd %%D
    %GIT% gc
    popd
  )
  ECHO.
)
PAUSE
