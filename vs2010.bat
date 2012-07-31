:: Given a project directory, Open Visual Studio using the sln file in the folder provided
:: that the name of the solution file is the same as the folder...

@ECHO OFF

SETLOCAL

SET PDIR="%ProgramFiles(x86)%\Microsoft Visual Studio 10.0\Common7\IDE"

IF %PDIR% == "\Microsoft Visual Studio 10.0\Common7\IDE" THEN GOTO B32

GOTO CONT

:B32

SET PDIR="%ProgramFiles%\Microsoft Visual Studio 10.0\Common7\IDE"

:CONT

SET PROJNAME=
FOR %%A in (%CD:\= %) DO SET PROJNAME=%%A

IF EXIST %PROJNAME%.sln GOTO STARTVS
IF [%1] == [] GOTO NEEDSLN

SET PROJNAME=%1
IF EXIST %PROJNAME%.sln GOTO STARTVS
IF EXIST %PROJNAME% GOTO STARTVSDIRECT

ECHO Could not find solution file.
GOTO EOF

:NEEDSLN

ECHO Please provide the solution name.
GOTO EOF

:STARTVS

START %PDIR%\devenv.exe %PROJNAME%.sln
GOTO EOF

:STARTVSDIRECT

START %PDIR%\devenv.exe %PROJNAME%

:EOF