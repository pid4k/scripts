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
const TextButton = require("./beanzlib/Primitives/TextButton")
const vide = require("./vide-0.4.1/vide")
vide.mount(function()
    local btn; btn = TextButton {
        AnchorPoint = Vector2.new(.5,.5),
        Position = UDim2.fromOffset(0,0),
        Size = UDim2.fromOffset(100,100),
        Text = "Click me",
        BackgroundColor3 = Color3.new(.3,.3,.3),
        MouseButton1Click = function()
            btn:Destroy()
        end,
    }
    return vide.create"ScreenGui" {
        btn
    }
end,game:GetService("CoreGui"))
end
require = oldReq

print("load time:", tick() - dur,"seconds")

