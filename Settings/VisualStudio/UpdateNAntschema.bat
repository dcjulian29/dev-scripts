@echo off

if not exist "%PF32%\Microsoft Visual Studio 11.0\Xml\Schemas\" goto VS10
xcopy /F /Y "C:\bin\development-tools\nant\schema\nant.xsd" "%PF32%\Microsoft Visual Studio 11.0\Xml\Schemas\"

:VS10
if not exist "%PF32%\Microsoft Visual Studio 10.0\Xml\Schemas\" goto VS09
xcopy /F /Y "C:\bin\development-tools\nant\schema\nant.xsd" "%PF32%\Microsoft Visual Studio 10.0\Xml\Schemas\"

:VS09
if not exist "%PF32%\Microsoft Visual Studio 9.0\Xml\Schemas\" goto EOF
xcopy /F /Y "C:\bin\development-tools\nant\schema\nant.xsd" "%PF32%\Microsoft Visual Studio 9.0\Xml\Schemas\"

:EOF