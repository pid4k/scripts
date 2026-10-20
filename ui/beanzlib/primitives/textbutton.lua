const Vide = require("../../vide-0.4.1/vide")
const defaultTheme = require("../../utils/themes/default")
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
		FontFace = bold and defaultTheme.BoldFont or defaultTheme.MainFont,
		Size = props.Size,
		props,
		children
	}
end