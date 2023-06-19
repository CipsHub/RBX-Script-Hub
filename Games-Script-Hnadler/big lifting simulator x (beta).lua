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


--function lar
function AntiAfk()
    while _G.AntiAfk == true do
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
--function auto

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
--buton
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
OrionLib:Init()

task.wait(2)
