@echo off

set LEFT="c:\bin\development-tools\Settings\VisualStudio\10.0\Templates\Machine\ItemTemplates"
SET RIGHT="%ProgramFiles(x86)%\Microsoft Visual Studio 10.0\Common7\IDE\ItemTemplates"

IF %RIGHT% == "\Microsoft Visual Studio 10.0\Common7\IDE\ItemTemplates" THEN GOTO B32

GOTO CONT

:B32
SET RIGHT="%ProgramFiles%\Microsoft Visual Studio 10.0\Common7\IDE\ItemTemplates"

:CONT

C:\bin\diff-dirs.bat %LEFT% %RIGHT%
