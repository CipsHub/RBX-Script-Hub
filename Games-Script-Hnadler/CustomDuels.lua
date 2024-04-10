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

getgenv().ReachSizeY = 30
getgenv().ReachSizeX = 30
getgenv().ReachSizeZ = 30
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

            local tool2 = player.Character:FindFirstChildOfClass("Tool")
            if not tool2 and getgenv().autoActivateToolEnabled then
                -- Search for the tool in a loop until it becomes available
                while not tool2 do
                    wait()
                    tool2 = player.Character:FindFirstChildOfClass("Tool")
                end
            end

            if tool2 and getgenv().autoActivateToolEnabled then
                tool2:Activate()
            end
            
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
                handle.Size = Vector3.new(getgenv().ReachSizeX, getgenv().ReachSizeY, getgenv().ReachSizeZ) -- Adjust the size to your desired value
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
local Window = OrionLib:MakeWindow({IntroText = "Hi",Name = "c1ps Hub", HidePremium = true, SaveConfig = false, ConfigFolder = "c1ps Hub Config"})
local Zort = game:GetService("Players").LocalPlayer

getgenv().AntiAfk = false
getgenv().plrName = Zort.DisplayName
getgenv().ClanTag = false

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
wait(999999999999999999999999999999999999999999999999999999999999999999999999999)
end
end

function autoActivateToolEnabled()
    while getgenv().autoActivateToolEnabled == true do
print("Cips Hub: enabled autoActivateTool")
wait(999999999999999999999999999999999999999999999999999999999999999999999999999)
end
end

UserInputService.JumpRequest:Connect(checkJump)

--menü

local SWTab = Window:MakeTab({
	Name = "Sword Fight",
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

CrTab:AddParagraph("Script made by!","c1ps")

CrTab:AddParagraph("Our discord server:","c1ps Hub")

CrTab:AddButton({
	Name = "Join Discord For Updates and Community!",
	Callback = function()
        setclipboard("https://discord.gg/Qvf4KMrj5H")
  	end    
})

CrTab:AddButton({
	Name = "Clan Tag",
	Callback = function()
Zort.DisplayName = "$c1ps$ "..getgenv().plrName
  	end    
})

PlayerTab:AddToggle({
	Name = "Inf Jump",
	Default = false,
	Callback = function(Value)
		getgenv().InfJump = Value 
InfJump() 
    end
})

SWTab:AddToggle({
	Name = "Auto Swing",
	Default = false,
	Callback = function(Value)
		getgenv().autoActivateToolEnabled = Value 
		autoActivateToolEnabled() 
    end
})

PlayerTab:AddToggle({
	Name = "Anti Afk",
	Default = false,
	Callback = function(Value)
		getgenv().AntiAfk = Value 
AntiAfk() 
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
	Name = "Reach SizeX",
	Min = 0,
	Max = 50,
	Default = 30,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Value)
		getgenv().ReachSizeX = Value
	end    
})

SWTab:AddSlider({
	Name = "Reach SizeY",
	Min = 0,
	Max = 50,
	Default = 30,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Value)
		getgenv().ReachSizeY = Value
	end    
})

SWTab:AddSlider({
	Name = "Reach SizeZ",
	Min = 0,
	Max = 50,
	Default = 30,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Value)
		getgenv().ReachSizeZ = Value
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

SWTab:AddDropdown({
	Name = "Target Box Color",
	Default = "Bright red",
	Options = {"Bright red", "Red", "Black", "Blue", "Cyan", "Pink", "White"},
	Callback = function(Value)
    game:GetService("Workspace").Highlight.BrickColor = BrickColor.new(Value)
	end    
})

SWTab:AddSlider({
	Name = "Box Transparency",
	Min = 0,
	Max = 1,
	Default = 0.3,
	Color = Color3.fromRGB(255,255,255),
	Increment = 0.05,
	ValueName = ":)",
	Callback = function(Value)
    game:GetService("Workspace").Highlight.Transparency = Value
	end    
})

OrionLib:Init()

task.wait(2)
