loadstring(game:HttpGet("https://raw.githubusercontent.com/CipsHub/RBX-Script-Hub/main/Hub%20Loader/AntiRemoteBypass.lua", true))()

local part = Instance.new("Part")
part.Name = "AntiCrashShit"
part.Parent = workspace.Orbs

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

local function getDistance(pos1, pos2)
    return (pos1 - pos2).magnitude
end

getgenv().maxRange = 20

local function findNearestHitbox()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then
        return nil, nil
    end

    local targetPosition = character:WaitForChild("HumanoidRootPart").Position

    local nearestHitbox = nil
    local nearestDistance = math.huge

    for _, hitbox in ipairs(game.Workspace:GetDescendants()) do
        if hitbox:IsA("Part") and hitbox.Name == "Hitbox" then
            local distance = getDistance(hitbox.Position, targetPosition)
            if distance <= getgenv().maxRange and distance < nearestDistance then
                nearestHitbox = hitbox
                nearestDistance = distance
            end
        end
    end

    return nearestHitbox, nearestDistance
end

game:GetService("RunService").Heartbeat:Connect(function()

    local nearestHitbox, nearestDistance = findNearestHitbox()

    if nearestHitbox then
        local attributes = nearestHitbox.Parent:GetAttributes()
        local idValue = attributes.Id

        if idValue and getgenv().CoinNuker then
            game:GetService("ReplicatedStorage").Communication.Events.c1psRemoteBypassTest11:FireServer(idValue, nil, 5, 1)
            wait(0.1)
        end
    end   
end)

function AutoHatch()
    while getgenv().AutoHatch == true do
local ohString1 = getgenv().SelectEgg
local ohNumber2 = 1
local ohTable3 = {}

game:GetService("ReplicatedStorage").Communication.Functions.OpenEgg:InvokeServer(ohString1, ohNumber2, ohTable3)
    wait(0.1)
    end
end

function AutoCollectOrbs()
    while getgenv().AutoCollectOrbs == true do
        for i, v in pairs(workspace.Orbs:GetDescendants()) do
            if v:IsA("Part") then
                v.Size = Vector3.new(120, 120, 120)
                wait()
            end
        end
    end
end

function AutoEquipBest()
    while getgenv().AutoEquipBest == true do
        game:GetService("ReplicatedStorage").Communication.Events.c1psRemoteBypassTest30:FireServer()
        wait(3)
    end
end

function AutoRedeemRewards()
    while getgenv().AutoRedeemRewards == true do
        for i = 1, 12 do
            game:GetService("ReplicatedStorage").Communication.Events.c1psRemoteBypassTest26:FireServer(i)
            wait(2.5)
        end
        wait(3)
    end
end

function AutoSpinWheel()
    while getgenv().AutoSpinWheel == true do
        game:GetService("ReplicatedStorage").Communication.Functions.c1psRemoteFunctionBypassTest36:InvokeServer()
        wait(0.3)
    end
end

function TripleAutoHatch()
    while getgenv().TripleAutoHatch == true do
local ohString1 = getgenv().SelectEgg
local ohNumber2 = 3
local ohTable3 = {}

game:GetService("ReplicatedStorage").Communication.Functions.OpenEgg:InvokeServer(ohString1, ohNumber2, ohTable3)
    wait(0.1)
    end
end

function CoinNuker()
    while getgenv().CoinNuker == true do
    print("Nuking Chests With c1ps Hub v2")
    wait(20)
    end
end

checkGroupMembership()

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))() -- Gui source (orion gui)
local Window = OrionLib:MakeWindow({IntroText = "Hi",Name = "c1ps Hub", HidePremium = true}) -- Configs
getgenv().DisplayName = lp.DisplayName
getgenv().AntiAfk = true
getgenv().SelectEgg = "Basic"
getgenv().TripleAutoHatch = false
getgenv().AutoHatch = false
getgenv().AutoCollectOrbs = false
getgenv().AutoSpinWheel = false
getgenv().AutoEquipBest = false
getgenv().AutoRedeemRewards = false
getgenv().CoinNuker = false
--getgenv().maxRange = 20

-- tabs / Makes FarmTab
local FarmTab = Window:MakeTab({ -- creates tab
	Name = "Farm", -- name of tab
	Icon = "rbxassetid://4483345998", -- icon of the tab
	PremiumOnly = false -- premium check
})

local EggTab = Window:MakeTab({ -- creates tab
	Name = "Egg", -- name of tab
	Icon = "rbxassetid://4483345998", -- icon of the tab
	PremiumOnly = false -- premium check
})

EggTab:AddDropdown({
	Name = "Select egg",
	Default = "Basic",
	Options = {"Basic", "BasicGolden", "Beach", "Candy", "Circus", "Coral", "CoveEgg"},
	Callback = function(Value)
    getgenv().SelectEgg = Value
	end    
})

EggTab:AddToggle({
	Name = "Auto Hatch Egg",
	Default = false,
	Callback = function(Value)
getgenv().AutoHatch = Value 
AutoHatch() 
    end
})

FarmTab:AddSlider({
	Name = "Chest Nuker Range",
	Min = 0,
	Max = 40,
	Default = 20,
	Color = Color3.fromRGB(255,255,255),
	Increment = 0.1,
	Callback = function(Value)
		getgenv().maxRange = Value
	end    
})

FarmTab:AddToggle({
	Name = "Chest Nuker",
	Default = false,
	Callback = function(Value)
getgenv().CoinNuker = Value 
CoinNuker() 
    end
})

EggTab:AddToggle({
	Name = "Auto Hatch Egg Triple",
	Default = false,
	Callback = function(Value)
getgenv().TripleAutoHatch = Value 
TripleAutoHatch() 
    end
})

EggTab:AddToggle({
	Name = "Auto Equip Best Pets",
	Default = false,
	Callback = function(Value)
getgenv().AutoEquipBest = Value 
AutoEquipBest() 
    end
})

FarmTab:AddToggle({
	Name = "Auto Collect Orbs",
	Default = false,
	Callback = function(Value)
getgenv().AutoCollectOrbs = Value 
AutoCollectOrbs() 
    end
})

FarmTab:AddToggle({
	Name = "Auto Spin Wheel",
	Default = false,
	Callback = function(Value)
getgenv().AutoSpinWheel = Value 
AutoSpinWheel() 
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
	Name = "Auto Redeem Rewards",
	Default = false,
	Callback = function(Value)
getgenv().AutoRedeemRewards = Value 
AutoRedeemRewards() 
    end
})

local ViTab = Window:MakeTab({
	Name = "Visuals",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

ViTab:AddButton({
	Name = "No Blur",
	Callback = function()
    workspace.Camera.Blur:destroy()
end
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
CrTab:AddParagraph("Script developers:","c1ps") -- adds to Cr Tab and adds paragraph
CrTab:AddParagraph("Our discord server:","c1ps Hub V2") -- adds to Cr Tab and adds paragraph

 -- makes Button
CrTab:AddButton({
	Name = "Join Discord For Updates and Community!", -- name of the button
	Callback = function()
        setclipboard("https://discord.gg/Qvf4KMrj5H") -- makes u copy this
  	end    
})

print("c1ps Hub Loaded Config id: "..id)
print("Hi "..lpName.." Welcome to c1ps Hub Beta")
print("btw config saving sometimes doesnt work idk")
