@echo off

set LEFT="c:\bin\development-tools\Settings\VisualStudio\10.0\Templates\User"
set RIGHT="%USERPROFILE%\Documents\Visual Studio 2010\Templates"

C:\bin\diff-dirs.bat %LEFT% %RIGHT%
