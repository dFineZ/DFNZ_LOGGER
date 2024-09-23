function sendHook(url, name, message, id)
    if id ~= nil then
        local embed = {
            {
                ["color"] = 16777215,
                ["title"] = "**"..name.."**",
                ["description"] = message,
                fields = {
                    {name = "ID", value = id, inline = true},
                    {name = "Discord", value = '<@'..GetPlayerIdentifierByType(id, 'discord'):gsub('discord:', '')..'>', inline = true},
                    {name = "Ping", value = GetPlayerPing(id), inline = true},
                },
                ["footer"] = {
                    ["text"] = 'Logger by DFNZscripts',
                },
            }
        }
        PerformHttpRequest(url, function(err, text, headers) end, 'POST', json.encode({username = "DFNZscripts", avatar_url = image, embeds = embed}), { ['Content-Type'] = 'application/json' })
    else
        local embed = {
            {
                ["color"] = color,
                ["title"] = "**"..name.."**",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = 'Logger by DFNZscripts',
                },
            }
        }
        PerformHttpRequest(url, function(err, text, headers) end, 'POST', json.encode({username = "DFNZscripts", avatar_url = image, embeds = embed}), { ['Content-Type'] = 'application/json' })
    end   
end

exports('sendHook', sendHook)
