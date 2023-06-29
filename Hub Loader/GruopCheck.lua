local GruopScriptUpdated = false
getrenv().GEnabled == nil

print("i didnt make Gruop Only Script :skull:")

if GruopScriptUpdated == false then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/CipsHub/RBX-Script-Hub/main/Hub%20Loader/Game%20Checker%20-%20Script%20Loader.lua"))()
end

if GruopScriptUpdated == true and getrenv().GruopChecked == true then
  getrenv().GEnabled = true
  loadstring(game:HttpGet("https://raw.githubusercontent.com/CipsHub/RBX-Script-Hub/main/Hub%20Loader/Game%20Checker%20-%20Script%20Loader.lua"))()
end
