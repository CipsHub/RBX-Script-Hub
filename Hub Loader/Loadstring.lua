local LocalizationS = game:GetService("LocalizationService")
local Player = game.Players.LocalPlayer


local result, code = pcall(function()
	return LocalizationS:GetCountryRegionForPlayerAsync(Player)
end)

print("Player is from: "..code)

if result and code == "TR" then
	print("Hello, friend from the Turkiye!")
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/CipsHub/RBX-Script-Hub/main/Hub%20Loader/Blacklist%20Check.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CipsHub/RBX-Script-Hub/main/Hub%20Loader/Whitelist%20Check.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CipsHub/RBX-Script-Hub/main/Hub%20Loader/Premium%20Check.lua"))()
