@ECHO OFF

SET PDIR="%ProgramFiles(x86)%\StyleCop 4.7"

IF %PDIR% == "\StyleCop 4.7" GOTO B32

GOTO CONT

:B32
SET PDIR="%ProgramFiles%\StyleCop 4.7"

:CONT

C:\bin\diff-dirs.bat "c:\bin\development-tools\Settings\StyleCop\StyleCop" %PDIR%
