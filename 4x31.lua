if game.PlaceId == 6284583030 then
    repeat wait() until game:GetService("Players")
    repeat wait() until game:GetService("Players").LocalPlayer
    repeat wait() until game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Loading"):WaitForChild("Black").BackgroundTransparency == 1
    repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    
    local GameLibrary = require(game:GetService("ReplicatedStorage").Framework.Library)
    local IDToName = {}
    local PettoRarity = {}
    for i,v in pairs(GameLibrary.Directory.Pets) do
        IDToName[i] = v.name
        PettoRarity[i] = v.rarity
    end
    local tablething = {
        [1] = 'I';
        [2] = 'II';
        [3] = 'III';
        [4] = 'IV';
        [5] = 'V'
    }
    _G.Connections = {}
    local Inventory = game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame
    local Query = Inventory.Bottom.Search.Query
    local NewQuery = Query:Clone()
    NewQuery.Parent = Query.Parent
    Query:Destroy()

    function UpdateInventory()
        local NewText = NewQuery.Text
        NewText = NewText:lower()
        for i,v in pairs(GameLibrary.Save.Get().Pets) do
            local ThingyThingyTempTypeThing = (v.g and 'Gold') or (v.r and 'Rainbow') or (v.dm and 'Dark Matter') or 'Normal'
            local Enchantments = ""
            if v.powers then
                for aa,bb in pairs(v.powers) do
                    if bb[1] == 'Teamwork' and bb[2] == 2 then Enchantments = Enchantments .. " STW\n" end
                    if bb[1] == 'Tech Coins' then Enchantments = Enchantments .. "TC " .. bb[2].." \n" end
                    if bb[1] == 'Tech Coins' then Enchantments = Enchantments .. "TC " .. tablething[bb[2]].." \n" end
                    if bb[1] == 'Tech Coins' then Enchantments = Enchantments .. "TC" .. bb[2].." \n" end
                    if bb[1] == 'Tech Coins' then Enchantments = Enchantments .. "TC" .. tablething[bb[2]].." \n" end
                    if bb[1] == 'Chests' then Enchantments = Enchantments .. "CB " .. tablething[bb[2]].." \n" end
                    if bb[1] == 'Chests' then Enchantments = Enchantments .. "CB " .. bb[2].." \n" end
                    if bb[1] == 'Chests' then Enchantments = Enchantments .. "CB" .. tablething[bb[2]].." \n" end
                    if bb[1] == 'Chests' then Enchantments = Enchantments .. "CB" .. bb[2].." \n" end
                    if bb[1] == 'Chests' then Enchantments = Enchantments .. "Chest Breaker " .. tablething[bb[2]].." \n" end
                    if bb[1] == 'Chests' then Enchantments = Enchantments .. "Chest Breaker " .. bb[2].." \n" end
                    Enchantments = Enchantments .. bb[1] .. " " .. tablething[bb[2]].." \n"
                    Enchantments = Enchantments .. bb[1] .. " " .. bb[2].." \n"
                end
            end
            if string.find(PettoRarity[v.id]:lower(), NewText) or string.find(ThingyThingyTempTypeThing:lower(), NewText) or string.find(IDToName[v.id]:lower(), NewText) or string.find(v.nk:lower(), NewText) or string.find(Enchantments:lower(), NewText) then
                Inventory.Main.Pets:FindFirstChild(v.uid).Visible = true
            else
                Inventory.Main.Pets:FindFirstChild(v.uid).Visible = false
            end
        end
    end

    if _G.Connections["QueryConnect"] then _G.Connections["QueryConnect"]:Disconnect() end
    _G.Connections["QueryConnect"] = NewQuery:GetPropertyChangedSignal("Text"):Connect(UpdateInventory)

    local Check = {'Rename', 'MultiDelete', 'Grid', 'EquipBest'}
    for _, v in pairs(Check) do
        if _G.Connections[v] then _G.Connections[v]:Disconnect() end
        _G.Connections[v] = Inventory.Bottom[v].Changed:Connect(UpdateInventory)
    end
    if _G.Connections['ContentSize'] then _G.Connections['ContentSize']:Disconnect() end
    _G.Connections['ContentSize'] = game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.UIGridLayout.Changed:connect(UpdateInventory)
    if _G.Connections['EquippedChanged'] then _G.Connections['EquippedChanged']:Disconnect() end
    _G.Connections['EquippedChanged'] = game:GetService("Players").LocalPlayer.PlayerGui.Main.Bottom.Inventory.Equipped:GetPropertyChangedSignal("Text"):connect(UpdateInventory)
    if _G.Connections['InvAdd'] then _G.Connections['InvAdd']:Disconnect() end
    _G.Connections['InvAdd'] = Inventory.Main.Pets.ChildAdded:connect(UpdateInventory)
    if _G.Connections['InvRemove'] then _G.Connections['InvRemove']:Disconnect() end
    _G.Connections['InvRemove'] = Inventory.Main.Pets.ChildRemoved:connect(UpdateInventory)
    if _G.Connections['PetAdd'] then _G.Connections['PetAdd']:Disconnect() end
    _G.Connections['PetAdd'] = game:GetService("Workspace")["__THINGS"].Pets.ChildAdded:connect(UpdateInventory)
    if _G.Connections['PetRemove'] then _G.Connections['PetRemove']:Disconnect() end
    _G.Connections['PetRemove'] = game:GetService("Workspace")["__THINGS"].Pets.ChildRemoved:connect(UpdateInventory)
end
