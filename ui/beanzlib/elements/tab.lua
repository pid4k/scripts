const vide = require("../../vide-0.4.1/vide")
const Tab = {}
Tab.__index = Tab
function Tab.new(window,props)
    const self = setmetatable({
        window = window,
        name = props.name,
    },Tab)
    return self
end

function Tab:Destroy()
    self.main:Destroy()
end

return Tab