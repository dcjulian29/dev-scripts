@echo off
setlocal
call %~dp0_dev_settings.cmd

ECHO.
ECHO Showing last commit message for projects in this folder...
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
      %GIT% --no-pager log --max-count=1
      popd
    )
  ) ELSE (
    :: This folder is a SVN folder
    ECHO ++ %%D
    ECHO.
    pushd %%D
    %SVN% log -l 1
    popd
  )
  ECHO.
)
ECHO.
