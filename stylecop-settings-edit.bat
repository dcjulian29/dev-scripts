@echo off
setlocal

set PDIR="%ProgramFiles(x86)%"

if [%PDIR%] == [""] goto B32

GOTO C1

:B32

set PDIR="%ProgramFiles%"

:C1

set PDIR=%PDIR:"=%
set STYLECOP=%PDIR%\StyleCop 4.7\StyleCopSettingsEditor.exe

if exist "%STYLECOP%" goto YESEXE

echo Could not find the StyleCop program. Is it installed?
echo.
exit /b 1

:YESEXE

set SETTINGS=%PDIR%\StyleCop 4.7\Settings.StyleCop

if exist "%SETTINGS%" goto YESSET

echo Could not find the StyleCop settings...
echo.
exit /b 2

:YESSET

set EXEC="%STYLECOP%" "%SETTINGS%"

call %SYSTEMDRIVE%\Tools\binaries\elevate.bat %EXEC%
