How to create a Webhook:
1. Go to your server file and go to the event you want to log
2. Insert a Webhooklink for example: local link = 'YOUR LINK'
3. Add TriggerEvent('logger:sendHook':link, color, name, message, footer) then when you want to send a hook

Meanings: 
color need to be a decimal color, you can use this side (https://www.mathsisfun.com/hexadecimal-decimal-colors.html)
name is the Embed Header Name
message could be something like "xPlayer.name..' ['..xPlayer.source..'] has job'..xPlayer.job"
footer needs no change