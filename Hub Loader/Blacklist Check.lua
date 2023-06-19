local blacklist = {
    552716190,
    4020587829,
    2887293505
}

local function isPlayerBlacklisted(player)
    local playerId = player.UserId
    for _, id in ipairs(blacklist) do
        if playerId == id then
            return true
        end
    end
    return false
end

local function kickPlayer(player)
    player:Kick("You are banned from Cips Hub")
end

game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    if isPlayerBlacklisted(game.Players.LocalPlayer) then
        kickPlayer(game.Players.LocalPlayer)
    end
end)
