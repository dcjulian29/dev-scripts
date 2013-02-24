@echo off

set LEFT="c:\bin\development-tools\Settings\VisualStudio\10.0\Settings"
set RIGHT="%USERPROFILE%\Documents\Visual Studio 2010\Settings"

C:\bin\diff-dirs.bat %LEFT% %RIGHT%
