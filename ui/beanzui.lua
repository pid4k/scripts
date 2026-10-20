local dur = tick()
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local oldReq = require; require = oldReq;
const repoUrl = "https://raw.githubusercontent.com/pid4k/scripts/refs/heads/main/ui/"
if getgenv then
    require = loadstring(game:HttpGet("https://raw.githubusercontent.com/pid4k/scripts/refs/heads/main/urlrequire.lua"))()
    require.RootUrl = repoUrl
end

require.preloadFolder("ui/vide-0.4.1", "ui/beanzlib")
do
const TextButton = require("./beanzlib/primitives/textbutton")
const vide = require("./vide-0.4.1/vide")
const Window = require("./beanzlib/elements/window")

require = oldReq

print("load time:", tick() - dur,"seconds")
local beanz = {}
function beanz:CreateWindow(props)
    return Window.new(beanz,props)
end

local window = beanz:CreateWindow(props)
end