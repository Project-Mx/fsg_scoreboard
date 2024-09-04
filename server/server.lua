lib.callback.register('fsg_scoreboard:getPlayers', function(source)
    local data = {}
    local players = GetPlayers()
    for k, v in ipairs(players) do
        local player = ESX.GetPlayerFromId(v)
        local playerId = player and player.source or v.source
        local playerName = GetPlayerName(playerId) or 'Unknown'
        local steamIdentifier = GetPlayerIdentifierByType(tostring(playerId), 'steam') or 'Unknown'
        local playerGroup = player and player.getGroup() or 'Unknown' 
        table.insert(data, {playerId = playerId, playerName = playerName , steamIdentifier = steamIdentifier})
    end
    return data
end)

lib.callback.register('fsg_scoreboard:getSpecificPlayer', function(source, target)
    local identifiers = {}
    local player = ESX.GetPlayerFromId(target)
    local playerId = player and player.source or target.source

    local fivemid = GetPlayerIdentifierByType(tostring(playerId), 'fivem') or 'Unknown'
    local discordid = GetPlayerIdentifierByType(tostring(playerId), 'discord') or 'Unknown'
    local xblid = GetPlayerIdentifierByType(tostring(playerId), 'xbl') or 'Unknown'
    local liveid = GetPlayerIdentifierByType(tostring(playerId), 'liveid') or 'Unknown'

    table.insert(identifiers, {fivemid, discordid, xblid, liveid})

    local playerName = GetPlayerName(playerId) or 'Unknown'
    local steamIdentifier = GetPlayerIdentifierByType(tostring(playerId), 'steam') or 'Unknown'
    local playerGroup = player and player.getGroup() or 'Unknown' 

    return playerId, playerName .. ' [' .. playerGroup .. ']', steamIdentifier, identifiers
end)
