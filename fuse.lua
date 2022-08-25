
if not workspace.__THINGS.__REMOTES:FindFirstChild("fuse pets") then
    workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "fuse pets")
    repeat wait() until workspace.__THINGS.__REMOTES:FindFirstChild("fuse pets")
end

local Library = require(game:GetService("ReplicatedStorage").Framework.Library)
local IDToName = {}
local NameToID = {}
for i,v in pairs(Library.Directory.Pets ) do
    IDToName[i] = v.name
    NameToID[v.name] = i
end

function GetPets()
    local MyPets = {}
    for i,v in pairs(Library.Save.Get().Pets) do
        local ThingyThingyTempTypeThing = (v.g and 'Gold') or (v.r and 'Rainbow') or (v.dm and 'Dark Matter') or 'Normal'
        local TempString = ThingyThingyTempTypeThing .. IDToName[v.id]
        if MyPets[TempString] then
            table.insert(MyPets[TempString], v.uid)
        else
            MyPets[TempString] = {}
            table.insert(MyPets[TempString], v.uid)
        end
    end
    return MyPets
end

function IsPossibleFuse(DirectoryOfPets)
    local ispossible = true
    local Pets = GetPets()
    local totalfusenum = 0
    for i,v in pairs(DirectoryOfPets) do
        local TempString = getgenv().Type .. i
        if not Pets[TempString] or #Pets[TempString] < v then
            ispossible = false
        end
        totalfusenum = totalfusenum + v
    end
    if totalfusenum > 12 then
        ispossible = false
    end
    return ispossible
end

local otherfuselist = {}
function getapet(petname)
    local LookingFor = (getgenv().Type == 'Gold' and 'g') or (getgenv().Type == 'Rainbow' and 'r') or (getgenv().Type == 'Dark Matter' and 'dm') or getgenv().Type == 'Normal' and 'eeeeee'
    local WantedPetID = NameToID[petname]
    for i,v in pairs(Library.Save.Get().Pets) do
        if v.id == WantedPetID and (getgenv().Type == 'Normal' or v[LookingFor]) and not table.find(otherfuselist, v.uid) then
            return v.uid
        end
    end
end

while wait() and getgenv().Enabled do
    for i,v in pairs(getgenv().FuseList) do
        if IsPossibleFuse(v) then
            local EekFuselist = {}
            otherfuselist = {}
            for a,b in pairs(v) do
                for eeeek = 1, b do
                    local PetUID = getapet(a)
                    EekFuselist[#EekFuselist + 1] = PetUID
                    table.insert(otherfuselist, PetUID)
                end
            end
            workspace.__THINGS.__REMOTES["fuse pets"]:InvokeServer({[1] = EekFuselist})
            wait(0.1)
        end
    end
end
