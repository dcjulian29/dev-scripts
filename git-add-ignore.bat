@echo off

if not exist "%CD%\.git" goto EOF

SET EXCLUDE=%1
SET EXCLUDE=%EXCLUDE: =%

echo.>> "%CD%\.git\info\exclude"
echo %EXCLUDE%>> "%CD%\.git\info\exclude"

:EOF
