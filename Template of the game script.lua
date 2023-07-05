local id = game.PlaceId -- Game id
local lp = game:GetService("Players").LocalPlayer -- gets client side player / local player
local lpName = lp.Name
local groupId = 16306842
local Players = game:GetService("Players")

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

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))() -- Gui source (orion gui)
local Window = OrionLib:MakeWindow({IntroText = "Hi",Name = "c1ps Hub", HidePremium = true, SaveConfig = true, ConfigFolder = "c1ps Hub Config id: "..id}) -- Configs
getgenv().DisplayName = lp.DisplayName
getgenv().AntiAfk = true
getgenv().BypassWalls = true
getgenv().Chams = false

--Example == nil / its a Value u can make false or nil / if u want saving config then dont add it
function Chams()
    while getgenv().Chams == true do
        print("c1ps Hub: Chams Enabled")
        wait(99999999999999999999999999999)
    end
end

function BypassWalls()
    while getgenv().BypassWalls == true do
        print("c1ps Hub: Chams BypassWalls Enabled")
        wait(99999999999999999999999999999)
    end
end
-- tabs / Makes FarmTab
local FarmTab = Window:MakeTab({ -- creates tab
	Name = "Farm", -- name of tab
	Icon = "rbxassetid://4483345998", -- icon of the tab
	PremiumOnly = false -- premium check
})

local ViTab = Window:MakeTab({
	Name = "Visuals",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
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
	Zort.DisplayName = "$c1ps$ "..getgenv().plrName
  	end    
})

-- makes Toggle Button
ViTab:AddToggle({ -- adds to Vi Tab and makes toggle button
	Name = "Chams Wall Bypass", -- name of the toggle button
	Default = false, -- when gui opened makes it false
	Callback = function(Value) -- finds function
	getgenv().BypassWalls = Value -- The Value of function and state
    BypassWalls()
end
})
-- makes Toggle Button
ViTab:AddToggle({ -- adds to Vi Tab and makes toggle button
	Name = "Chams", -- name of the toggle button
	Default = false, -- when gui opened makes it false
	Callback = function(Value) -- finds function
	getgenv().Chams = Value -- The Value of function and state
    Chams()
end
})

print("c1ps Hub Loaded Config id: "..id)
print("Hi "..lpName.." Welcome to c1ps Hub Beta")
print("btw config saving sometimes doesnt work idk")
