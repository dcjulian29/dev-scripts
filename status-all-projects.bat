@echo off
setlocal
call %~dp0_dev_settings.cmd

ECHO.
ECHO Showing status for all projects in this directory...
ECHO.

FOR /d %%D in (%DEVF%\*) DO (
  IF NOT EXIST %%D\.svn (
    IF NOT EXIST %%D\.git (
      :: This folder is a non SCM folder
      ECHO -- %%D
    ) ELSE (
      :: This folder is a GIT folder
      ECHO == %%D
      echo.
      pushd %%D
      %GIT% status
      popd
    )
  ) ELSE (
    :: This folder is a SVN folder
    ECHO ++ %%D
    ECHO.
    pushd %%D
    %SVN% status
    popd
  )
  ECHO.
)
ECHO.

PAUSE

