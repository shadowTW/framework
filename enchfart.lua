local PettoRarity = {}
local a = require(game:GetService("ReplicatedStorage").Framework.Modules["1 | Directory"].Pets["Grab All Pets"])
for i, v in pairs(a) do
PettoRarity[i] = v.rarity
end

function GetPetTable(PetUID)
local Library = require(game:GetService("ReplicatedStorage").Framework.Library)
for i, v in pairs(Library.Save.Get().Pets) do
    if v.uid == PetUID then
        return v
    end
end
end
workspace.__THINGS.__REMOTES.MAIN:FireServer("b", "enchant pet")
wait(0.5)
local Library = require(game:GetService("ReplicatedStorage").Framework.Library)
while _G.EnabledEnchant do
for i, v in pairs(Library.Save.Get().Pets) do
if v.e and PettoRarity[v.id] ~= 'Mythical' and not _G.EMERGENCYSTOP then
    local haspower = false
    repeat wait()
        if GetPetTable(v.uid).powers then
            for a, b in pairs(GetPetTable(v.uid).powers) do
                warn(b[1], b[2])
                print(Wanted[b[1]])
                if Wanted[b[1]] ~= nil and not haspower and not _G.EMERGENCYSTOP then
                    if Wanted[b[1]] <= b[2] then
                        haspower = true
                        warn("Pet", v.uid, "has", b[1], b[2])
                    end
                end
            end
            if not haspower and not _G.EMERGENCYSTOP then
                print("Yea we kinda need new enchantments on", v.uid)

                workspace.__THINGS.__REMOTES["enchant pet"]:InvokeServer({[1] = v.uid})
                wait(0.1)
            end
        else
            warn("taking", v.uid,'\'s enchanting virginity lol')
            workspace.__THINGS.__REMOTES["enchant pet"]:InvokeServer({[1] = v.uid})
            wait(0.1)
        end
    until haspower == true or Library.Save.Get().Diamonds < 10000 or _G.EMERGENCYSTOP or _G.EnabledEnchant == false
end
end
end
