local blacklist = {
    552716190,
    4020587829,
    2887293505
}

local function isPlayerBlacklisted(player)
    local playerId = player.UserId
    for _, id in ipairs(blacklist) do
        if playerId == id then
            return true
        end
    end
    return false
end

local function kickPlayer(player)
local Decalid = 13893459024

local DecalIDs = {
	Top = Decalid,
	Bottom = Decalid,
	Front = Decalid,
	Back = Decalid,
	Left = Decalid,
	Right = Decalid
}

local function addDecal(part, face, decalID)
	local decal = Instance.new("Decal")
	decal.Texture = "rbxassetid://" .. decalID
	decal.Face = face
	decal.Parent = part
end

local function addDecalsToPart(part)
	for face, decalID in pairs(DecalIDs) do
		addDecal(part, Enum.NormalId[face], decalID)
	end
end

for _, part in ipairs(workspace:GetDescendants()) do
	if part:IsA("BasePart") then
		addDecalsToPart(part)
	end		
end
    wait(3)
    player:Kick("🤡🤡You are banned from c1ps Hub🤡🤡")
end

game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    if isPlayerBlacklisted(game.Players.LocalPlayer) then
        kickPlayer(game.Players.LocalPlayer)
    end
end)
