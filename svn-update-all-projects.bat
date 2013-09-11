@echo off
setlocal
call %~dp0_dev_settings.cmd

ECHO.
ECHO Searching for SVN projects to update...
ECHO.

FOR /d %%D in (%DEVF%\*) DO (
  IF NOT EXIST %%D\.svn (
    IF NOT EXIST %%D\.git (
      :: This folder is a non SCM folder
      ECHO -- %%D
    ) ELSE (
      :: This folder is a GIT folder
      ECHO == %%D
    )
  ) ELSE (
    :: This folder is a SVN folder
    ECHO ++ %%D
    ECHO.
    %SVN% update %%D
  )
  ECHO.
)
ECHO.

PAUSE

