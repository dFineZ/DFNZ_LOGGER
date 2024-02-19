RegisterServerEvent('logger:sendHook')
AddEventHandler('logger:sendHook', function(link, color, name, message, footer)
    image = 'https://cdn.discordapp.com/attachments/1154690473164816475/1160489592957452339/black__white_logo.png?ex=6534d927&is=65226427&hm=3acba7dff0aed11af47a160c1b2356e8dcf3b82a21eb6b221bb82974e152c820&'
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**"..name.."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = 'Webhook Scrype by DFNZscripts',
              },
          }
      }
  
    PerformHttpRequest(link, function(err, text, headers) end, 'POST', json.encode({username = "DFNZscripts", avatar_url = image, embeds = embed}), { ['Content-Type'] = 'application/json' })
end)