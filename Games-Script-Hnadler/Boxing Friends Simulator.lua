local id = game.PlaceId -- Game id
local lp = game:GetService("Players").LocalPlayer -- gets client side player / local player
local lpName = lp.Name
local groupId = 16306842
local Players = game:GetService("Players")

local function checkGroupMembership()
    local success, result = pcall(function()
        return lp:IsInGroup(groupId)
    end)

    if success then
        if result then
        local rank = lp:GetRankInGroup(groupId)
        print("hey "..lpName.." we dedected that ur in gruop! ty for joining!")
            else
            print("Ur not in the gruop!")
            end
            else
            warn("Failed to check group membership:", result)
    end
end

checkGroupMembership()

function highlightPlayer(player)
    local Chams = Instance.new("Highlight")
    Chams.Name = "c1psChams"
    Chams.FillTransparency = 0
    Chams.FillColor = Color3.new(1, 0.666667, 0)
    Chams.OutlineColor = Color3.new(1, 0.333333, 1)
    Chams.OutlineTransparency = 0
    Chams.Parent = player.Character

    local function updateChamsEnabled()
        Chams.Enabled = getgenv().Chams
    end

    local function updateChamsDepthMode()
        if getgenv().BypassWalls then
            Chams.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        else
            Chams.DepthMode = Enum.HighlightDepthMode.Occluded
        end
    end

    updateChamsEnabled()
    updateChamsDepthMode()

    player.CharacterAdded:Connect(function(character)
        Chams.Parent = character
        updateChamsEnabled()
        updateChamsDepthMode()
    end)
end

Players.PlayerAdded:Connect(function(player)
    if player ~= lp then
        highlightPlayer(player)
    end
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= lp then
        highlightPlayer(player)
    end
end

local function onChamsChanged()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character and player ~= lp then
            local Chams = player.Character:FindFirstChild("c1psChams")
            if Chams then
                Chams.Enabled = getgenv().Chams
                if getgenv().BypassWalls then
                    Chams.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                else
                    Chams.DepthMode = Enum.HighlightDepthMode.Occluded
                end
            end
        end
    end
end

getgenv().ChamsChangedConn = getgenv().ChamsChangedConn or getgenv().ChamsChangedConn == nil and getgenv().ChamsChangedConn
getgenv().BypassWallsChangedConn = getgenv().BypassWallsChangedConn or getgenv().BypassWallsChangedConn == nil and getgenv().BypassWallsChangedConn

if getgenv().ChamsChangedConn then
    getgenv().ChamsChangedConn:Disconnect()
end

if getgenv().BypassWallsChangedConn then
    getgenv().BypassWallsChangedConn:Disconnect()
end

getgenv().ChamsChangedConn = game:GetService("RunService").Heartbeat:Connect(onChamsChanged)
getgenv().BypassWallsChangedConn = game:GetService("RunService").Heartbeat:Connect(onChamsChanged)

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

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))() -- Gui source (orion gui)
local Window = OrionLib:MakeWindow({IntroText = "Hi",Name = "c1ps Hub", HidePremium = true, SaveConfig = true}) -- Configs
getgenv().DisplayName = lp.DisplayName
getgenv().AntiAfk = true
getgenv().BypassWalls = true
getgenv().Chams = false
getgenv().Weight = false
getgenv().Wins = false
getgenv().Knuckle = false
getgenv().FreeHugePet = false
getgenv().CraftAll = false

function Weight()
    while getgenv().Weight == true do
local function hasToolEquipped()
    local character = lp.Character
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
        lp.Character[getgenv().ToolNameee]:Activate()
    end
    wait(0.1)
end
end

function FreeHugePet()
    while getgenv().FreeHugePet == true do
local ohString1 = "FreeHuge"
local ohNumber2 = 1

game:GetService("ReplicatedStorage").Events.HatchEgg:InvokeServer(ohString1, ohNumber2)
game:GetService("ReplicatedStorage").Events.HatchEgg:InvokeServer(ohString1, ohNumber2)
wait()
    end
end

function CraftAll()
    while getgenv().CraftAll == true do
local ohString1 = "Craft All"

game:GetService("ReplicatedStorage").Events.PetAction:InvokeServer(ohString1)
wait(1)
    end
end

function Wins()
    while getgenv().Wins == true do
game:GetService("ReplicatedStorage").Events.NPC:FireServer("Kill", "Level 20")
wait()
    end
end

function Knuckle()
    while getgenv().Knuckle == true do
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
game:GetService("ReplicatedStorage").Events.Knuckle:FireServer("28")
wait()
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

local LocalizationS = game:GetService("LocalizationService")

local result, code = pcall(function()
	return LocalizationS:GetCountryRegionForPlayerAsync(lp)
end)

CrTab:AddParagraph("Ur connection from:",code)
CrTab:AddParagraph("Script developers:","c1ps, urlevii") -- adds to Cr Tab and adds paragraph
CrTab:AddParagraph("Our discord server:","c1ps Hub") -- adds to Cr Tab and adds paragraph

 -- makes Button
CrTab:AddButton({
	Name = "Join Discord For Updates and Community!", -- name of the button
	Callback = function()
        setclipboard("https://discord.gg/Qvf4KMrj5H") -- makes u copy this
  	end    
})

CrTab:AddButton({
	Name = "Clan Tag",
	Callback = function()
	lp.DisplayName = "$c1ps$ "..lpName
  	end    
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
	Name = "Auto Weight",
	Default = false,
	Callback = function(Value)
		getgenv().Weight = Value 
Weight() 
    end
})

FarmTab:AddToggle({
	Name = "Auto Farm Wins",
	Default = false,
	Callback = function(Value)
		getgenv().Wins = Value 
Wins()
    end
})

FarmTab:AddToggle({
	Name = "Auto Knuckle Farm",
	Default = false,
	Callback = function(Value)
		getgenv().Knuckle = Value 
Knuckle() 
    end
})

FarmTab:AddToggle({
	Name = "Hatch Exclusive Egg",
	Default = false,
	Callback = function(Value)
		getgenv().FreeHugePet = Value 
FreeHugePet() 
    end
})

FarmTab:AddToggle({
	Name = "Craft All Pets",
	Default = false,
	Callback = function(Value)
		getgenv().CraftAll = Value 
CraftAll() 
    end
})

print("c1ps Hub Loaded Config id: "..id)
print("Hi "..lpName.." Welcome to c1ps Hub Beta")
print("btw config saving sometimes doesnt work idk")
