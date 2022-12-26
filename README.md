# ngrok-minecraft-server-starter
This simple batch file will automatically start your self-hosted minecraft servers using ngrok, and send the generated IP Address to a discord webhook which can be sent to your discord server

> REQUIRED STEPS TO WORK:

- You must have ngrok.exe (downloadable here: https://dashboard.ngrok.com/get-started/setup)
- You must have curl downloaded and added to path (guide here: https://linuxhint.com/install-use-curl-windows/) 
  ^ [this is usually preinstalled, if you get any errors use the guide]

MUST name your server.jar file into serverJar.jar 
MUST have ngrok.exe (downloaded earlier) in the same folder as your minecraft server jar file
MUST have the bat file inside the same folder as your server jar file

create shortcut to bat file, place on desktop, and run.

Expected output: 
- A command panel opens asking for your discord webhook
- upon putting your discord webhook the server will start, and it will send out the IP to the specified webhook
- closing the server file, or command panel will close the server and ngrok link, then sends an offline message to your discord

FIXES:
- if you incorrectly typed your webhook url, don't panic, just open your server folder, look for "webhook.url" and paste the correct one, then save
- if you have any errors, message me on discord at @twix#6034
