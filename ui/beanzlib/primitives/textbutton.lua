const Vide = require("../../vide-0.4.1/vide")
const Styles = require("../../utils/styles")
local create = Vide.create
return function(props : TextButton & {Bold : boolean})
	const bold = props.Bold
	props.Bold = nil
	const children = props.children
	props.children = nil
	return create "TextButton" {
		TextScaled = true,
		RichText = true,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		FontFace = function()
			local theme = Styles.SelectedTheme()
			return bold and theme.BoldFont or theme.MainFont
		end,
		Size = props.Size,
		props,
		children
	}
end