@echo off

setlocal
call C:\bin\development-tools\_dev_settings.cmd
@echo on

set DN=%DEVF%\nuget-packages

pushd %DN%

for /d %%D in (%DN%\*) do (
  set PN=
  set PD=%%D
  FOR %%A in (%PD:\= %) DO SET PN=%%A
  echo %PN%
)

popd

::  if not [%PAKNAME%]==[.git] (
::    echo -- %PAKDIR%
::  )


::  <target name="push.local"
::          depends="nuget">
::    <copy todir="..\_packages">
::      <fileset basedir="build">
::        <include name="*.nupkg"/>
::      </fileset>
::    </copy>
::  </target>