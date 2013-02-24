@ECHO OFF

SET PDIR=%ProgramFiles(x86)%\Microsoft Visual Studio 11.0\Common7\IDE

IF "%PDIR%" == "\Microsoft Visual Studio 11.0\Common7\IDE" THEN GOTO B32

GOTO CONT

:B32
SET PDIR=%ProgramFiles%\Microsoft Visual Studio 11.0\Common7\IDE

:CONT

echo Updating Visual Studio Templates...
"%PDIR%\devenv.exe" /installvstemplates
