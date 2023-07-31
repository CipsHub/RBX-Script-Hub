local id = game.PlaceId

if(id == 2609668898) then
local remotesFolder = game:GetService("ReplicatedStorage").Communication.Events

local function renameRemote(remote, newName)
    remote.Name = newName
end

local remotes = remotesFolder:GetChildren()

local remoteNames = {
    "c1psRemoteBypassTest1",
    "c1psRemoteBypassTest2",
    "c1psRemoteBypassTest3",
    "c1psRemoteBypassTest4",
    "c1psRemoteBypassTest5",
    "c1psRemoteBypassTest6",
    "c1psRemoteBypassTest7",
    "c1psRemoteBypassTest8",
    "c1psRemoteBypassTest9",
    "c1psRemoteBypassTest10",
    "c1psRemoteBypassTest11",
    "c1psRemoteBypassTest12",
    "c1psRemoteBypassTest13",
    "c1psRemoteBypassTest14",
    "c1psRemoteBypassTest15",
    "c1psRemoteBypassTest16",
    "c1psRemoteBypassTest17",
    "c1psRemoteBypassTest18",
    "c1psRemoteBypassTest19",
    "c1psRemoteBypassTest20",
    "c1psRemoteBypassTest21",
    "c1psRemoteBypassTest22",
    "c1psRemoteBypassTest23",
    "c1psRemoteBypassTest24",
    "c1psRemoteBypassTest25",
    "c1psRemoteBypassTest26",
    "DamageChest",
    "c1psRemoteBypassTest28",
    "c1psRemoteBypassTest29",
    "c1psRemoteBypassTest30",
    "c1psRemoteBypassTest31",
    "c1psRemoteBypassTest32",
    "c1psRemoteBypassTest33",
    "c1psRemoteBypassTest34",
    "c1psRemoteBypassTest35",
    "c1psRemoteBypassTest36",
    "c1psRemoteBypassTest37",
    "c1psRemoteBypassTest38",
    "c1psRemoteBypassTest39",
    "c1psRemoteBypassTest40",
    "c1psRemoteBypassTest41",
    "c1psRemoteBypassTest42",
    "c1psRemoteBypassTest43",
    "c1psRemoteBypassTest44",
    "c1psRemoteBypassTest45",
    "c1psRemoteBypassTest46",
    "c1psRemoteBypassTest47",
    "c1psRemoteBypassTest48",
    "c1psRemoteBypassTest49",
    "c1psRemoteBypassTest50",
    "CollectCoin",
    "c1psRemoteBypassTest52",
    "c1psRemoteBypassTest53",
    "c1psRemoteBypassTest54",
    "c1psRemoteBypassTest55",
    "c1psRemoteBypassTest56",
    "c1psRemoteBypassTest57",
    "c1psRemoteBypassTest58",
    "c1psRemoteBypassTest59",
    "c1psRemoteBypassTest60",
    "c1psRemoteBypassTest61",
    "c1psRemoteBypassTest62",
    "c1psRemoteBypassTest63",
    "c1psRemoteBypassTest64",
    "c1psRemoteBypassTest65",
    "c1psRemoteBypassTest66",
    "c1psRemoteBypassTest67",
    "c1psRemoteBypassTest68",
    "c1psRemoteBypassTest69",
    "c1psRemoteBypassTest70",
    "c1psRemoteBypassTest71",
    "c1psRemoteBypassTest72",
    "c1psRemoteBypassTest73",
    "c1psRemoteBypassTest74",
    "c1psRemoteBypassTest75",
    "c1psRemoteBypassTest76",
    "c1psRemoteBypassTest77",
    "c1psRemoteBypassTest78",
    "c1psRemoteBypassTest79",
    "c1psRemoteBypassTest80",
    "c1psRemoteBypassTest81",
    "c1psRemoteBypassTest82",
    "c1psRemoteBypassTest83",
    "c1psRemoteBypassTest84",
    "c1psRemoteBypassTest85",
    "c1psRemoteBypassTest86",
    "c1psRemoteBypassTest87",
    "c1psRemoteBypassTest88",
    "c1psRemoteBypassTest89",
}

for i, remote in ipairs(remotes) do
    local newName = remoteNames[i] or "RemoteBulunmadi!"
    renameRemote(remote, newName)
end

local functionsFolder = game:GetService("ReplicatedStorage").Communication.Functions

local function renameFunction(func, newName)
    func.Name = newName
end

local functions = functionsFolder:GetChildren()

local functionNames = {
    "c1psRemoteFunctionBypassTest1",
    "c1psRemoteFunctionBypassTest2",
    "c1psRemoteFunctionBypassTest3",
    "c1psRemoteFunctionBypassTest4",
    "c1psRemoteFunctionBypassTest5",
    "OpenEgg",
    "c1psRemoteFunctionBypassTest7",
    "c1psRemoteFunctionBypassTest8",
    "c1psRemoteFunctionBypassTest9",
    "c1psRemoteFunctionBypassTest10",
    "c1psRemoteFunctionBypassTest11",
    "c1psRemoteFunctionBypassTest12",
    "c1psRemoteFunctionBypassTest13",
    "c1psRemoteFunctionBypassTest14",
    "c1psRemoteFunctionBypassTest15",
    "c1psRemoteFunctionBypassTest16",
    "c1psRemoteFunctionBypassTest17",
    "c1psRemoteFunctionBypassTest18",
    "c1psRemoteFunctionBypassTest19",
    "c1psRemoteFunctionBypassTest20",
    "c1psRemoteFunctionBypassTest21",
    "c1psRemoteFunctionBypassTest22",
    "c1psRemoteFunctionBypassTest23",
    "c1psRemoteFunctionBypassTest24",
    "c1psRemoteFunctionBypassTest25",
    "c1psRemoteFunctionBypassTest26",
    "c1psRemoteFunctionBypassTest27",
    "c1psRemoteFunctionBypassTest28",
    "c1psRemoteFunctionBypassTest29",
    "c1psRemoteFunctionBypassTest30",
    "c1psRemoteFunctionBypassTest31",
    "c1psRemoteFunctionBypassTest32",
    "c1psRemoteFunctionBypassTest33",
    "c1psRemoteFunctionBypassTest34",
    "c1psRemoteFunctionBypassTest35",
    "c1psRemoteFunctionBypassTest36",
    "c1psRemoteFunctionBypassTest37",
}

for i, func in ipairs(functions) do
    local newName = functionNames[i] or "RemoteBulunmadi!"
    renameFunction(func, newName)
end
end
