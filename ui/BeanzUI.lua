local HttpService = game:GetService("HttpService")
local oldReq = require; require = oldReq;
const uiFolderUrl = "https://raw.githubusercontent.com/pid4k/scripts/refs/heads/main/ui/"
if getgenv() then
    require = loadstring(game:HttpGet("https://raw.githubusercontent.com/pid4k/scripts/refs/heads/main/urlrequire.lua"))()
    require.RootUrl = uiFolderUrl
end

require.preloadFolder("ui/vide-0.4.1")
require.preloadFolder("ui/beanzlib")
do
const Frame = require("./beanzlib/Primitives/Frame")
local vide = require("./vide-0.4.1/vide")
end
require = oldReq

