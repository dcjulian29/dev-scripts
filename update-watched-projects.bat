@ECHO OFF
:: Do a SVN Update on all SVN project in the this folder

CALL C:\bin\development-tools\_dev_settings.bat

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
