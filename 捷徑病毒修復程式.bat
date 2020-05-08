@echo off
echo;
echo ========捷徑隨身碟病毒修復程式========
echo;
echo 版本：1.0
echo;
echo 發布日期：2018.12.21   
echo;
echo 作者：李君浩 
echo;
echo 適用於所有檔案皆變為捷徑檔、隨身碟點開變為捷徑。
echo;
echo 修復程式僅會刪除病毒檔案，其餘檔案並不影響。
echo;
echo 請以"系統管理員身分執行"本程式
echo;
echo  ※本程式不負擔任何資料遺失責任，重要資料應養成備份習慣。(如果想要表達感激之情，歡迎至宿舍拍打餵食作者)
echo;
echo;
echo ========程式即將開始執行========
echo;
echo  ※重要!!
echo;
echo  ※修復檔案之前，請將本程式放至隨身碟根目錄底下。
:A0
echo;
echo  執行編號功能說明：
echo;
echo   1.自動移除電腦中的病毒並修復隨身碟(預設)
echo; 
echo   2.移除電腦中的病毒
echo;
echo   3.修復隨身碟
echo;
echo   4.關閉程式
echo;
echo;
echo 輸入欲執行功能之編號或直接按 ENTER 執行預設
echo;
set /p pp="工作編號:"
if "%pp%" == "" set pp=1
if "%pp%" LEQ "4" goto A%pp%
echo;
echo 輸入錯誤，請重新輸入
goto A0
echo;
echo =========開始清除病毒=========
echo;
:A1
:A2
echo 結束處理程序wscript.exe
taskkill /f /im wscript.exe
timeout /t 2 /nobreak
taskkill /f /im wscript.exe
echo;
echo      ※此處顯示錯誤為正常結果。
echo;
:B0
if EXIST "C:\Users\%Username%\AppData\Local\Temp\system.*" goto B1
echo 並未偵測到 system.wsf 病毒
echo;
if EXIST "C:\Users\%Username%\AppData\Roaming\windowsservices" goto B2
echo 並未偵測到 helper 病毒
if "%pp%" == "1" goto A3
echo;
echo 程式將在10秒後自動關閉
timeout -t 10
exit
:B1
echo   ////清除 system.wsf 病毒中
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "system" /f
attrib -a -s -r -h -i "C:\Users\%Username%\AppData\Local\Temp\system.*"
del /f "C:\Users\%Username%\AppData\Local\Temp\system.*"
attrib -a -s -r -h -i "C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\system.*"
del /f "C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\system.*"
goto B0
:B2
echo   ////清除 helper 病毒中
rd /s /q "C:\Users\%Username%\AppData\Roaming\windowsservices"
attrib -a -s -r -h -i "C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\helper.*"
del /f "C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\helper.*"
goto B0
:A3
echo;
echo =========開始還原檔案=======
echo;
echo   ※此處可能需要較長時間，請勿關閉程式。
echo;
cd /d %cd%
attrib -a -s -r -h -i %cd%* /s /d
attrib +a +s +h /s /d %cd%"System Volume Information"
del %cd%"*.lnk" /s
:C0
echo;
if EXIST "%cd%system.*" goto C1
echo 並未偵測到 system.wsf 病毒
echo;
if EXIST "%cd%_" goto C2
echo 並未偵測到 helper 病毒
echo;
echo =========檔案還原結束=========
goto D0
:C1
echo   ////感染 system.wsf 檔案還原中
del /f /s %cd%"system.*"
del %cd%"*.lnk" /s
goto C0
:C2
echo   ////感染 helper 檔案還原中
rd /s /q %cd%"WindowsServices"
del %cd%"*.lnk" /s
robocopy %cd%_ %cd% /move /e
goto C0
:D0
echo;
echo =========隨身碟修復完畢=========
echo;
echo 病毒已清除完成。
echo;
echo 程式將在30秒後自動關閉，或於倒數結束前按任意鍵關閉。
echo;
timeout -t 30
:A4
exit
