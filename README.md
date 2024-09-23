Installation: 
1. add ensure DFNZ_LOGGER to your server.cfg (make your it starts above every script you want to implement it)

export: 
 - VERSION 1: exports['DFNZ_LOGGER']:sendHook("YOUR WEBHHOK", "YOUR EMBED TITLE", "YOUR EMBED TEXT", "ID OF THE PLAYER") <-- use this if you want to get player data
 - VERSION 2: exports['DFNZ_LOGGER']:sendHook("YOUR WEBHHOK", "YOUR EMBED TITLE", "YOUR EMBED TEXT", nil) <-- use this if you dont want to get player data

examples: 
 - VERSION 1:
  ```RegisterNetEvent('esx:playerLoaded', function(player, xPlayer, isNew)
    local link = "INSERT YOUR WEBHOOK"
    exports['DFNZ_LOGGER']:sendHook(link, 'Player joined', xPlayer.getName()..' has joined the server', xPlayer.source)
  end)
 - VERSION 2:
    RegisterNetEvent('esx:playerLoaded', function(player, xPlayer, isNew)
      local link = "INSERT YOUR WEBHOOK"
      exports['DFNZ_LOGGER']:sendHook(link, 'Player joined', xPlayer.getName()..' has joined the server. He has ID: '..xPlayer.source, nil)
    end)
