local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({IntroText = "Hi",Name = "c1ps Hub", HidePremium = true, SaveConfig = true, ConfigFolder = "c1ps hub"})
local Zort = game:GetService("Players").LocalPlayer
local userInputService = game:GetService("UserInputService")
--Value lar
getgenv().AutoClick = false
getgenv().AutoRebirth = false
getgenv().SelectEgg = "Basic"
getgenv().TripleAutoHatch = false
getgenv().AutoHatch = false
getgenv().AntiAfk = false
getgenv().AutoTool = false
getgenv().AutoCraft = false
getgenv().TPauraBad = false
getgenv().TPauraGood = false
getgenv().TPauraMode = nil
getgenv().TPaura = false

function TPaura()
	while _G.TPaura == true do
		if _G.TPauraMode == "Bring" then
		for i, v in pairs(workspace.__THINGS.Npcs:GetDescendants()) do
		if v.Name == "HumanoidRootPart" then
			v.CFrame = game:GetService("Workspace")[Zort.Name].HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
			wait(.15)
		end
	end
end
	if _G.TPauraMode == "Goto" then
	for i, v in pairs(workspace.__THINGS.Npcs:GetDescendants()) do
		if v.Name == "HumanoidRootPart" then
			game:GetService("Workspace")[Zort.Name].HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0, 0, 3)
			wait(.3)
		end
	end
end
end
end
function TPauraBad()
	while getgenv().TPauraBad == true do
		if getgenv().TPauraMode == "Bring" then
        for i, b in pairs(workspace.__THINGS.Npcs:GetDescendants()) do
		if b.Name == "Head" then
        if b.Attachment.Text.Title.Text == BAD then
		for i, v in pairs(workspace.__THINGS.Npcs:GetDescendants()) do
		if v.Name == "HumanoidRootPart" then
                print("test")
			v.CFrame = game:GetService("Workspace")[Zort.Name].HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
			wait(.15)
		end
	end
end
end
end
end
	if getgenv().TPauraMode == "Goto" then
    	for i, b in pairs(workspace.__THINGS.Npcs:GetDescendants()) do
		if b.Name == "Head" then
        if b.Attachment.Text.Title.Text == BAD then
	for i, v in pairs(workspace.__THINGS.Npcs:GetDescendants()) do
		if v.Name == "HumanoidRootPart" then
                print("test")
			game:GetService("Workspace")[Zort.Name].HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0, 0, 3)
			wait(.3)
		end
	end
end
end
end
end
wait()
end
end
function TPauraGood()
	while getgenv().TPauraGood == true do
		if getgenv().TPauraMode == "Bring" then
        for i, b in pairs(workspace.__THINGS.Npcs:GetDescendants()) do
		if b.Name == "Head" then
        if b.Attachment.Text.Title.Text == GOOD then
		for i, v in pairs(workspace.__THINGS.Npcs:GetDescendants()) do
		if v.Name == "HumanoidRootPart" then
        print("test")
			v.CFrame = game:GetService("Workspace")[Zort.Name].HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
			wait(.15)
		end
	end
end
end
end
end
	if getgenv().TPauraMode == "Goto" then
    	for i, b in pairs(workspace.__THINGS.Npcs:GetDescendants()) do
		if b.Name == "Head" then
        if b.Attachment.Text.Title.Text == GOOD then
	for i, v in pairs(workspace.__THINGS.Npcs:GetDescendants()) do
		if v.Name == "HumanoidRootPart" then
                print("test")
			game:GetService("Workspace")[Zort.Name].HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0, 0, 3)
			wait(.3)
		end
	end
end
end
end
end
wait()
end
end
function FastAutoHatch()
    while getgenv().FastAutoHatch == true do
local args = {
    [1] = SelectEgg,
    [2] = false
}

game:GetService("ReplicatedStorage").Assets.Network.HatchEgg:InvokeServer(unpack(args))
game:GetService("ReplicatedStorage").Assets.Network.HatchEgg:InvokeServer(unpack(args))
game:GetService("ReplicatedStorage").Assets.Network.HatchEgg:InvokeServer(unpack(args))
game:GetService("ReplicatedStorage").Assets.Network.HatchEgg:InvokeServer(unpack(args))
game:GetService("ReplicatedStorage").Assets.Network.HatchEgg:InvokeServer(unpack(args))
game:GetService("ReplicatedStorage").Assets.Network.HatchEgg:InvokeServer(unpack(args))
    wait(3)
    end
end
function AutoHatch()
    while getgenv().AutoHatch == true do
local args = {
    [1] = SelectEgg,
    [2] = false
}

game:GetService("ReplicatedStorage").Assets.Network.HatchEgg:InvokeServer(unpack(args))
    wait(3)
    end
end
function AutoCraft()
    while getgenv().AutoCraft == true do
game:GetService("ReplicatedStorage").Assets.Network.CraftAll:FireServer()
    wait(3)
    end
end
function AntiAfk()
    while getgenv().AntiAfk == true do
    Players = game:GetService("Players")
	local GC = getconnections or get_signal_cons
	if GC then
		for i,v in pairs(GC(Players.LocalPlayer.Idled)) do
			if v["Disable"] then
				v["Disable"](v)
			elseif v["Disconnect"] then
				v["Disconnect"](v)
			end
		end
	else
		Players.LocalPlayer.Idled:Connect(function()
			local VirtualUser = game:GetService("VirtualUser")
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	end
wait(10)
end
end
function AutoClick()
    while getgenv().AutoClick == true do
local function hasToolEquipped()
    local character = Zort.Character
    if character then
        local tools = character:GetChildren()
        for _, tool in ipairs(tools) do
            if tool:IsA("Tool") then
                return tool.Name
            end
        end
    end
    return nil
end

getgenv().ToolNameee = hasToolEquipped()
    if getgenv().ToolNameee then
        Zort.Character[getgenv().ToolNameee]:Activate()
    end
    wait(0.1)
end
end
function AutoRebirth()
    while getgenv().AutoRebirth == true do
game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Network"):WaitForChild("Rebirth"):FireServer()
wait()
end
end
function AutoTool()
            while getgenv().AutoTool == true do
    if Zort.leaderstats.Strength.Value < 19 then
        getgenv().ToolSelect = "01"
    end
    if Zort.leaderstats.Strength.Value > 19 then
        getgenv().ToolSelect = "02"
    end
    if Zort.leaderstats.Strength.Value > 49 then
        getgenv().ToolSelect = "03"
    end
    if Zort.leaderstats.Strength.Value > 299 then
        getgenv().ToolSelect = "04"
    end
    if Zort.leaderstats.Strength.Value > 999 then
        getgenv().ToolSelect = "05"
    end
    if Zort.leaderstats.Strength.Value > 2999 then
        getgenv().ToolSelect = "06"
    end
    if Zort.leaderstats.Strength.Value > 6499 then
        getgenv().ToolSelect = "07"
    end
    if Zort.leaderstats.Strength.Value > 9999 then
        getgenv().ToolSelect = "08"
    end
    if Zort.leaderstats.Strength.Value > 14999 then
        getgenv().ToolSelect = "09"
    end
    if Zort.leaderstats.Strength.Value > 32499 then
        getgenv().ToolSelect = "10"
    end
    if Zort.leaderstats.Strength.Value > 49999 then
        getgenv().ToolSelect = "11"
    end
    if Zort.leaderstats.Strength.Value > 79999 then
        getgenv().ToolSelect = "12"
    end
    if Zort.leaderstats.Strength.Value > 124999 then
        getgenv().ToolSelect = "13"
    end
    if Zort.leaderstats.Strength.Value > 249999 then
        getgenv().ToolSelect = "14"
    end
    if Zort.leaderstats.Strength.Value > 499999 then
        getgenv().ToolSelect = "15"
    end
    if Zort.leaderstats.Strength.Value > 999999 then
        getgenv().ToolSelect = "16"
    end
    if Zort.leaderstats.Strength.Value > 1999999 then
        getgenv().ToolSelect = "17"
    end
    if Zort.leaderstats.Strength.Value > 5999999 then
        getgenv().ToolSelect = "18"
    end
    if Zort.leaderstats.Strength.Value > 11999999 then
        getgenv().ToolSelect = "19"
    end
    if Zort.leaderstats.Strength.Value > 17999999 then
        getgenv().ToolSelect = "20"
    end
    if Zort.leaderstats.Strength.Value > 24999999 then
        getgenv().ToolSelect = "21"
    end
    if Zort.leaderstats.Strength.Value > 39999999 then
        getgenv().ToolSelect = "22"
    end
    if Zort.leaderstats.Strength.Value > 59999999 then
        getgenv().ToolSelect = "23"
    end
    if Zort.leaderstats.Strength.Value > 89999999 then
        getgenv().ToolSelect = "24"
    end
    if Zort.leaderstats.Strength.Value > 149999999 then
        getgenv().ToolSelect = "25"
    end
    if Zort.leaderstats.Strength.Value > 319999999 then
        getgenv().ToolSelect = "26"
    end
    if Zort.leaderstats.Strength.Value > 479999999 then
        getgenv().ToolSelect = "27"
    end
    if Zort.leaderstats.Strength.Value > 629999999 then
        getgenv().ToolSelect = "28"
    end
    if Zort.leaderstats.Strength.Value > 779999999 then
        getgenv().ToolSelect = "29"
    end
    if Zort.leaderstats.Strength.Value > 989999999 then
        getgenv().ToolSelect = "30"
    end
    if Zort.leaderstats.Strength.Value > 1399999999 then
        getgenv().ToolSelect = "31"
    end
    if Zort.leaderstats.Strength.Value > 1799999999 then
        getgenv().ToolSelect = "32"
    end
    if Zort.leaderstats.Strength.Value > 2599999999 then
        getgenv().ToolSelect = "33"
    end
    if Zort.leaderstats.Strength.Value > 3299999999 then
        getgenv().ToolSelect = "34"
    end
    if Zort.leaderstats.Strength.Value > 4599999999 then
        getgenv().ToolSelect = "35"
    end
    if Zort.leaderstats.Strength.Value > 6599999999 then
        getgenv().ToolSelect = "36"
    end
    if Zort.leaderstats.Strength.Value > 7399999999 then
        getgenv().ToolSelect = "37"
    end
    if Zort.leaderstats.Strength.Value > 9999999999 then
        getgenv().ToolSelect = "38"
    end
    if Zort.leaderstats.Strength.Value > 14499999999 then
        getgenv().ToolSelect = "39"
    end
    if Zort.leaderstats.Strength.Value > 23399999999 then
        getgenv().ToolSelect = "40"
    end
    if Zort.leaderstats.Strength.Value > 36599999999 then
        getgenv().ToolSelect = "41"
    end
    if Zort.leaderstats.Strength.Value > 42199999999 then
        getgenv().ToolSelect = "42"
    end
    if Zort.leaderstats.Strength.Value > 54899999999 then
        getgenv().ToolSelect = "43"
    end
    if Zort.leaderstats.Strength.Value > 72499999999 then
        getgenv().ToolSelect = "44"
    end
    if Zort.leaderstats.Strength.Value > 92999999999 then
        getgenv().ToolSelect = "45"
    end
    if Zort.leaderstats.Strength.Value > 185999999999 then
        getgenv().ToolSelect = "46"
    end
    wait(1)
    game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Network"):WaitForChild("EquipTool"):FireServer(getgenv().ToolSelect)
end
end

--menü
local FarmTab = Window:MakeTab({
	Name = "Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local StageTab = Window:MakeTab({
	Name = "Buy Stage",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local EggTab = Window:MakeTab({
	Name = "Egg",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
FarmTab:AddToggle({
	Name = "Anti Afk",
	Default = false,
	Callback = function(Value)
getgenv().AntiAfk = Value 
AntiAfk() 
    end
})
FarmTab:AddToggle({
	Name = "Auto Use Tool",
	Default = false,
	Callback = function(Value)
getgenv().AutoClick = Value 
AutoClick() 
    end
})
FarmTab:AddDropdown({
	Name = "Select TP method",
	Default = "Bring",
	Options = {"Bring", "Goto"},
	Callback = function(Value)
    getgenv().TPauraMode = Value
	end    
})
FarmTab:AddToggle({
	Name = "TP Aura",
	Default = false,
	Callback = function(Value)
getgenv().TPaura = Value 
TPaura() 
    end
})
FarmTab:AddToggle({
	Name = "Auto Equip Best Tool",
	Default = false,
	Callback = function(Value)
getgenv().AutoTool = Value 
AutoTool() 
    end
})
FarmTab:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
getgenv().AutoRebirth = Value 
AutoRebirth() 
    end
})
EggTab:AddToggle({
	Name = "AutoHatch Egg",
	Default = false,
	Callback = function(Value)
getgenv().AutoHatch = Value 
AutoHatch() 
    end
})
EggTab:AddToggle({
	Name = "Fast AutoHatch Egg",
	Default = false,
	Callback = function(Value)
getgenv().FastAutoHatch = Value 
FastAutoHatch() 
    end
})
EggTab:AddDropdown({
	Name = "Select egg",
	Default = "StarterEgg",
	Options = {"StarterEgg", "AlienEgg", "CyberEgg", "DemigodEgg", "MetropolisEgg", "RoboEgg", "DiscoEgg"},
	Callback = function(Value)
    getgenv().SelectEgg = Value
	end    
})
EggTab:AddToggle({
	Name = "Auto Craft",
	Default = false,
	Callback = function(Value)
getgenv().AutoCraft = Value 
AutoCraft() 
    end
})
OrionLib:Init()

task.wait(2)
