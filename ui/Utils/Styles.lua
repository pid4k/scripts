const Vide = require("../vide-0.4.1/vide")
const Fonts = require("../Utils/Fonts")
local m = {
    Themes = {
        Normal = {
            FrameBG = Color3.fromRGB(255,255,255),
            BoldFont = Fonts.GothamBold,
            MainFont = Fonts.Gotham
        }
    }
}
m.SelectedTheme = Vide.context(m.Themes.Normal)
return m