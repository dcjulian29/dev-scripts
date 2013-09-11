@echo off
setlocal
call %~dp0_dev_settings.cmd

call %DEVT%\_find-sdk-directories.cmd WINDOWS

if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

%WSDK%\wsdl.exe %*

endlocal
