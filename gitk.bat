@echo off
setlocal

CALL C:\bin\development-tools\_dev_settings.cmd

rem Git installation root.
set PATH=%GIT_INSTALL_ROOT%\bin;%GIT_INSTALL_ROOT%\mingw\bin;%PATH%

if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
if not exist "%HOME%" @set HOME=%USERPROFILE%


if not exist "%CD%\.git" GOTO NOTGIT

start "gitk" wish.exe "%GIT_INSTALL_ROOT%\bin\gitk" -- %CD%
GOTO EOF

:NOTGIT
echo.
echo This directory does not contain a GIT repository
echo.
echo.

:EOF
