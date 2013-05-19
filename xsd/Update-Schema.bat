@echo off

call %SYSTEMDRIVE%\bin\_isElevated.cmd YES "%0" %*
if %ERRORLEVEL% NEQ 99 goto EOF

set XSD=C:\bin\development-tools\xsd\*.xsd

call :UPDATE 8
call :UPDATE 9
call :UPDATE 10
call :UPDATE 11

pause

goto EOF

:UPDATE

set DIR=%PF32%\Microsoft Visual Studio %1.0\Xml\Schemas\

if not exist "%DIR%" goto EOF

echo.
echo.
echo Copying schema files to %DIR%...
echo.

xcopy /R /Y "%XSD%" "%DIR%"

:EOF