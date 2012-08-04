:: Remove all backup of the current GIT repository
@echo off

setlocal

CALL C:\bin\development-tools\_dev_settings.cmd

if exist "%CD%\.git" GOTO GITDIR

echo.
echo This directory does not contain a GIT repository
echo.
echo.
GOTO EOF

:GITDIR

SET PROJNAME=
FOR %%A in (%CD:\= %) DO SET PROJNAME=%%A

PUSHD ..
for /D %%D in (%TEMP%\%PROJNAME%-backup-*) DO (
  ECHO Removing Backup at %%D
  RMDIR /S /Q "%%D"
)

for /D %%D in (%TEMP%\%PROJNAME%-foobar-*) DO (
  ECHO Removing FooBar at %%D
  RMDIR /S /Q "%%D"
)

POPD

:EOF
