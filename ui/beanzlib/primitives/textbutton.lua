const Vide = require("../../vide")
const defaultTheme = require("../../utils/themes/default")
const create = Vide.create

return function(props: TextButton & { Bold: boolean?, Children: {any}? })
	const bold = props.Bold
	props.Bold = nil
	const children = props.Children
	props.Children = nil
	return create "TextButton" {
		TextScaled = true,
		RichText = true,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		FontFace = bold and defaultTheme.BoldFont or defaultTheme.MainFont,
		Size = props.Size,
		props,
		children,
	}
end