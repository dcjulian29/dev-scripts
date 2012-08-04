SET DEVF=C:\dev
SET DEVR=C:\dev-retired
SET DEVP=C:\dev-postponed

:: My "Development Laptop" has a different configuration for some directories...
IF [%COMPUTERNAME%] == [JULIAN] GOTO JULIAN

:: Sometimes I work out of the Dropbox folder and need to the tools to look there...
IF EXIST %TEMP%\dropbox-dev GOTO DROPBOX

:: Skip special environment configurations
GOTO CONT

:JULIAN

SET DEVF=D:\dev
SET DEVR=D:\_archives\dev
SET DEVP=%DEVF%\_postponed
IF EXIST %TEMP%\dropbox-dev GOTO DROPBOX
GOTO CONT

:DROPBOX

echo.
echo Enabling Dropbox DEV configuration...
echo.
SET DEVF=%USERPROFILE%\Dropbox
GOTO CONT

:CONT

SET DEVT=C:\bin\development-tools
for /f "usebackq delims=" %%O in (`where _dev_settings.cmd`) do set DEVT=%%~dpO

SET SVN_INSTALL_ROOT=%DEVT%\svn
SET SVN=%SVN_INSTALL_ROOT%\bin\svn.exe

SET GIT_INSTALL_ROOT=%DEVT%\msysgit
SET GIT=%GIT_INSTALL_ROOT%\bin\git.exe

SET ZIP="C:\Program Files\7-Zip\7z.exe"

SET NANT=%DEVT%\nant\bin\NAnt.exe
SET NUNIT=%DEVT%\nunit\bin\nunit-console-x86.exe

SET DOBUDISH=%DEVT%\DocBook\dobudish.cmd

PATH %SVN_INSTALL_ROOT%\bin;%GIT_INSTALL_ROOT%\bin;%PATH%
