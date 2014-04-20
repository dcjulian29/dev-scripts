@echo off
setlocal
call %~dp0_dev_settings.cmd

call %TOOLDEV%\DocBook\docbook-ask-project.cmd NO %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

echo.
echo Creating DocBook Project...
echo.

call %TOOLDEV%\DocBook\dobudish.cmd %DOCNAME% create book

endlocal
