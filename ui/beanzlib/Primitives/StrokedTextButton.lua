const UIStroke = require("./UIStroke")
const Vide = require("../../vide-0.4.1/vide")
local Fonts = require("../../Utils/Fonts")
local Styles = require("../../Utils/Styles")
local TextButton = require("./TextButton")
const create = Vide.create
return function(props : TextLabel & {
	Bold : boolean
	})
	const bold = props.Bold
	props.Bold = nil
	const children = props.children
	props.children = nil
	return TextButton {
		Bold = true,
		props,
		children,
		UIStroke {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		}
			
		
	}
end