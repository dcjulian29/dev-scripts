@ECHO OFF

SET PDIR="%ProgramFiles(x86)%\Microsoft Visual Studio 11.0\Common7\IDE\ProjectTemplates"

IF %PDIR% == "\Microsoft Visual Studio 11.0\Common7\IDE\ItemTemplates" THEN GOTO B32

GOTO CONT

:B32
SET PDIR="%ProgramFiles%\Microsoft Visual Studio 11.0\Common7\IDE\ProjectTemplates"

:CONT

start C:\bin\file\treecomp\treecomp.exe c:\bin\development-tools\Settings\VisualStudio\11.0\Templates\Machine\ProjectTemplates %PDIR%
