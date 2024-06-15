-- // GUI TO LUA (MODIFIED) \\ --

-- // INSTANCES: 3 | SCRIPTS: 1 | MODULES: 0 \\ --

local UI = {}

UI["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"))
UI["1"]["IgnoreGuiInset"] = true
UI["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets
UI["1"]["Name"] = [[autocrate]]
UI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
UI["1"]["ResetOnSpawn"] = false

UI["2"] = Instance.new("LocalScript", UI["1"])
UI["2"]["Name"] = [[AutoCrate]]

UI["3"] = Instance.new("BindableEvent", UI["1"])
UI["3"]["Name"] = [[Start]]

local function SCRIPT_2()
local script = UI["2"]
	
		if not game:IsLoaded() then
			game.Loaded:Wait()
		end
		local CoreGui = game:GetService("CoreGui")
		function checkvariable(file:string,variable:number):string
			if readfile(file) == nil then
				resetdefault(file,"nil",3)
			end
			local filecontents = readfile(file)
			local splitwordstable = filecontents:split(",")
			local putbacksentence = ""
			for option, word in splitwordstable do
				if option == variable then
					return word
				end
			end
		end
		if game.GameId ~= 4571439504 then script.Parent:Destroy() return end
		local status = "BeanzHub/lsStatus.txt"
		local player = game:GetService("Players").LocalPlayer
		PlaceId, JobId = game.PlaceId, game.JobId
		player.PlayerGui.DescendantAdded:Connect(function(descendant)
			if descendant:IsA("BindableEvent") then
				if descendant.Name == "CrateFarmStart" then
					descendant.Event:Connect(function()
						if readfile(status) == "running" then
						end
					end)
				end
			end
	
		end)
	
	
		if checkvariable(status,1) == "running" then
			script.Parent.Enabled = false
			task.wait(0.1)
			local stringg = "https://raw.githubusercontent.com/pid4k/scripts/main/lifesentence.lua"
			loadstring(game:HttpGet(stringg, true))()
			task.wait(0.4)
		local guievent = CoreGui:WaitForChild("sploit"):WaitForChild("CrateFarmStart")
			guievent:Fire("button","autostart")
			guievent:Fire("start","autostart")
			task.delay(300,function()
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
