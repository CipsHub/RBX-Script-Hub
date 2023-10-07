local function checkPlayer(player)
    if player.Name == "berke081" then
        game.Players.LocalPlayer:Kick("You have been kicked because berke081 / Owner of script joined the server.")
    end
end

for _, player in ipairs(game.Players:GetPlayers()) do
    checkPlayer(player)
end

game.Players.PlayerAdded:Connect(checkPlayer)
