@echo off

CALL C:\bin\development-tools\_dev_settings.cmd

SET OC=%DEVT%\OpenCover\OpenCover.Console.exe
SET RG=%DEVT%\OpenCoverReportGenerator\ReportGenerator.exe

IF "%1" == "" GOTO PROVIDEPROJECT

GOTO CONTINUE

:PROVIDEPROJECT

ECHO.
ECHO Please provide the UnitTest DLL filename
ECHO.

GOTO EOF

:CONTINUE

IF EXIST "build\" GOTO CONTINUE2

ECHO.
ECHO Please execute this from the root directory of the project.
ECHO.

GOTO EOF

:CONTINUE2

pushd build

%OC% -register:user -target:"%NUNIT%" -targetargs:"%1 /noshadow /labels /framework=4.0.30319"  -output:"testcoverage.xml"

%RG% testcoverage.xml coverage

popd

:EOF
