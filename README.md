# SSH tunnel for free

One of my stupidest ideas, which actually reliably works. I use ngrok to
create a tunnel for ssh connections. Unfortunately, free version of ngrok
changes external address each start. I got a little creative and decided to
transfer the address through Telegram using a bot. Bot is written in Bash just
for fun (and I tried learning new concepts at a time). `dummy-keys.sh` is what
    keys should look like. `API_KEY` can be retrieved from BotFather.
    `CHAT_ID` is a group. You need to create it, then add bot there. Somehow
    bot must send a message there. IIRC I just sent a few API requests
    manually. Then bot will edit that message every time new information
    arrives.

<!-- vim:set tw=78: -->
