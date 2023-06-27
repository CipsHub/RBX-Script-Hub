local Premium = {
    [334947673] = true,
    [3742966445] = true,
    [3468789870] = true,
    [3473981677] = true,
    [1413978997] = true,
    [1069958646] = true,
    [1462358844] = true,
    [1588616687] = true,
    [546130656] = true,
    [1398288462] = true,
    [2981276367] = true,
    [2576502933] = true,
    [4252110929] = true,
    [3121842108] = true,
    [4018082971] = true,
    [1644822779] = true,
}

local player = game.Players.LocalPlayer
local playerId = player.UserId

if Premium[playerId] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CipsHub/RBX-Script-Hub/main/Hub%20Loader/Premium%20Script.lua", true))()
    print("Script activated for Premium player")
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CipsHub/RBX-Script-Hub/main/Hub%20Loader/Game%20Checker%20-%20Script%20Loader.lua", true))()
end
