const UIStroke = require("./UIStroke")
local TextButton = require("./TextButton")
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