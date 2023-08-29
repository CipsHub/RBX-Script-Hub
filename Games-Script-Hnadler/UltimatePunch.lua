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
	while getgenv().TPaura == true do
		if getgenv().TPauraMode == "Bring" then
		for i, v in pairs(workspace.__THINGS.Npcs:GetDescendants()) do
		if v.Name == "HumanoidRootPart" then
			v.CFrame = game:GetService("Workspace")[Zort.Name].HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
			wait(.15)
		end
	end
    else
	for i, v in pairs(workspace.__THINGS.Npcs:GetDescendants()) do
		if v.Name == "HumanoidRootPart" then
			game:GetService("Workspace")[Zort.Name].HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0, 0, 3)
			wait(.3)
		end
	end
end
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
    [2] = 1
}

game:GetService("ReplicatedStorage").Assets.Network.HatchEgg:InvokeServer(unpack(args))
    wait(.1)
    end
end
function AutoCraft()
    while getgenv().AutoCraft == true do
game:GetService("ReplicatedStorage").Assets.Network.CraftAll:FireServer()
    wait(3)
    end
end
function SmartKillAura()
    while getgenv().SmartKillAura == true do
    game:GetService("ReplicatedStorage").Assets.Network.PunchState:FireServer("Zamah")
    game:GetService("ReplicatedStorage").Assets.Network.Punch:FireServer(1)
    --Zort.Character.Humanoid.Jump = true
    wait()
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
getgenv().Rebirth = 1
function AutoRebirth()
    while getgenv().AutoRebirth == true do
game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Network"):WaitForChild("DoRebirth"):FireServer(getgenv().Rebirth)
wait()
end
end

--menü
local FarmTab = Window:MakeTab({
	Name = "Farm",
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
	Name = "Auto Lift",
	Default = false,
	Callback = function(Value)
getgenv().AutoClick = Value 
AutoClick() 
    end
})
FarmTab:AddToggle({
	Name = "Kill Aura",
	Default = false,
	Callback = function(Value)
getgenv().SmartKillAura = Value 
SmartKillAura() 
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
	Name = "TP Aura (BUGGY)",
	Default = false,
	Callback = function(Value)
getgenv().TPaura = Value 
TPaura() 
    end
})
FarmTab:AddDropdown({
	Name = "Select Rebirth",
	Default = 1,
	Options = {1, 5, 10},
	Callback = function(Value)
    getgenv().Rebirth = Value
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
EggTab:AddDropdown({
	Name = "Select egg",
	Default = "StarterEgg",
	Options = {"StarterEgg", "IceEgg", "DesertEgg", "ArcadeEgg"},
	Callback = function(Value)
    getgenv().SelectEgg = Value
	end    
})
OrionLib:Init()

task.wait(2)
