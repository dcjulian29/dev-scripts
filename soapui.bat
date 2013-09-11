@echo off

setlocal

set SOAPUI=%~dp0
set SOAPUI_HOME=%SOAPUI%soapui\bin\

set CLASSPATH=%SOAPUI_HOME%soapui-4.5.1.jar;%SOAPUI_HOME%..\lib\*;
set JAVA_OPTS=-Xms128m -Xmx1024m -Dsoapui.properties=soapui.properties "-Dsoapui.home=%SOAPUI_HOME%\"
set JAVA_OPTS=%JAVA_OPTS% -Dsoapui.ext.libraries="%SOAPUI_HOME%ext"
set JAVA_OPTS=%JAVA_OPTS% -Dsoapui.ext.listeners="%SOAPUI_HOME%listeners"
set JAVA_OPTS=%JAVA_OPTS% -Dsoapui.ext.actions="%SOAPUI_HOME%actions"
set JAVA_OPTS=%JAVA_OPTS% -Djava.library.path="%SOAPUI_HOME%\"
set JAVA_OPTS=%JAVA_OPTS% -Dwsi.dir="%SOAPUI_HOME%..\wsi-test-tools"
set JAVA_OPTS=%JAVA_OPTS% -Dsoapui.jxbrowser.disable="true"

pushd %SOAPUI_HOME%
call %SYSTEMDRIVE%\bin\run-javaw  %JAVA_OPTS% com.eviware.soapui.SoapUI
popd
