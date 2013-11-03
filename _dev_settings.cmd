::pushd ..
::set DEVF=%CD%
::popd
:: Need to weed out any scripts that depend on a hard-coded "DEV" folder
set DEVF=ZZZ:
:: Need to weed out any scripts that use "postpone"... 
::    just delete the folder and then check out from SCM later...
set DEVP=%DEVF%\_postponed

for /f "usebackq delims=" %%O in (`where %~n0`) do set DEVT=%%~dpO

set PDIR="%ProgramFiles(x86)%"
if [%PDIR%] == [""] goto B32

goto CONT

:B32

set PDIR="%ProgramFiles%"

:CONT

set GIT_INSTALL_ROOT=%PDIR%\Git
set GIT="%GIT_INSTALL_ROOT%\bin\git.exe"
path "%GIT_INSTALL_ROOT%\bin";%PATH%

set ZIP="C:\bin\File\7-Zip\App\7-Zip\7z.exe"
set NANT=%DEVT%\nant\bin\NAnt.exe
set NUNIT=%DEVT%\nunit\bin\nunit-console-x86.exe
set NSIS=%DEVT%\nsis\nsis.exe
set DOBUDISH=%DEVT%\DocBook\dobudish.cmd

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
