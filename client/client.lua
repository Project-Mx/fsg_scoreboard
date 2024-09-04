RegisterCommand(Config.Command, function(source)
    showScoreboard()  
end)

if Config.Keybind then
    RegisterKeyMapping(Config.Command, 'Open Scoreboard', 'KEYBOARD', Config.Keybind)
end

CreateThread(function()
    while (true) do
        local sleep = 250
        if lib.getOpenMenu() == 'fsg_scoreboard_players' or lib.getOpenMenu() == 'fsg_scoreboard_info' then
            displayTags()
            sleep = 50
        else
            cleanupTags()
            sleep = 250
        end
        Wait(sleep)
    end
end)
