@echo off
echo;
echo ========���|�H���Яf�r�״_�{��========
echo;
echo �����G1.0
echo;
echo �o������G2018.12.21   
echo;
echo �@�̡G���g�E 
echo;
echo �A�Ω�Ҧ��ɮ׬��ܬ����|�ɡB�H�����I�}�ܬ����|�C
echo;
echo �״_�{���ȷ|�R���f�r�ɮסA��l�ɮרä��v�T�C
echo;
echo �ХH"�t�κ޲z����������"���{��
echo;
echo  �����{�����t������ƿ򥢳d���A���n������i���ƥ��ߺD�C(�p�G�Q�n��F�P�E�����A�w��ܱJ�٩祴�����@��)
echo;
echo;
echo ========�{���Y�N�}�l����========
echo;
echo  �����n!!
echo;
echo  ���״_�ɮפ��e�A�бN���{������H���Юڥؿ����U�C
:A0
echo;
echo  ����s���\�໡���G
echo;
echo   1.�۰ʲ����q�������f�r�í״_�H����(�w�])
echo; 
echo   2.�����q�������f�r
echo;
echo   3.�״_�H����
echo;
echo   4.�����{��
echo;
echo;
echo ��J������\�ध�s���Ϊ����� ENTER ����w�]
echo;
set /p pp="�u�@�s��:"
if "%pp%" == "" set pp=1
if "%pp%" LEQ "4" goto A%pp%
echo;
echo ��J���~�A�Э��s��J
goto A0
echo;
echo =========�}�l�M���f�r=========
echo;
:A1
:A2
echo �����B�z�{��wscript.exe
taskkill /f /im wscript.exe
timeout /t 2 /nobreak
taskkill /f /im wscript.exe
echo;
echo      �����B��ܿ��~�����`���G�C
echo;
:B0
if EXIST "C:\Users\%Username%\AppData\Local\Temp\system.*" goto B1
echo �å������� system.wsf �f�r
echo;
if EXIST "C:\Users\%Username%\AppData\Roaming\windowsservices" goto B2
echo �å������� helper �f�r
if "%pp%" == "1" goto A3
echo;
echo �{���N�b10���۰�����
timeout -t 10
exit
:B1
echo   ////�M�� system.wsf �f�r��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "system" /f
attrib -a -s -r -h -i "C:\Users\%Username%\AppData\Local\Temp\system.*"
del /f "C:\Users\%Username%\AppData\Local\Temp\system.*"
attrib -a -s -r -h -i "C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\system.*"
del /f "C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\system.*"
goto B0
:B2
echo   ////�M�� helper �f�r��
rd /s /q "C:\Users\%Username%\AppData\Roaming\windowsservices"
attrib -a -s -r -h -i "C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\helper.*"
del /f "C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\helper.*"
goto B0
:A3
echo;
echo =========�}�l�٭��ɮ�=======
echo;
echo   �����B�i��ݭn�����ɶ��A�Ф������{���C
echo;
cd /d %cd%
attrib -a -s -r -h -i %cd%* /s /d
attrib +a +s +h /s /d %cd%"System Volume Information"
del %cd%"*.lnk" /s
:C0
echo;
if EXIST "%cd%system.*" goto C1
echo �å������� system.wsf �f�r
echo;
if EXIST "%cd%_" goto C2
echo �å������� helper �f�r
echo;
echo =========�ɮ��٭쵲��=========
goto D0
:C1
echo   ////�P�V system.wsf �ɮ��٭줤
del /f /s %cd%"system.*"
del %cd%"*.lnk" /s
goto C0
:C2
echo   ////�P�V helper �ɮ��٭줤
rd /s /q %cd%"WindowsServices"
del %cd%"*.lnk" /s
robocopy %cd%_ %cd% /move /e
goto C0
:D0
echo;
echo =========�H���Э״_����=========
echo;
echo �f�r�w�M�������C
echo;
echo �{���N�b30���۰������A�Ω�˼Ƶ����e�����N�������C
echo;
timeout -t 30
:A4
exit