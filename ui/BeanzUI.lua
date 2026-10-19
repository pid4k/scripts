local oldReq = require; require = oldReq;
if workspace ~= nil then
    local reqThingy = loadstring(game:HttpGet("https://raw.githubusercontent.com/pid4k/scripts/refs/heads/main/urlrequire.lua"))()
    require = reqThingy.require
    reqThingy.Url = "https://raw.githubusercontent.com/pid4k/scripts/refs/heads/main/ui/"
    local oldImport = require
    require = function(str)
        print(str)
        return oldImport(str)
    end
end
do
const Frame = require("./beanzlib/Primitives/Frame")
    local vide = require("./vide-0.4.1/vide")
    print(vide)
    print(Frame)
end
require = oldReq