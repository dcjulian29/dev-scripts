@ECHO OFF
:: Show the most recent commits about the projects in the DEV folder.

setlocal
CALL C:\bin\development-tools\_dev_settings.bat

ECHO.
ECHO Showing last commit message for projects...
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
