const Vide = require("../../vide-0.4.1/vide")
const defaultTheme = require("../../utils/themes/default")
const create = Vide.create
return function(props : TextLabel & {
	Bold : boolean
	})
	const bold = props.Bold
	props.Bold = nil
	const children = props.children
	props.children = nil
	return create "TextLabel" {
		-- DEFAULTS --
		TextScaled = true,
		TextColor3 = Color3.fromRGB(255,255,255),
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		RichText = true,
		Text = "Hello World!",
		FontFace = bold and defaultTheme.BoldFont or defaultTheme.MainFont,

		-------------
		props,
		children,
	}
end