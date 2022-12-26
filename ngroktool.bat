@echo off

rem Terminate the ngrok.exe process if it is running
taskkill /f /im ngrok.exe 

if not exist webhook.txt (
    rem If the file doesn't exist, create it and ask the user for the URL
    set /p DISCORD_WEBHOOK_URL=Enter the Discord webhook URL: 
    echo %DISCORD_WEBHOOK_URL% > webhook.txt
) else (
    rem If the file exists, read the URL from the file
    set /p DISCORD_WEBHOOK_URL=<webhook.txt
)

setlocal enabledelayedexpansion

rem Wait for 2 seconds
timeout 1

rem Set the path to the ngrok executable
set ngrok_path=ngrok.exe

rem Set the port number
set port=25565

rem Set the path to the log file
set log_file=ngrok_log.txt

rem Start the ngrok program and redirect its output to the log file
if not exist %ngrok_path% (
    echo Error: ngrok not found at %ngrok_path%
) else (
    if errorlevel 1 (
        echo An error occurred while starting ngrok
    ) else (
        start /b cmd /c %ngrok_path% tcp %port% --log=stdout > %log_file%
    )
)

timeout 1

for /f "delims=" %%A in ('findstr /R "\<url=" ngrok_log.txt') do (
    set "line=%%A"
    set "url=!line:~120!"
)

curl -k -F "payload_json={\"content\": \"[1.19.3] Server Online^! Current IP**: ```%url%```\"}" %DISCORD_WEBHOOK_URL%
rem Set the path to the server.py script

rem Set the path to the Java program
set java_path=serverJava.jar

rem Start the Java program with 4GB of memory
java -Xmx4G -jar %java_path%

rem Check if the java process is still running
:check_java
tasklist /fi "imagename eq java.exe" | find "java.exe" > nul
if errorlevel 1 (
    goto end
) else (
    goto check_java
)

:end
curl -k -F "payload_json={\"content\": \"```Server is now Offline```\"}" %DISCORD_WEBHOOK_URL%
rem Terminate the ngrok process
taskkill /f /im ngrok.exe
exit