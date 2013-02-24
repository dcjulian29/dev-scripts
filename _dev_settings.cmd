SET DEVF=C:\dev
SET DEVR=C:\dev-retired
SET DEVP=C:\dev-postponed

:: My "Development Laptop" has a different configuration for some directories...
IF [%COMPUTERNAME%] == [JULIAN] GOTO JULIAN

:: Sometimes I work out of the Dropbox folder and need to the tools to look there...
IF EXIST %TEMP%\dropbox-dev GOTO DROPBOX

:: Sometimes I work directly in a custom folder and need the tools and scripts to use that folder.
if exist %TEMP%\custom-dev GOTO CUSTOM

:: Skip special environment configurations
GOTO CONT

:JULIAN

:: On my laptop, I develop projects in multiple directories, so default to current directory.
set DEVF=%CD%
set DEVR=D:\archives\dev
set DEVP=%DEVF%\_postponed

if exist %TEMP%\dropbox-dev goto DROPBOX
if exist %TEMP%\custom-dev goto CUSTOM
goto CONT

:CUSTOM

echo.
echo Enabling Custom DEV configuration...
echo.

set DEVF=%CD%

set /p ND="DEV directory [%DEVF%]? "
if "" neq "%ND%" set DEVF=%ND%
set DEVF=%DEVF: =%

echo.

goto CONT

:DROPBOX

echo.
echo Enabling Dropbox DEV configuration...
echo.
SET DEVF=%USERPROFILE%\Dropbox
GOTO CONT

:CONT

for /f "usebackq delims=" %%O in (`where _dev_settings.cmd`) do set DEVT=%%~dpO

SET SVN_INSTALL_ROOT=%DEVT%\svn
SET SVN=%SVN_INSTALL_ROOT%\bin\svn.exe

SET GIT_INSTALL_ROOT=%DEVT%\msysgit
SET GIT=%GIT_INSTALL_ROOT%\bin\git.exe

SET ZIP="C:\Program Files\7-Zip\7z.exe"
SET NANT=%DEVT%\nant\bin\NAnt.exe
SET NUNIT=%DEVT%\nunit\bin\nunit-console-x86.exe
SET NSIS=%DEVT%\nsis\nsis.exe
SET DOBUDISH=%DEVT%\DocBook\dobudish.cmd

PATH %SVN_INSTALL_ROOT%\bin;%GIT_INSTALL_ROOT%\bin;%PATH%
