const defaultTheme = require("./default")
const darkTheme = require("./dark")
const midnightTheme = require("./midnight")
const draculaTheme = require("./dracula")
const nordTheme = require("./nord")
const catppuccinTheme = require("./catppuccin")
const emeraldTheme = require("./emerald")
const roseTheme = require("./rose")
const lightTheme = require("./light")

export type Theme = {
	Name: string,
	WindowBackground: Color3,
	FrameBackground: Color3,
	TopBarBackground: Color3,
	SidebarBackground: Color3,
	ElementBackground: Color3,
	ElementHoverBackground: Color3,
	ElementStroke: Color3,
	DropdownItem: Color3,
	DropdownItemHover: Color3,
	AccentColor: Color3,
	LineColor: Color3,
	SeparatorColor: Color3,
	TextPrimaryColor: Color3,
	TextSecondaryColor: Color3,
	TabButtonActive: Color3,
	TabButtonInactive: Color3,
	TabButtonBackground: Color3,
	BoldFont: Font,
	MainFont: Font,
}

local Themes = {
	Default = defaultTheme,
	Dark = darkTheme,
	Midnight = midnightTheme,
	Dracula = draculaTheme,
	Nord = nordTheme,
	Catppuccin = catppuccinTheme,
	Emerald = emeraldTheme,
	Rose = roseTheme,
	Light = lightTheme,
}

function Themes.Get(themeOrName: (string | { [string]: any })?): Theme
	if typeof(themeOrName) == "string" then
		local lower = string.lower(themeOrName)
		for name, theme in Themes do
			if typeof(theme) == "table" and string.lower(name) == lower then
				return theme
			end
		end
		return defaultTheme
	elseif typeof(themeOrName) == "table" then
		local merged = table.clone(defaultTheme)
		for k, v in themeOrName do
			merged[k] = v
		end
		return merged
	end
	return defaultTheme
end

return Themes
