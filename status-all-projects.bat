@ECHO OFF
:: Do a SVN Status on all SVN project in the PROJECTS folder

setlocal
CALL C:\bin\development-tools\_dev_settings.cmd

ECHO.
ECHO Showing status for SVN projects...
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

