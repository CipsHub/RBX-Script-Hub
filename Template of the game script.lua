local id = game.PlaceId -- Game id
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))() -- Gui source (orion gui)
local Window = OrionLib:MakeWindow({IntroText = "Hi",Name = "c1ps Hub", HidePremium = true, SaveConfig = true, ConfigFolder = "c1ps Hub Config"..id}) -- Configs
local Zort = game:GetService("Players").LocalPlayer -- gets client side player / local player

-- Values
getgenv().Example = nil -- its a Value u can make false or nil / if u want saving config then dont add it

-- Functionlar
function Example() -- function name
    while getgenv().Example == true do -- value check and decides what happens when true
      print("u activated function") -- prints when true
      wait(1) -- put how much u want wait
  end
end

-- tabs / Makes FarmTab
local FarmTab = Window:MakeTab({ -- creates tab
	Name = "Farm", -- name of tab
	Icon = "rbxassetid://4483345998", -- icon of the tab
	PremiumOnly = false -- premium check
})

-- Makes CrTab
local CrTab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

CrTab:AddParagraph("Script made by!","c1ps") -- adds to Cr Tab and adds paragraph
CrTab:AddParagraph("Our discord server:","c1ps Hub") -- adds to Cr Tab and adds paragraph

 -- makes Button
CrTab:AddButton({
	Name = "Join Discord For Updates and Community!", -- name of the button
	Callback = function()
        setclipboard("https://discord.gg/Qvf4KMrj5H") -- makes u copy this
  	end    
})

-- makes Toggle Button
FarmTab:AddToggle({ -- adds to Farm Tab and makes toggle button
	Name = "Auto Spin", -- name of the toggle button
	Default = false, -- when gui opened makes it false
	Callback = function(Value) -- finds function
	getgenv().Example = Value -- The Value of function and state
    Example() -- Function name
end
})
