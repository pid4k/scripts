const Vide = require("../../vide-0.4.1/vide")
local Fonts = require("../../Utils/Fonts")
local Styles = require("../../Utils/Styles")
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
		BackgroundColor3 = Styles.Colors.accent1,
		RichText = true,
		Text = "Hello World!",
		FontFace = props.FontFace or bold and Fonts.BoldFont or Fonts.MainFont,
		-------------
		props,
		children,
	}
end