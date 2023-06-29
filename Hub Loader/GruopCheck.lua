local id = game.PlaceId
local GruopScriptUpdated = nil
getrenv().GEnabled = nil
print("i didnt make Gruop Only Script :skull:")

if(id == 12568963478) then
local GruopScriptUpdated = true
getrenv().GruopChecked = true
end

if GruopScriptUpdated == false then
  getrenv().GruopChecked = false
  loadstring(game:HttpGet("https://raw.githubusercontent.com/CipsHub/RBX-Script-Hub/main/Hub%20Loader/Game%20Checker%20-%20Script%20Loader.lua"))()
end

if GruopScriptUpdated == true and getrenv().GruopChecked == true then
  getrenv().GEnabled = true
  loadstring(game:HttpGet("https://raw.githubusercontent.com/CipsHub/RBX-Script-Hub/main/Hub%20Loader/Game%20Checker%20-%20Script%20Loader.lua"))()
end
