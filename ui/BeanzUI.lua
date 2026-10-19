local HttpService = game:GetService("HttpService")
local oldReq = require; require = oldReq;
const repoUrl = "https://raw.githubusercontent.com/pid4k/scripts/refs/heads/main/"
if getgenv() then
    require = loadstring(game:HttpGet("https://raw.githubusercontent.com/pid4k/scripts/refs/heads/main/urlrequire.lua"))()
    --require.RootUrl = repoUrl
end
const headers = {
    ["Authorization"] = "Bearer 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",
    ["Accept"] = "application/vnd.github+json"
}
const response = request{
Url = `https://api.github.com/repos/pid4k/scripts/git/trees/main?recursive=1`,
Method = "GET",
Headers = headers,
}
const data = HttpService:JSONDecode(response.Body)
const function loadFolder(folderPath)
    const oldRootUrl = require.RootUrl
    require.RootUrl = repoUrl
    for _, node in data.tree do
        if node.type == "blob" and string.sub(node.path, 1, #folderPath) == folderPath then
            task.spawn(function()
               --print(node.path)
                require(node.path)
            end)
        end
    end
    require.RootUrl = oldRootUrl
end
-- relative to ui folder
loadFolder("ui/vide-0.4.1")
loadFolder("ui/beanzlib")
do
const Frame = require("./beanzlib/Primitives/Frame")
local vide = require("./vide-0.4.1/vide")
end
require = oldReq

