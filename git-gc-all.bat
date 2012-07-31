@ECHO OFF
:: Do a Garbage Collection on all GIT projects.

CALL C:\bin\development-tools\_dev_settings.bat

ECHO.
ECHO Executing a Garbage Collection for GIT projects...
ECHO.

FOR /d %%D in (%DEVF%\*) DO (
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
