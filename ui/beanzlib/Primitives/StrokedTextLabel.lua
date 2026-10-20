const UIStroke = require("./UIStroke")
const Vide = require("../../vide-0.4.1/vide")
local TextLabel = require("./TextLabel")
return function(props : TextLabel & {
	Bold : boolean
	})
	const bold = props.Bold
	props.Bold = nil
	const children = props.children
	props.children = nil
	return TextLabel {
		BackgroundTransparency = 1,
		Bold = bold == nil or bold == true,
		props,
		children,
		UIStroke {
		},
		--[[
		create "UIShadow" {
			ApplyShadowMode = Enum.ApplyShadowMode.Text
		}
		--]]
		
	}
end