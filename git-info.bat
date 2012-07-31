@ECHO OFF
:: Show various information about this git directory
:: Based on discussion at http://kerneltrap.org/mailarchive/git/2007/11/12/406496

setlocal
CALL C:\bin\development-tools\_dev_settings.bat

pushd

:: Find base of git directory
::while [ ! -d .git ] && [ ! `pwd` = "/" ]; do cd ..; done

IF EXIST %CD%\.git (
  ECHO == Remote URLs:
  %GIT% remote -v
  ECHO.

  ECHO == Remote Branches:
  %GIT% branch -r
  ECHO.

  ECHO == Local Branches:
  %GIT% branch
  ECHO.

  ECHO == Configuration: .git/config
  TYPE %CD%\.git\config
  ECHO.

  echo == Most Recent Commit
  %GIT% --no-pager log --max-count=1
  ECHO.

  ECHO Type 'git log' for more commits, or 'git show' for full commit details.
) ELSE (
  ECHO Not a git repository.
)

popd