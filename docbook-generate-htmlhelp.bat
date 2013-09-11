@echo off
setlocal
call %~dp0_dev_settings.cmd

call %DEVT%\DocBook\docbook-ask-project.cmd YES %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

echo.
echo Generating a MS Help File document from the DocBook project...
echo.

CALL %DOBUDISH% %DOCNAME% htmlhelp

endlocal
