@echo off
setlocal
call %~dp0_dev_settings.cmd

ECHO.
ECHO Searching for SVN projects to update...
ECHO.

FOR /d %%D in (%CD%\*) DO (
  IF NOT EXIST %%D\.svn (
    :: This folder is a non SCM folder
    ECHO -- %%D
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
