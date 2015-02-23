@echo off
setlocal
call %~dp0_dev_settings.cmd

ECHO.
ECHO Updating the watched projects in this directory...
ECHO.

FOR /d %%D in (%CD%\*) DO (
  IF NOT EXIST %%D\.svn (
    IF NOT EXIST %%D\.git (
      :: This folder is a non SCM folder
      ECHO -- %%D
    ) ELSE (
      :: This folder is a GIT folder
      ECHO == %%D
      echo.
      pushd %%D
      %GIT% pull --all 
      %GIT% gc
      popd
    )
  ) ELSE (
    :: This folder is a SVN folder
    ECHO ++ %%D
    ECHO.
    ::%SVN% upgrade %%D
    %SVN% update %%D
  )
  ECHO.
)
ECHO.
