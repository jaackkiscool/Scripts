-- Simple Remote Finder (not a Remote Spy)

local p = game.Players.LocalPlayer
local m = p:GetMouse()
m.KeyDown:connect(function(_)    
    if _ == "p" then
        for i,v in pairs(game:GetDescendants()) do
            if v:IsA("RemoteEvent") then
                warn("Found a RemoteEvent: "..v:GetFullName())
            elseif v:IsA("RemoteFunction") then 
                print("Found a RemoteFunction: "..v:GetFullName()) 
            end
        end
    end
end)