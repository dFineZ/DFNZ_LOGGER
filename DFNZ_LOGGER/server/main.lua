local L = Config.Language

-- join
AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
    if Config.ForceDiscord then 
        local discord = GetPlayerIdentifierByType(source, 'discord')
        if discord == nil then
            CancelEvent()
            setKickReason("\n \n"..Config.Text[L].no_discord)
        end
    end

    if not Config.BasicLogs.join then return end
    local url = ''
    sendHook(url, '', '', source)
end)

-- leave
AddEventHandler('playerDropped', function (reason)
    if not Config.BasicLogs.leave then return end
    local url = ''
    sendHook(url, Config.Text[L].reason..reason, '', source)
end)

-- chat
AddEventHandler('chatMessage', function(source, Name, message)
    if not Config.BasicLogs.chat then return end
    local url = ''
    sendHook(url, Config.Text[L].chat, message, source)
end)

function sendHook(url, name, message, id)
    local image = ''
    if id ~= nil then
        local options = {}
        local identifiers = getIdentifier(id)

        local embed = {
            {
                ["color"] = 16777215,
                ["title"] = name,
                ["description"] = message,
                fields = identifiers,
                ["footer"] = {
                    ["text"] = '©DFNZscripts \n'..os.date("%d/%m/%Y %X"),
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
                    ["text"] = '©DFNZscripts \n'..os.date("%d/%m/%Y %X"),
                },
            }
        }
        PerformHttpRequest(url, function(err, text, headers) end, 'POST', json.encode({username = "DFNZscripts", avatar_url = image, embeds = embed}), { ['Content-Type'] = 'application/json' })
    end   
end

function getIdentifier(id)
    local data = {}

    if Config.LogsInformation.id then 
        data[#data + 1] = {name = '`👤` ID', value = id, inline = true}
    end

    if Config.LogsInformation.discord then
        local discord = GetPlayerIdentifierByType(id, 'discord')
        if discord == nil then
            data[#data + 1] = {name = '`📌` DISCORD', value = 'N/A', inline = true}
        else
            data[#data + 1] = {name = '`📌` DISCORD', value = '<@'..discord:gsub('discord:', '')..'>', inline = true}
        end
    end

    if Config.LogsInformation.ping then 
        data[#data + 1] = {name = '`📶` PING', value = GetPlayerPing(id)..'ms', inline = true}
    end

    if Config.LogsInformation.ip then
        data[#data + 1] = {name = '`🌐` IP ADRESSE', value = '||'..GetPlayerEndpoint(id)..'||', inline = true}
    end

    if Config.LogsInformation.fivem then
        data[#data + 1] = {name = '`🟧` FIVEM', value = '||'..GetPlayerIdentifierByType(id, 'fivem')..'||', inline = true}
    end

    return data
end
