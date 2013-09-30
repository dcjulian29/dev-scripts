::pushd ..
::set DEVF=%CD%
::popd
:: Need to weed out any scripts that depend on a hard-coded "DEV" folder
set DEVF=ZZZ:
:: Need to weed out any scripts that use "postpone"... 
::    just delete the folder and then check out from SCM later...
set DEVP=%DEVF%\_postponed

for /f "usebackq delims=" %%O in (`where %~n0`) do set DEVT=%%~dpO

SET SVN_INSTALL_ROOT=%DEVT%\svn
SET SVN=%SVN_INSTALL_ROOT%\bin\svn.exe
PATH %SVN_INSTALL_ROOT%\bin;%PATH%

SET GIT_INSTALL_ROOT=%DEVT%\msysgit
SET GIT=%GIT_INSTALL_ROOT%\bin\git.exe
PATH %GIT_INSTALL_ROOT%\bin;%PATH%

set ZIP="C:\bin\File\7-Zip\App\7-Zip\7z.exe"
SET NANT=%DEVT%\nant\bin\NAnt.exe
SET NUNIT=%DEVT%\nunit\bin\nunit-console-x86.exe
SET NSIS=%DEVT%\nsis\nsis.exe
SET DOBUDISH=%DEVT%\DocBook\dobudish.cmd

:: "Retirement" Directory where projects go to die...
set DEVR=D:\_archives\dev


:: Find MSBuild
set MSBUILD=
for /D %%D in (%SYSTEMROOT%\Microsoft.NET\Framework\v*) do (
  if exist %%D\MSBuild.exe set MSBUILD=%%D\MSBuild.exe
)
for /D %%D in (%SYSTEMROOT%\Microsoft.NET\Framework64\v*) do (
  if exist %%D\MSBuild.exe set MSBUILD=%%D\MSBuild.exe
)
