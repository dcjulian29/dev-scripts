@ECHO OFF
:: Do a SVN Update on all SVN project in the PROJECTS folder

CALL C:\bin\development-tools\_dev_settings.bat

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

