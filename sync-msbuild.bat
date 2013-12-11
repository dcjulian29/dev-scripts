@echo off
setlocal
call %~dp0_dev_settings.cmd

if not "%1" == "" goto C1

echo.
echo Please provide the custom msbuild file name.
echo.

goto EOF

:C1

if not "%2" == "" goto C2

echo.
echo Please provide the Visual Studio CSPROJ file name.
echo.

goto EOF

:C2

if exist %1 goto C3

echo.
echo Custom msbuild file does not exist.
echo.

goto EOF

:C3

if exist %2 goto C4

echo.
echo Visual Studio CSPROJ file does not exist.
echo.

goto EOF

:C4

echo.
echo Comparing %1 to %2...
echo.

set FIND=%WINDIR%\System32\find.exe
set NFIND=%FIND% /V
set SORT=%WINDIR%\System32\sort.exe
set PSHELL=call %SYSTEMDRIVE%\Tools\binaries\pshell.cmd 

set BAI=buildAssemblyInfo.cs
set COMPILE=^<Compile Include=""
set REFERENCE=^<Reference Include=""
set WCF=^<Compile Include=""Service References\
set WS=^<Compile Include=""Web References\
set RESOURCE=^<EmbeddedResource Include=""

set T1C=%TEMP%\sync-msbuild-1C.txt
set T2C=%TEMP%\sync-msbuild-2C.txt

set T1R=%TEMP%\sync-msbuild-1R.txt
set T2R=%TEMP%\sync-msbuild-2R.txt

set T1W=%TEMP%\sync-msbuild-1W.txt
set T2W=%TEMP%\sync-msbuild-2W.txt

set T1WS=%TEMP%\sync-msbuild-1WS.txt
set T2WS=%TEMP%\sync-msbuild-2WS.txt

set T1ER=%TEMP%\sync-msbuild-1ER.txt
set T2ER=%TEMP%\sync-msbuild-2ER.txt

set FT=Format-Table -HideTableHeaders

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

endlocal

:EOF
