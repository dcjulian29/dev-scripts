@echo off

SET CS=%TEMP%\vs2010sounds.reg

echo Windows Registry Editor Version 5.00 > %CS%
echo. >> %CS%
echo [HKEY_CurrentUser\AppEvents\Schemes\Apps\devenv\VS_BreakpointHit] >> %CS%
echo "DisabledComponents"=dword:00000001 >> %CS%
echo. >> %CS%


HKU\S-1-5-21-1417066420-240772092-689911805-34638\AppEvents\Schemes\Apps\devenv\VS_BreakpointHit\.current\: "C:\bin\development-tools\Settings\VisualStudio\Sounds\Breakpoint.WAV"
HKU\S-1-5-21-1417066420-240772092-689911805-34638\AppEvents\Schemes\Apps\devenv\VS_BreakpointHit\.Modified\: "C:\bin\development-tools\Settings\VisualStudio\Sounds\Breakpoint.WAV"

HKU\S-1-5-21-1417066420-240772092-689911805-34638\AppEvents\Schemes\Apps\devenv\VS_BuildFailed\.current\: "C:\bin\development-tools\Settings\VisualStudio\Sounds\BuildFailed.WAV"
HKU\S-1-5-21-1417066420-240772092-689911805-34638\AppEvents\Schemes\Apps\devenv\VS_BuildFailed\.Modified\: "C:\bin\development-tools\Settings\VisualStudio\Sounds\BuildFailed.WAV"

HKU\S-1-5-21-1417066420-240772092-689911805-34638\AppEvents\Schemes\Apps\devenv\VS_BuildSucceeded\.current\: "C:\bin\development-tools\Settings\VisualStudio\Sounds\BuildSuccess.WAV"
HKU\S-1-5-21-1417066420-240772092-689911805-34638\AppEvents\Schemes\Apps\devenv\VS_BuildSucceeded\.Modified\: "C:\bin\development-tools\Settings\VisualStudio\Sounds\BuildSuccess.WAV"

Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\AppEvents\Schemes\Apps\devenv]
@="Microsoft Visual Studio"

[HKEY_CURRENT_USER\AppEvents\Schemes\Apps\devenv\VS_BreakpointHit]
@="Breakpoint Hit"

[HKEY_CURRENT_USER\AppEvents\Schemes\Apps\devenv\VS_BreakpointHit\.current]
@="C:\\bin\\development-tools\\Settings\\VisualStudio\\Sounds\\Breakpoint.WAV"

[HKEY_CURRENT_USER\AppEvents\Schemes\Apps\devenv\VS_BreakpointHit\.Modified]
@="C:\\bin\\development-tools\\Settings\\VisualStudio\\Sounds\\Breakpoint.WAV"

[HKEY_CURRENT_USER\AppEvents\Schemes\Apps\devenv\VS_BuildCanceled]
@="Build Canceled"

[HKEY_CURRENT_USER\AppEvents\Schemes\Apps\devenv\VS_BuildCanceled\.current]
@=""

[HKEY_CURRENT_USER\AppEvents\Schemes\Apps\devenv\VS_BuildCanceled\.Modified]
@=""

[HKEY_CURRENT_USER\AppEvents\Schemes\Apps\devenv\VS_BuildFailed]
@="Build Failed"

[HKEY_CURRENT_USER\AppEvents\Schemes\Apps\devenv\VS_BuildFailed\.current]
@="C:\\bin\\development-tools\\Settings\\VisualStudio\\Sounds\\BuildFailed.WAV"

[HKEY_CURRENT_USER\AppEvents\Schemes\Apps\devenv\VS_BuildFailed\.Modified]
@="C:\\bin\\development-tools\\Settings\\VisualStudio\\Sounds\\BuildFailed.WAV"

[HKEY_CURRENT_USER\AppEvents\Schemes\Apps\devenv\VS_BuildSucceeded]
@="Build Succeeded"

[HKEY_CURRENT_USER\AppEvents\Schemes\Apps\devenv\VS_BuildSucceeded\.current]
@="C:\\bin\\development-tools\\Settings\\VisualStudio\\Sounds\\BuildSuccess.WAV"

[HKEY_CURRENT_USER\AppEvents\Schemes\Apps\devenv\VS_BuildSucceeded\.Modified]
@="C:\\bin\\development-tools\\Settings\\VisualStudio\\Sounds\\BuildSuccess.WAV"



REG IMPORT %CS%

DEL /Q %CS%

echo You need to reboot to complete the action...