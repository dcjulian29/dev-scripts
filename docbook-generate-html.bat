@echo off
setlocal
call %~dp0_dev_settings.cmd

call %DEVT%\DocBook\docbook-ask-project.cmd YES %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

echo.
echo Generating HTML document(s) from the DocBook project...
echo.

CALL %DOBUDISH% %DOCNAME% html

:EOF

endlocal
