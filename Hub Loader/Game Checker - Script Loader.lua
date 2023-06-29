local id = game.PlaceId

getgenv().Supported = nil

--if(id == "id Here") then
--loadstring(game:HttpGet("script raw", true))()
--getgenv().Supported = true
--end

if(id == 2609668898) then
  if getrenv().GEnabled == true then
    print("Gruop Script Enabled i didnt do that yet public loading...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CipsHub/RBX-Script-Hub/main/Games-Script-Hnadler/CustomDuels.lua", true))()
  end
  if getrenv().GEnabled == nil then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CipsHub/RBX-Script-Hub/main/Games-Script-Hnadler/CustomDuels.lua", true))()
    getgenv().Supported = true
  end
end

if(id == 12568963478) then
loadstring(game:HttpGet("https://raw.githubusercontent.com/CipsHub/RBX-Script-Hub/main/Games-Script-Hnadler/Double%20Down%20(Beta%20Script).lua", true))()
getgenv().Supported = true
end

if(id == 12529881925) then
loadstring(game:HttpGet("https://raw.githubusercontent.com/CipsHub/RBX-Script-Hub/main/Games-Script-Hnadler/Double%20Down%20(Beta%20Script).lua", true))()
getgenv().Supported = true
end

if(id == 9476339275) then
loadstring(game:HttpGet("https://raw.githubusercontent.com/CipsHub/RBX-Script-Hub/main/Games-Script-Hnadler/Double%20Down%20(Beta%20Script).lua", true))()
getgenv().Supported = true
end

if(id == 7140186081) then
loadstring(game:HttpGet("https://raw.githubusercontent.com/CipsHub/RBX-Script-Hub/main/Games-Script-Hnadler/GunGame.lua", true))()
getgenv().Supported = true
end

if(id == 10754099167) then
loadstring(game:HttpGet("https://raw.githubusercontent.com/CipsHub/RBX-Script-Hub/main/Games-Script-Hnadler/big%20lifting%20simulator%20x%20(beta).lua", true))()
getgenv().Supported = true
end

if getgenv().Supported == nil then
loadstring(game:HttpGet("https://raw.githubusercontent.com/CipsHub/RBX-Script-Hub/main/Games-Script-Hnadler/Sword%20Fight%20Script%20(almost%20done).lua", true))()
end
