::========================= ˵��  =========================
:: 	������Purp1e		bilibili@Purple-CSGO
::	�ο���@�ѻ���Ricky �� @B5�ٷ� �ṩ��������ű�
:: 	ʹ�ã����ÿ���ָ̨�� "..../SolveVAC.bat" "·��"
::	ע�⣺1. ϵͳ�̱���ΪC��  2. ·����/����xxx.exe
::		3.���ݹ���		4. �ɴ�����ո�·��
::=====================  ��ȡ����ԱȨ��  ======================
 @echo off
 CLS
 SETLOCAL ENABLEDELAYEDEXPANSION
 title VAC��֤�޸� - Purp1e
 
:init
 setlocal DisableDelayedExpansion
 set cmdInvoke=1
 set winSysFolder=System32
 set "batchPath=%~0"
 for %%k in (%0) do set batchName=%%~nk
 set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
 setlocal EnableDelayedExpansion

:checkPrivileges
  NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
  if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)

  ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
  ECHO args = "ELEV " >> "%vbsGetPrivileges%"
  ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
  ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
  ECHO Next >> "%vbsGetPrivileges%"

  if '%cmdInvoke%'=='1' goto InvokeCmd 

  ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
  goto ExecElevation

:InvokeCmd
  ECHO args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
  ECHO UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"

:ExecElevation
 "%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
 exit /B

:gotPrivileges
 setlocal & cd /d %~dp0
 if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)
 
::=================== ��ȡ��������·������  ====================
mode con cols=80 lines=30
taskkill /F /IM csgo.exe
taskkill /F /IM Steam.exe
taskkill /F /IM csgolauncher.exe
 CLS

set path=%1 %2 %3 %4 %5 %6 %7 %8 %9

:delright
if "%path:~-1%"==" " set path=%path:~0,-1%&&goto delright
echo ���·����%path%

if "%path%" == "" (
title ����
echo ·��Ϊ�գ�
goto end
)
::else (goto debug)


::======================= ���VAC����  ========================
:start
echo ��ʼ���VAC����

echo ���� Network Connections
c:\windows\system32\ac config Netman start= AUTO
c:\windows\system32\sc start Netman

echo ���� Remote Access Connection Manager
c:\windows\system32\sc config RasMan start= AUTO
c:\windows\system32\sc start RasMan

echo ���� Telephony
c:\windows\system32\sc config TapiSrv start= AUTO
c:\windows\system32\sc start TapiSrv

echo ���� Windows Firewall
c:\windows\system32\sc config MpsSvc start= AUTO
c:\windows\system32\sc start MpsSvc
c:\windows\system32\netsh advfirewall set allprofiles state on

echo �ָ� Data Execution Prevention ��������ΪĬ��ֵ
c:\windows\system32\bcdedit /deletevalue nointegritychecks
c:\windows\system32\bcdedit /deletevalue loadoptions
c:\windows\system32\bcdedit /debug off
c:\windows\system32\bcdedit /deletevalue nx

:: ==================== ��װSteam Services ====================
CLS
echo �T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T
echo ^>^>^>^>^>^>^>^>^>^>       ��ʼ��װSteam Services       ^<^<^<^<^<^<^<^<^<^<
echo �T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T

cd /d "%path%/bin"
steamservice  /uninstall
c:\windows\system32\ping -n 3 127.0.0.1>nul
steamservice  /install
echo .

echo	�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T
echo ^>^>^>^>^>^>^>^>^>^>       ��װSteam Services���       ^<^<^<^<^<^<^<^<^<^<  
echo	�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T
echo # ����"Steam client service install completed.."
echo # �����κ�"Fail"�����ſ��Խ���
echo # �����������ķ���ǽ����(�رա����������⡱ѡ��)

start steam -cafeapplaunch -forceservice

echo	�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T
echo ^>^>^>^>^>^>^>^>^>^>       ����Steam Services����       ^<^<^<^<^<^<^<^<^<^<  
echo	�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T
c:\windows\system32\sc config "Steam Client Service" start= AUTO
c:\windows\system32\sc start "Steam Client Service"

:debug
title VAC��֤�޸� - Purp1e
echo	�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T
echo ^>^>^>^>^>^>^>^>^>^>      ��ϣ���������������ڣ�      ^<^<^<^<^<^<^<^<^<^<  
echo	�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T

:end
pause>nul
exit
