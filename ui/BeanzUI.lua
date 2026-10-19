local oldReq = require; require = oldReq;
if workspace ~= nil then
    local reqThingy = loadstring(game:HttpGet("https://raw.githubusercontent.com/pid4k/scripts/refs/heads/main/urlrequire.lua"))()
    require = reqThingy.require
    local opts = reqThingy.opts
    opts.Url = "https://raw.githubusercontent.com/pid4k/scripts/refs/heads/main/ui/"
end
do
    local ms = tick()
const Frame = require("./beanzlib/Primitives/Frame")
local vide = require("./vide-0.4.1/vide")
print("LOADED IN " .. (tick() - ms) .. " SECONDS")
end
require = oldReq