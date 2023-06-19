-- Obtain the player's character
local player = game.Players.LocalPlayer
local character

-- Define the maximum range distance for looking at other players
local maxRange = 20 -- Adjust this value to your desired maximum range

-- Define the toggle key
_G.ToggleKey1 = Enum.KeyCode.R -- Adjust this key to your desired toggle key
_G.teleportKey = Enum.KeyCode.T -- Adjust this key to your desired teleport key
local modifyToolKey = Enum.KeyCode.F -- Adjust this key to your desired modify tool key

local ReachSize = 30, 30, 30
local ReachType = Enum.PartType.Ball

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
                if distance <= maxRange then
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
            if game:GetService("UserInputService"):IsKeyDown(_G.teleportKey) then
                local teleportOffset = 1 -- Adjust this value to control the distance of the teleport
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
        if input.KeyCode == _G.ToggleKey1 then
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
                handle.Size = Vector3.new(ReachSize) -- Adjust the size to your desired value
                handle.BrickColor = BrickColor.new("Bright blue") -- Adjust the color to your desired value
                handle.Shape = ReachType -- Adjust the shape to your desired value
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
        if input.KeyCode == modifyToolKey then
            onModifyToolKeyPressed()
        end
    end
end)

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({IntroText = "Hi",Name = "c1ps Hub", HidePremium = true, SaveConfig = true, ConfigFolder = "c1ps Hub Config"})

_G.KillAura = false
_G.AutoBlock = false
_G.NoSlow = false
_G.InfJump = false

function KillAura()
    while _G.KillAura == true do
game:GetService("ReplicatedStorage").Remotes.Hit:FireServer("Left Arm")
wait(0.3)
game:GetService("ReplicatedStorage").Remotes.Hit:FireServer("Right Arm")
wait(0.3)
end
end

function AutoBlock()
    while _G.AutoBlock == true do
        game:GetService("ReplicatedStorage").Remotes.Block:FireServer(true)
wait()
end
end


-- Get the local player
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Function to check and set the humanoid speed
local function checkSpeed()
    local humanoid = character:WaitForChild("Humanoid")
    
    if humanoid and humanoid:IsA("Humanoid") then
        if humanoid.WalkSpeed ~= 26 then
            humanoid.WalkSpeed = 26
        end
    end
end

function NoSlow()
    while _G.NoSlow == true do
    checkSpeed()
wait()
end
end

local UserInputService = game:GetService("UserInputService")

local function checkJump()
    local character = game.Players.LocalPlayer.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    if _G.InfJump == true and humanoid and humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end

function InfJump()
    while _G.InfJump == true do
print("enabled inf jump")
wait(1)
end
end

UserInputService.JumpRequest:Connect(checkJump)

--function auto

--menü
local FarmTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
--buton
FarmTab:AddToggle({
	Name = "Auto Atack",
	Default = false,
	Callback = function(Value)
_G.KillAura = Value 
KillAura() 
    end
})
FarmTab:AddToggle({
	Name = "Auto Block",
	Default = false,
	Callback = function(Value)
_G.AutoBlock = Value 
AutoBlock() 
    end
})
FarmTab:AddToggle({
	Name = "No Slow",
	Default = false,
	Callback = function(Value)
_G.NoSlow = Value 
NoSlow() 
    end
})
FarmTab:AddToggle({
	Name = "Inf Jump",
	Default = false,
	Callback = function(Value)
_G.InfJump = Value 
InfJump() 
    end
})
FarmTab:AddButton({
	Name = "Anti Water",
	Callback = function()
workspace.Interactives.Water:destroy()
local part = Instance.new("Part")
-- Set the properties of the part
part.Name = "Fake Water"
part.BrickColor = BrickColor.new("Bright blue")
part.Size = Vector3.new(500, 5, 500)
part.Position = Vector3.new(-42.8209648, 11.4999981, 7.27527189, -0.2)
part.Anchored = true
-- Parent the part to the workspace
part.Parent = workspace
end
})

FarmTab:AddTextbox({
	Name = "Aimbot",
	Default = "R",
	TextDisappear = false,
	Callback = function(Value)
		_G.ToggleKey1 = Enum.KeyCode[Value]
	end	  
})

FarmTab:AddTextbox({
	Name = "Teleport Strafe",
	Default = "T",
	TextDisappear = false,
	Callback = function(Value)
		_G.teleportKey = Enum.KeyCode[Value]
	end	  
})

OrionLib:Init()

task.wait(2)
