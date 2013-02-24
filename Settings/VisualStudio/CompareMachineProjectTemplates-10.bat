@echo off

set LEFT="c:\bin\development-tools\Settings\VisualStudio\10.0\Templates\Machine\ProjectTemplates"
SET RIGHT="%ProgramFiles(x86)%\Microsoft Visual Studio 10.0\Common7\IDE\ProjectTemplates"

IF %RIGHT% == "\Microsoft Visual Studio 10.0\Common7\IDE\ProjectTemplates" THEN GOTO B32

GOTO CONT

:B32
SET RIGHT="%ProgramFiles%\Microsoft Visual Studio 10.0\Common7\IDE\ProjectTemplates"

:CONT

C:\bin\diff-dirs.bat %LEFT% %RIGHT%
