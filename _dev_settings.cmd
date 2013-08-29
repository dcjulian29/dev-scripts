pushd ..
set DEVF=%CD%
popd

set DEVR=D:\_archives\dev
set DEVP=%DEVF%\_postponed

for /f "usebackq delims=" %%O in (`where %0`) do set DEVT=%%~dpO

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

