Config = {}

Config.ForceDiscord = true -- if this is true the player have to open discord or he cant connect to the server

Config.BasicLogs = { --> what basic events should be logges? (enter link in the server/main.lua)
    join = true,
    leave = true,
    chat = true
}

Config.LogsInformation = { --> what informations should be logged?
    id = true,
    discord = true,
    ip = true,
    ping = true,
    fivem = true
}

Config.Language = 'de' --> change your language code

Config.Text = {
    ['de'] = {
        joined = 'Mit server verbunden',
        leaved = 'Server verlassen',
        reason = '**Grund:** ',
        no_discord = 'Bitte öffne zuerst Discord um dich mit dem Server zu verbinden',
        chat = 'Chateingabe'
    },
    ['en'] = {
        joined = 'Joining',
        leaved = 'Leaving',
        reason = '**Reason:** ',
        no_discord = 'Please open Discord to join the server',
        chat = 'Chatmessage'
    }
}