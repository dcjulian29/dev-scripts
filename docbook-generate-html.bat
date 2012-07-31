@echo off

setlocal

call C:\bin\development-tools\_dev_settings.bat
call %DEVT%\DocBook\docbook-ask-project.cmd YES %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

echo.
echo Generating HTML document(s) from the DocBook project...
echo.

CALL %DOBUDISH% %DOCNAME% html

:EOF

endlocal
