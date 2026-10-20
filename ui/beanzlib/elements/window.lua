const vide = require("../../vide-0.4.1/vide")
const tab = require("./tab")
const Window = {}
Window.__index = Window
function Window.new(lib,props)
    const self = setmetatable({
        tabs = {}
    },Window)
    self.main = vide.create "ScreenGui"{
        vide.create
    }
    self.destroyRoot = vide.mount(function()
        return self.main
    end,game:GetService("CoreGui"))
    return self
end

function Window:CreateTab(props)
    const newTab = tab.new(self,props)
    table.insert(self.tabs,newTab)
    return newTab
end

function Window:Destroy()
    self.main:Destroy()
    self.destroyRoot()
end

return Window