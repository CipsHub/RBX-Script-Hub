-- Obtain the player's character
local player = game.Players.LocalPlayer
local character

-- Define the maximum range distance for looking at other players
getgenv().maxRange = 20 -- Adjust this value to your desired maximum range

-- Define the toggle key
getgenv().ToggleKey1 = Enum.KeyCode.R -- Adjust this key to your desired toggle key
getgenv().teleportKey = Enum.KeyCode.T -- Adjust this key to your desired teleport key
getgenv().modifyToolKey = Enum.KeyCode.F -- Adjust this key to your desired modify tool key

getgenv().TPDistance = 4

getgenv().ReachSize = 30, 30, 30
getgenv().ReachType = "Enum.PartType.Ball"

-- Reach types --

-- Block
-- CornerWedge
-- Cylinder
-- Wedge
-- Ball

-- Track the toggle state
local toggleEnabled = false

-- Create a Highlight part
local highlightPart = Instance.new("Part")
highlightPart.Name = "Highlight"
highlightPart.Size = Vector3.new(3, 5, 3)
highlightPart.Transparency = 0.5
highlightPart.BrickColor = BrickColor.new("Bright red")
highlightPart.CanCollide = false
highlightPart.TopSurface = Enum.SurfaceType.Smooth
highlightPart.BottomSurface = Enum.SurfaceType.Smooth
highlightPart.Parent = workspace

-- Define the function to update the player's look direction
local function updateLookDirection()
    if character and toggleEnabled then
        -- Get all HumanoidRootPart instances in the game within the range
        local humanoidRootParts = {}
        local playerPosition = character.HumanoidRootPart.Position
        for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local part = otherPlayer.Character.HumanoidRootPart
                local distance = (part.Position - playerPosition).Magnitude
                if distance <= getgenv().maxRange then
                    table.insert(humanoidRootParts, part)
                end
            end
        end

        -- Find the closest HumanoidRootPart with a living Humanoid
        local closestPart = nil
        local closestDistance = math.huge
        for _, part in ipairs(humanoidRootParts) do
            local distance = (part.Position - playerPosition).Magnitude
            if distance < closestDistance then
                local humanoid = part.Parent:FindFirstChild("Humanoid")
                if humanoid and humanoid.Health > 0 then
                    closestPart = part
                    closestDistance = distance
                end
            end
        end

        -- Update the player's look direction if a closest part is found
        if closestPart then
            local lookVector = (closestPart.Position - playerPosition).Unit
            lookVector = Vector3.new(lookVector.X, 0, lookVector.Z).Unit
            local lookRotation = CFrame.lookAt(Vector3.new(), lookVector)
            character.HumanoidRootPart.CFrame = CFrame.new(playerPosition) * lookRotation

            -- Set the Highlight part's CFrame to match the target's position
            highlightPart.CFrame = CFrame.new(closestPart.Position)

            -- Check if the teleport key is pressed and teleport behind the target
            if game:GetService("UserInputService"):IsKeyDown(getgenv().teleportKey) then
                local teleportOffset = getgenv().TPDistance -- Adjust this value to control the distance of the teleport
                local teleportPosition = closestPart.Position - closestPart.CFrame.LookVector * teleportOffset

                -- Set the character's look direction towards the target
                local lookVector = (closestPart.Position - teleportPosition).Unit
                lookVector = Vector3.new(lookVector.X, 0, lookVector.Z).Unit
                local lookRotation = CFrame.lookAt(Vector3.new(), lookVector)

                -- Teleport the character and set the look direction
                character.HumanoidRootPart.CFrame = CFrame.new(teleportPosition) * lookRotation
            end
        end
    end
end
-- Function to handle toggle key press
local function onToggleKeyPressed()
    toggleEnabled = not toggleEnabled
    updateLookDirection()
end

-- Function to handle character added event
local function onCharacterAdded(newCharacter)
    character = newCharacter
    updateLookDirection()
end

-- Call the function initially
if player.Character then
    onCharacterAdded(player.Character)
end

-- Connect the function to the CharacterAdded event
player.CharacterAdded:Connect(onCharacterAdded)

-- Connect the toggle function to the toggle key press event
game:GetService("UserInputService").InputBegan:Connect(function(input, isProcessed)
    if not isProcessed then
        if input.KeyCode == getgenv().ToggleKey1 then
            onToggleKeyPressed()
        end
    end
end)

-- Connect the function to the RunService's Heartbeat event to update every frame
local runService = game:GetService("RunService")
runService.Heartbeat:Connect(updateLookDirection)

-- Track the modify tool state
local modifyToolEnabled = false

-- Function to handle modify tool key press
local function onModifyToolKeyPressed()
    modifyToolEnabled = not modifyToolEnabled
    
    -- Check if the Local Player is holding a tool
    local tool = player.Character:FindFirstChildOfClass("Tool")
    if tool then
        -- Modify the tool's handle
        local handle = tool:FindFirstChild("Handle")
        if handle then
            if modifyToolEnabled then
                -- Modify the handle appearance
                handle.Size = Vector3.new(getgenv().ReachSize) -- Adjust the size to your desired value
                handle.BrickColor = BrickColor.new("Bright blue") -- Adjust the color to your desired value
                handle.Shape = getgenv().ReachType -- Adjust the shape to your desired value
                handle.Transparency = 0.7
            else
                -- Reset the handle appearance
                handle.Size = Vector3.new(1, 0.8, 4)
                handle.Shape = Enum.PartType.Block
                handle.Transparency = 1
            end
        end
    end
end

-- Connect the modify tool function to the modify tool key press event
game:GetService("UserInputService").InputBegan:Connect(function(input, isProcessed)
    if not isProcessed then
        if input.KeyCode == getgenv().modifyToolKey then
            onModifyToolKeyPressed()
        end
    end
end)

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({IntroText = "Hi",Name = "c1ps Hub", HidePremium = true, SaveConfig = true, ConfigFolder = "c1ps Hub Config"})
local Zort = game:GetService("Players").LocalPlayer
--Value lar
getgenv().AntiAfk = false
getgenv().plrName = Zort.DisplayName
getgenv().ClanTag = false
getgenv().AutoSpin = false
getgenv().Plinko = false
getgenv().ACD = false

--function lar

function Plinko()
    while getgenv().Plinko == true do
for i, v in pairs(game:GetService("Workspace").ArenasREAL:GetDescendants()) do
	if v:IsA("Part") then
	if v.Name == "HitGreen" then
v.Size = Vector3.new(1, 20, 20)
v.Transparency = 1
wait(1.5)
end
end
end
end
end
    
    
    
function AutoSpin()
    while getgenv().AutoSpin == true do
game:GetService("ReplicatedStorage").RemoteCalls.GameSpecific.DailySpinner.ClaimDailySpinner:InvokeServer()
wait(.7)
Zort.PlayerScripts.GameSpecific.Buttons_l.CloseAll:Fire()
wait(.3)
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

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/50)
        end
    end)
end)
--function auto
function ACD()
    while getgenv().ACD == true do
    workspace[Zort.Name].FJsMovementAnticheat:destroy()
    wait()
    end
end

local UserInputService = game:GetService("UserInputService")

local function checkJump()
    local character = game.Players.LocalPlayer.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    if getgenv().InfJump == true and humanoid and humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end

function InfJump()
    while getgenv().InfJump == true do
print("Cips Hub: enabled inf jump")
wait(math.huge)
end
end

UserInputService.JumpRequest:Connect(checkJump)

--menü
local FarmTab = Window:MakeTab({
	Name = "Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local SWTab = Window:MakeTab({
	Name = "Sword Fight",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local CodesTab = Window:MakeTab({
	Name = "Code Redeem",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local PlayerTab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local CrTab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
CrTab:AddParagraph("Script made by!","Cips#9611")
CrTab:AddParagraph("Our discord server:","Cips Hub")
CrTab:AddButton({
	Name = "Join Discord For Updates and Community!",
	Callback = function()
        setclipboard("https://discord.gg/Qvf4KMrj5H")
  	end    
})
CrTab:AddButton({
	Name = "Clan Tag",
	Callback = function()
Zort.DisplayName = "$Cips$ "..getgenv().plrName
  	end    
})
SWTab:AddToggle({
	Name = "Inf Jump",
	Default = false,
	Callback = function(Value)
		getgenv().InfJump = Value 
InfJump() 
    end
})
FarmTab:AddButton({
	Name = "Unlock All Gamepasses *ClientSide*",
	Callback = function()
    for i, v in pairs(Zort.DataSave.Common.FillOnStart.Gamepasses:GetChildren()) do
    if v.Value == false or nil then
    v.Value = true
    end
  	end
    end
})
FarmTab:AddToggle({
	Name = "AntiCheat Disabler",
	Default = false,
	Callback = function(Value)
		getgenv().ACD = Value 
ACD() 
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
	Name = "Auto Spin",
	Default = false,
	Callback = function(Value)
		getgenv().AutoSpin = Value 
AutoSpin() 
    end
})
FarmTab:AddToggle({
	Name = "Plinko %100 hit rate",
	Default = false,
	Callback = function(Value)
		getgenv().Plinko = Value 
Plinko() 
    end
})
--buton
CodesTab:AddButton({
	Name = "Rodrig50",
	Callback = function()
local ohString1 = "rodrig50"

game:GetService("ReplicatedStorage").RemoteCalls.GameSpecific.Settings.EnterCode:InvokeServer(ohString1)
end
})
CodesTab:AddButton({
	Name = "Vrozix",
	Callback = function()
local ohString1 = "vrozix"

game:GetService("ReplicatedStorage").RemoteCalls.GameSpecific.Settings.EnterCode:InvokeServer(ohString1)
end
})
CodesTab:AddButton({
	Name = "Starla",
	Callback = function()
local ohString1 = "starla"

game:GetService("ReplicatedStorage").RemoteCalls.GameSpecific.Settings.EnterCode:InvokeServer(ohString1)
end
})
CodesTab:AddButton({
	Name = "sxmply777",
	Callback = function()
local ohString1 = "sxmply777"

game:GetService("ReplicatedStorage").RemoteCalls.GameSpecific.Settings.EnterCode:InvokeServer(ohString1)
end
})
CodesTab:AddButton({
	Name = "Moe111",
	Callback = function()
local ohString1 = "moe111"

game:GetService("ReplicatedStorage").RemoteCalls.GameSpecific.Settings.EnterCode:InvokeServer(ohString1)
end
})
FarmTab:AddButton({
	Name = "Server Hop",
	Callback = function()
local player = game.Players.LocalPlayer
local PlaceID = game.PlaceID

game:GetService("TeleportService"):Teleport(PlaceID, player)
  	end    
})
CodesTab:AddButton({
	Name = "Cookie555",
	Callback = function()
local ohString1 = "cookie555"

game:GetService("ReplicatedStorage").RemoteCalls.GameSpecific.Settings.EnterCode:InvokeServer(ohString1)
end
})
PlayerTab:AddSlider({
	Name = "Speed",
	Min = 0,
	Max = 200,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Value)
		TargetWalkspeed = Value
	end    
})
PlayerTab:AddTextbox({
	Name = "Webhook ID",
	Default = " ",
	TextDisappear = true,
	Callback = function(Value)
	local Webhook = Value
	end	  
})

getgenv().WaitTime = 10

PlayerTab:AddTextbox({
	Name = "Send data every second",
	Default = "10",
	TextDisappear = true,
	Callback = function(Value)
		getgenv().WaitTime = Value
	end	  
})

for i, v in pairs(game:GetService("Players").LocalPlayer.leaderstats:GetDescendants()) do
                   v.Value = getgenv().bobux
                   end
                   
local Headers = {["content-type"] = "application/json"} 
local LocalPlayer = game:GetService("Players").LocalPlayer
local PlayerName = game.Players.LocalPlayer.Name
local gameID = game.PlaceId
local gameNAME = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Zort = "game.Players.LocalPlayer.Name"
local Zt = LocalPlayer.UserId

function HOOK()
    while getgenv().HOOK == true do
local PlayerData =
{
       ["content"] = "",
       ["embeds"] = {
           {
           ["title"] = "Cips baba ile katla!",
           ["description"] = ":)",
           ["color"] = tonumber(0x2B6BE4),
           ["fields"] = {
               {
                   ["name"] = "Oyun link:",
                   ["value"] = "https://www.roblox.com/games/"..gameID,
                   ["inline"] = true
},
               {
                   ["name"] = "Hesap:",
                   ["value"] = game.Players.LocalPlayer.Name,
                   ["inline"] = true
},
               {
                   ["name"] = "Hesabın Roblox Profili:",
                   ["value"] = "https://www.roblox.com/users/"..Zt.."/profile",
                   ["inline"] = true
},
               {
                   ["name"] = "Şuanki Statlar:",
                   ["value"] = getgenv().bobux,
                   ["inline"] = true
},
           },
       }
     }
   }

local PlayerData = game:GetService('HttpService'):JSONEncode(PlayerData)

Request = http_request or request or HttpPost or syn.request
Request({Url=Webhook, Body=PlayerData, Method="POST", Headers=Headers})
wait(getgenv().WaitTime)
end
end

PlayerTab:AddToggle({
	Name = "Send Data",
	Default = false,
	Callback = function(Value)
		getgenv().HOOK = Value 
HOOK() 
    end
})

SWTab:AddTextbox({
	Name = "Aimbot",
	Default = "R",
	TextDisappear = false,
	Callback = function(Value)
		getgenv().ToggleKey1 = Enum.KeyCode[Value]
	end	  
})

SWTab:AddTextbox({
	Name = "Teleport Strafe",
	Default = "T",
	TextDisappear = false,
	Callback = function(Value)
		getgenv().teleportKey = Enum.KeyCode[Value]
	end	  
})

SWTab:AddTextbox({
	Name = "Reach",
	Default = "F",
	TextDisappear = false,
	Callback = function(Value)
		getgenv().modifyToolKey = Enum.KeyCode[Value]
	end	  
})

SWTab:AddSlider({
	Name = "Aimbot Distance",
	Min = 0,
	Max = 50,
	Default = 20,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Value)
		getgenv().maxRange = Value
	end    
})

SWTab:AddSlider({
	Name = "Reach Size",
	Min = 0,
	Max = 50,
	Default = 30,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Value)
		getgenv().ReachSize = Value, Value, Value
	end    
})

SWTab:AddDropdown({
	Name = "Select Reach Type",
	Default = "Enum.PartType.Ball",
	Options = {"Enum.PartType.Ball", "Enum.PartType.Block", "Enum.PartType.CornerWedge", "Enum.PartType.Cylinder", "Enum.PartType.Wedge"},
	Callback = function(Value)
		getgenv().ReachType = Value
	end    
})

SWTab:AddSlider({
	Name = "Teleport Distance",
	Min = 0,
	Max = 10,
	Default = 4,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Value)
		getgenv().TPDistance = Value
	end    
})

OrionLib:Init()

task.wait(2)
