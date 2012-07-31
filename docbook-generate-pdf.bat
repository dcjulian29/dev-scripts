@echo off

setlocal

call C:\bin\development-tools\_dev_settings.bat
call %DEVT%\DocBook\docbook-ask-project.cmd YES %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

echo.
echo Generating a PDF document from the DocBook project...
echo.

CALL %DOBUDISH% %DOCNAME% pdf

endlocal
