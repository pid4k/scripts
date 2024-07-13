-- // GUI TO LUA \\ --

-- // INSTANCES: 3 | SCRIPTS: 1 | MODULES: 0 \\ --

local UI = {}

-- // ServerStorage.Mobile Support.autocrate \\ --
UI["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
UI["1"]["IgnoreGuiInset"] = true
UI["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets
UI["1"]["Name"] = [[autocrate]]
UI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
UI["1"]["ResetOnSpawn"] = false

-- // ServerStorage.Mobile Support.autocrate.AutoCrate \\ --
UI["2"] = Instance.new("LocalScript", UI["1"])
UI["2"]["Name"] = [[AutoCrate]]

-- // ServerStorage.Mobile Support.autocrate.Start \\ --
UI["3"] = Instance.new("BindableEvent", UI["1"])
UI["3"]["Name"] = [[Start]]

-- // ServerStorage.Mobile Support.autocrate.AutoCrate \\ --
local function SCRIPT_2()
local script = UI["2"]
	if not game:IsLoaded() then
		game.Loaded:Wait()
	end
	if game.PlaceId ~= 13083893317 then script.Parent:Destroy() return end
	local status = "lsStatus.txt"
	local player = game:GetService("Players").LocalPlayer
	PlaceId, JobId = game.PlaceId, game.JobId
	player.PlayerGui.DescendantAdded:Connect(function(descendant)
		if descendant:IsA("BindableEvent") then
			if descendant.Name == "CrateFarmStart" then
				descendant.Event:Connect(function()
					if readfile(status) == "running" then
						descendant:Fire()
					end
				end)
			end
		end
		
	end)
	
	if readfile(status) == "running" then
		script.Parent.Enabled = false
		task.wait(0.1)
		local stringg = "https://raw.githubusercontent.com/pid4k/scripts/main/lifesentence.lua"
		loadstring(game:HttpGet(stringg, true))()
		task.wait(0.4)
		local guievent = player.PlayerGui:WaitForChild("sploit"):WaitForChild("CrateFarmStart")
		guievent:Fire("button")
			guievent:Fire("start")
		task.delay(50,function()
			local Players = game:GetService("Players")
			local TeleportService = game:GetService("TeleportService")
			if #Players:GetPlayers() <= 1 then
				Players.LocalPlayer:Kick("\nRejoining...")
				wait()
				TeleportService:Teleport(PlaceId, Players.LocalPlayer)
			else
				TeleportService:TeleportToPlaceInstance(PlaceId, JobId, Players.LocalPlayer)
			end
			task.wait(4)
			while task.wait(1) do
				TeleportService:Teleport(PlaceId, Players.LocalPlayer)
			end
		end)
	end
	
	
end
task.spawn(SCRIPT_2)

return UI["1"], require;
