@echo off
setlocal
call %~dp0_dev_settings.cmd

IF NOT "%1" == "" GOTO C1

ECHO.
ECHO Please provide the custom msbuild file name.
ECHO.

GOTO EOF

:C1

IF NOT "%2" == "" GOTO C2

ECHO.
ECHO Please provide the Visual Studio CSPROJ file name.
ECHO.

GOTO EOF

:C2

IF EXIST %1 GOTO C3

ECHO.
ECHO Custom msbuild file does not exist.
ECHO.

GOTO EOF

:C3

IF EXIST %2 GOTO C4

ECHO.
ECHO Visual Studio CSPROJ file does not exist.
ECHO.

GOTO EOF

:C4

echo.
echo Comparing %1 to %2...
echo.

SET FIND=%WINDIR%\System32\find.exe
SET NFIND=%FIND% /V
SET SORT=%WINDIR%\System32\sort.exe
SET PSHELL=PowerShell -NoLogo -NoProfile -NonInteractive -Command

SET BAI=buildAssemblyInfo.cs
SET COMPILE=^<Compile Include=""
SET REFERENCE=^<Reference Include=""
SET WCF=^<Compile Include=""Service References\
SET WS=^<Compile Include=""Web References\
SET RESOURCE=^<EmbeddedResource Include=""

SET T1C=%TEMP%\sync-msbuild-1C.txt
SET T2C=%TEMP%\sync-msbuild-2C.txt

SET T1R=%TEMP%\sync-msbuild-1R.txt
SET T2R=%TEMP%\sync-msbuild-2R.txt

SET T1W=%TEMP%\sync-msbuild-1W.txt
SET T2W=%TEMP%\sync-msbuild-2W.txt

SET T1WS=%TEMP%\sync-msbuild-1WS.txt
SET T2WS=%TEMP%\sync-msbuild-2WS.txt

SET T1ER=%TEMP%\sync-msbuild-1ER.txt
SET T2ER=%TEMP%\sync-msbuild-2ER.txt

SET FT=Format-Table -HideTableHeaders

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

type %1 | %FIND% "%COMPILE%" | %NFIND% "%BAI%" | %NFIND% "%WCF%" | %NFIND% "%WS%" | %SORT% > %T1C%
type %2 | %FIND% "%COMPILE%" | %NFIND% "%BAI%" | %NFIND% "%WCF%" | %NFIND% "%WS%" | %SORT% > %T2C%
echo.>> %T1C%
echo.>> %T2C%

move %T1C% %T1C%.orignal >nul
for /f "tokens=1 delims=," %%i in (%T1C%.orignal) do echo %%i >> %T1C%

%PSHELL% "((Get-Content %T1C%) | Foreach-Object {$_ -replace '""[^\w]*>', ''} | Set-Content %T1C%)"

move %T2C% %T2C%.orignal >nul
for /f "tokens=1 delims=," %%i in (%T2C%.orignal) do echo %%i >> %T2C%

%PSHELL% "((Get-Content %T2C%) | Foreach-Object {$_ -replace '""[^\w]*>', ''} | Set-Content %T2C%)"

echo ----- Compile Item Differences
%PSHELL% "& {Compare-Object (Get-Content %T1C%) (Get-Content %T2C%)} | %FT%"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo.
echo ----- Reference Item Differences

type %1 | %FIND% "%REFERENCE%" | %SORT% > %T1R%
type %2 | %FIND% "%REFERENCE%" | %SORT% > %T2R%
echo [] >> %T1R%
echo [] >> %T2R%

move %T1R% %T1R%.orignal >nul
for /f "tokens=1 delims=," %%i in (%T1R%.orignal) do echo %%i >> %T1R%

%PSHELL% "((Get-Content %T1R%) | Foreach-Object {$_ -replace '""[^\w]*>', ''} | Set-Content %T1R%)"

move %T2R% %T2R%.orignal >nul
for /f "tokens=1 delims=," %%i in (%T2R%.orignal) do echo %%i >> %T2R%

%PSHELL% "((Get-Content %T2R%) | Foreach-Object {$_ -replace '""[^\w]*>', ''} | Set-Content %T2R%)"

%PSHELL% "& {Compare-Object (Get-Content %T1R%) (Get-Content %T2R%)} | %FT%"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo.
echo ----- Service Reference Item Differences

type %1 | %FIND% "%WCF%" | %SORT% > %T1W%
type %2 | %FIND% "%WCF%" | %SORT% > %T2W%
echo [] >> %T1W%
echo [] >> %T2W%

move %T1W% %T1W%.orignal >nul
for /f "tokens=1 delims=," %%i in (%T1W%.orignal) do echo %%i >> %T1W%

%PSHELL% "((Get-Content %T1W%) | Foreach-Object {$_ -replace '""[^\w]*>', ''} | Set-Content %T1W%)"

move %T2W% %T2W%.orignal >nul
for /f "tokens=1 delims=," %%i in (%T2W%.orignal) do echo %%i >> %T2W%

%PSHELL% "((Get-Content %T2W%) | Foreach-Object {$_ -replace '""[^\w]*>', ''} | Set-Content %T2W%)"

%PSHELL% "& {Compare-Object (Get-Content %T1W%) (Get-Content %T2W%)} | %FT%"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo.
echo ----- Web Reference Item Differences

type %1 | %FIND% "%WS%" | %SORT% > %T1WS%
type %2 | %FIND% "%WS%" | %SORT% > %T2WS%
echo [] >> %T1WS%
echo [] >> %T2WS%

move %T1WS% %T1WS%.orignal >nul
for /f "tokens=1 delims=," %%i in (%T1WS%.orignal) do echo %%i >> %T1WS%

%PSHELL% "((Get-Content %T1WS%) | Foreach-Object {$_ -replace '""[^\w]*>', ''} | Set-Content %T1WS%)"

move %T2WS% %T2WS%.orignal >nul
for /f "tokens=1 delims=," %%i in (%T2WS%.orignal) do echo %%i >> %T2WS%

%PSHELL% "((Get-Content %T2WS%) | Foreach-Object {$_ -replace '""[^\w]*>', ''} | Set-Content %T2WS%)"

%PSHELL% "& {Compare-Object (Get-Content %T1WS%) (Get-Content %T2WS%)} | %FT%"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo.
echo ----- Embedded Resource Item Differences

type %1 | %FIND% "%RESOURCE%" | %SORT% > %T1ER%
type %2 | %FIND% "%RESOURCE%" | %SORT% > %T2ER%
echo [] >> %T1ER%
echo [] >> %T2ER%

move %T1ER% %T1ER%.orignal >nul
for /f "tokens=1 delims=," %%i in (%T1ER%.orignal) do echo %%i >> %T1ER%

%PSHELL% "((Get-Content %T1ER%) | Foreach-Object {$_ -replace '""[^\w]*>', ''} | Set-Content %T1ER%)"

move %T2ER% %T2ER%.orignal >nul
for /f "tokens=1 delims=," %%i in (%T2ER%.orignal) do echo %%i >> %T2ER%

%PSHELL% "((Get-Content %T2ER%) | Foreach-Object {$_ -replace '""[^\w]*>', ''} | Set-Content %T2ER%)"

%PSHELL% "& {Compare-Object (Get-Content %T1ER%) (Get-Content %T2ER%)} | %FT%"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo.

:EOF
