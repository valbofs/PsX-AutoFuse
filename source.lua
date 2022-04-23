_G.AutoFuse = true

while _G.AutoFuse do wait()

	local suc,err = pcall(function()

		local amountToFuse = 12 -- 3 to 12
		local petsToFuse = {}
		petsToFuse[1] = {}

		for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
			if v:IsA("TextButton") then
				if #game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren() > amountToFuse and #petsToFuse[1] < amountToFuse and not v.RarityGradient:FindFirstChild("Mythical") then
					print(v.Name)
					table.insert(petsToFuse[1],v.Name)
				end
			end
		end
		
		if #petsToFuse[1] >= amountToFuse and #petsToFuse[1] > 2 and #game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets:GetChildren() > amountToFuse then
			workspace.__THINGS.__REMOTES["fuse pets"]:InvokeServer(petsToFuse)
			petsToFuse[1] = {}
		else
			print("not enough pets to fuse")
		end
		
	end)

	if err then print(err) end

end
