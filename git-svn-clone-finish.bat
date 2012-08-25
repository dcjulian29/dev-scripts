:: Create and "quick" clone a project from a SVN Repository by only checking out the last revision.
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd
CALL %DEVT%\_svn_LoadSettings.cmd YES

IF "%1" == "" GOTO PROVIDEPROJECT

SET PROJNAME=%1
GOTO CONTINUE

:PROVIDEPROJECT

SET PROJNAME=ToolBox2

SET /p NP="What is the name of the project [%PROJNAME%]? "
IF "" neq "%NP%" SET PROJNAME=%NP% 

:CONTINUE

:: Trim input
SET PROJNAME=%PROJNAME: =%

SET DDIR=%DEVF%\%PROJNAME%

IF EXIST %DDIR% GOTO FINISHCLONE

echo.
echo This project has not been cloned, please perform a quick-clone of the project and try again.
echo.

GOTO EOF

:FINISHCLONE

echo.
echo This process has not been finalized yet and doesn't seem to work correctly.
echo.
echo You should not use this script yet.....
goto EOF

if not exist %DEVF%\%PROJNAME%\.git\git-svn-clone-rev goto CLONE-FINISHED

for /F "delims=" %%R in (%DEVF%\%PROJNAME%\.git\git-svn-clone-rev) do SET REV=%%R

if [%REV%] == [0] goto CLONE-FINISHED

echo.
echo.
echo Press Ctrl-C to postpone. Continuing cloning of %PROJNAME%...

pushd %DEVF%\%PROJNAME%

:ATTEMPT1
for /L %%L in (%REV%,-1,0) DO (
  if %%L neq %REV% (
    echo Fetching revision %%L...
    %GIT% svn fetch -r %%L
    echo %%L > %DEVF%\%PROJNAME%\.git\git-svn-clone-rev
  )
)

echo.

for /F "delims=" %%R in (%DEVF%\%PROJNAME%\.git\git-svn-clone-rev) do SET REV=%%R
if [%REV%] == [0] GOTO CLONE-COMPLETE

goto EOF


:ATTEMPT2
cd .git

if exist .svndetached GOTO DETACHED-STARTED

mkdir .svndetached

cd .svndetached
%GIT% svn init %SVN-URL%/%PROJNAME% -s >nul
cd ..

::DETACHED-STARTED

cd .svndetached

echo You can press Ctrl-C at any time and resume later...
%GIT% svn fetch -all

cd %DEVF%\%PROJNAME%

:: This does not work either as it creates a "second" branch in the main repository
%GIT% pull .git/.svndetached

::*   515ba8f - (HEAD, master) Merge c:/dev/OPUS/.git/.svndetached
::|\
::| * 42e5b42 - Test of GetRelevantPatches.
::| * 349a4cf - OperationContract: GetRelevantPatches to get only patches that ...
::| ...
::| * 24522f9 - Initial Import
::* c5f7f84 - (trunk) Test of GetRelevantPatches.


:ATTEMPT3

cd .git

if exist .detached GOTO DETACHED-STARTED

mkdir .detached

cd .detached
%GIT% svn init %SVN-URL%/%PROJNAME% -s --prefix=detached/ >nul
cd ..

:DETACHED-STARTED

cd .detached

echo You can press Ctrl-C at any time and resume later...
echo.

%GIT% svn fetch --all

cd %DEVF%\%PROJNAME%

%GIT% fetch .git/.detached refs/remotes/trunk --append

:: How do I get the history joined to the other 

:CLONE-COMPLETE
echo Cloning complete.

echo.
echo Fixing tags...
xcopy /E /I /Y .git\refs\remotes\tags\* .git\refs\tags\

echo.
echo Removing SVN branches that contain the revision number (ie. trunk@8190)...
FOR /R .git\refs\remotes %%X IN (*@*) DO (DEL %%X)

echo.
echo Copying remote branches to local repository...
xcopy /E /I /Y .git\refs\remotes\* .git\refs\heads\

echo.
echo Optimizing GIT repository...
%GIT% repack -a -d
%GIT% gc --prune=now
del /Y %DEVF%\%PROJNAME%\.git\git-svn-clone-rev 2>nul
goto DONE

:CLONE-FINISH

del /Y %DEVF%\%PROJNAME%\.git\git-svn-clone-rev 2>nul
echo.
echo The repository clone has already completed.

:DONE

echo.
echo Done.
echo.

:EOF

popd
