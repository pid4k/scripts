local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

const Window = require("./components/window")
const Themes = require("../utils/themes/registry")

local defaultTweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local beanz = {
	Themes = Themes,
}

function beanz:CreateWindow(props)
	props = props or {}
	if not props.Parent and RunService:IsRunning() then
		props.Parent = (RunService:IsStudio() and Players.LocalPlayer and Players.LocalPlayer:WaitForChild("PlayerGui")) or game:GetService("CoreGui")
	end
	return Window.new(beanz, props)
end

beanz.New = beanz.CreateWindow

function beanz:Tween(object, tweenInfo, goal, callback)
	local tween = TweenService:Create(object, tweenInfo or defaultTweenInfo, goal)
	tween.Completed:Once(callback or function() end)
	tween:Play()
	return tween
end

return beanz
