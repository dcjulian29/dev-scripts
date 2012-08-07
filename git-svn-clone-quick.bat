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

IF NOT EXIST %DDIR% GOTO DOCLONE

echo.
echo This project has already been cloned, please delete or rename the project and try again.
echo.

GOTO EOF

:DOCLONE

echo.
echo.
echo Cloning %PROJNAME%...

for /f "usebackq delims=" %%O in (`svn info %SVN-URL%/%PROJNAME%`) do (
  for %%I in (%%O) do (
    if [%%I] == [Rev:] SET SVN-LASTREV=%%O
  )
)

set SVN-LASTREV=%SVN-LASTREV:Last Changed Rev: =%

mkdir %DEVF%\%PROJNAME%
pushd %DEVF%\%PROJNAME%

%GIT% svn init %SVN-URL%/%PROJNAME% -s
%GIT% config svn.authorsfile %DEVT:\=/%%SVN-AUTHORSFILE%
%GIT% svn fetch -r %SVN-LASTREV%
SET FETCH-ERRORLEVEL=%ERRORLEVEL%

popd

IF [%FETCH-ERRORLEVEL%] == [0] GOTO FETCH-SUCCESS

echo.
echo There was an error fetching the last revision from the SVN repository.
echo Please attempt the clone again...

rmdir /s /q %DEVF%\%PROJNAME%

goto EOF

:FETCH-SUCCESS

echo.
echo The HEAD revision has been successfully cloned. To finish fetching all
echo other revisions in the repository, execute git-svn-clone-finish.bat
echo You may safely start working with the repository now; however, log-related.
echo operations will be affected by this intermediate state until the clone
echo is finished.

echo %SVN-LASTREV% > %DEVF%\%PROJNAME%\.git\git-svn-clone-rev

:EOF

echo.
echo Done.
echo.
