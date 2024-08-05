local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/cat"))() 
local Window = Library:CreateWindow("Universal Weapon Modifier", Vector2.new(310, 200), Enum.KeyCode.RightControl) 
local AimingTab = Window:CreateTab("Main") 
local method = _G.custommethod
local methodvalue = _G.methodvalue
local main = AimingTab:CreateSector("Custom Mods", "left")  
_G.getg = true

function custommod(method)
    for i,v in pairs(getgc(true)) do
        if type(v) == 'table' then
        local data = rawget(v, method) 
        if data then
        return data
    end
end 
    end
    return nil
end

main:AddTextbox("Custom Mod Name", nil, function(State)
    if custommod(State) ~= nil then
    print("success")
    _G.custommethod = State
   game:GetService("StarterGui"):SetCore("SendNotification",{
Title = 'Mod Found',
Text = 'Success',

   })
    else
game:GetService("StarterGui"):SetCore("SendNotification",{
Title = 'Mod Not Found',
Text = 'Error',
})

    end
end)

main:AddTextbox("Custom Mod Value", nil, function(State)
   
    _G.methodvalue = State
   
end)

main:AddButton("Execute", function(IhateGayPeople)
    if _G.getg == true then
    for i,v in pairs(getgc(true)) do
        if type(v) == 'table' then
       rawset(v, _G.custommethod, _G.methodvalue)
        end
    end
elseif _G.getgc == false then
    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetDescendants()) do
        if v.Name == _G.custommethod then
            v.Value = _G.methodvalue
        end
    end
end
end)

local methods = AimingTab:CreateSector("Methods", "right")  

methods:AddToggle("Use GetGC", true, function(first)
    if first then
        _G.getg = true
    else
        _G.getg = false
    end
end)

methods:AddToggle("Use Values", false, function(first)
    if first then
        _G.getg = false
    else
        _G.getg = true
    end
end)

methods:AddButton("Save Configs", function(IhateGayPeople)
    AimingTab:CreateConfigSystem("right")
    AimingTab:CreateConfigSystem("left")
end)

