local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({IntroText = "Hi",Name = "nfpw hub", HidePremium = true})
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local Range = 30
local char = lp.Character
local charPosition = char:WaitForChild("HumanoidRootPart").Position

getgenv().AutoDoor = false
getgenv().AutoCandy = false
getgenv().AntiAfk = false
getgenv().waitTime = .5

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

function AutoCandy()
    while getgenv().AutoCandy == true do
        local char = lp.Character
        local WorkspaceSearch = game:GetService("Workspace"):GetDescendants()
        if char and char.Humanoid.Health > 0 then
            for _, Candy in pairs(WorkspaceSearch) do
                if string.find(Candy.Name, "Candy") then
                    if Candy.Transparency == 0 then
                        local CandyPosition = Candy.Position
                        local charPosition = char:WaitForChild("HumanoidRootPart").Position
                        local distance = (CandyPosition - charPosition).Magnitude
                        if distance <= Range then
                            game:GetService("ReplicatedStorage").candyClicked:FireServer(workspace[Candy.Name])
                        end
                    end
                end
            end
        end
        wait(.15)
    end
end

function AutoDoor()
    while getgenv().AutoDoor == true do
        local char = lp.Character
        local WorkspaceSearch2 = game:GetService("Workspace"):GetDescendants()
        if char and char.Humanoid.Health > 0 then
            for _, Door in pairs(WorkspaceSearch2) do
                if Door.Name == "Trick/Treat Prompt" then
                    char.HumanoidRootPart.CFrame = Door.Parent.CFrame
                    wait(waitTime)
                    fireproximityprompt(Door)
                end
            end
        end
        wait(.3)
    end
end

local FarmTab = Window:MakeTab({
	Name = "Farm",
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
	Name = "Auto Open Doors",
	Default = false,
	Callback = function(Value)
        getgenv().AutoDoor = Value 
        AutoDoor() 
    end
})

FarmTab:AddToggle({
	Name = "Auto Collect Candys",
	Default = false,
	Callback = function(Value)
        getgenv().AutoCandy = Value 
        AutoCandy() 
    end
})

OrionLib:Init()

task.wait(2)
