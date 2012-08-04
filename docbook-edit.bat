@echo off

setlocal

call C:\bin\development-tools\_dev_settings.cmd
call %DEVT%\DocBook\docbook-ask-project.cmd YES %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

echo.
echo Editing DocBook project...
echo.

set ODIR=%CD%

pushd %SystemDrive%\bin\development-tools\DocBook\dobudish

rmdir /s /q documents 2> null

mkdir documents

call %SystemDrive%\bin\junction.bat documents\%DOCNAME% %ODIR%\%DOCNAME% > nul

CALL %DEVT%\xxe.cmd -read %CD%\documents\%DOCNAME%\input\%DOCNAME%.xml

::rmdir /s /q documents

popd

endlocal
