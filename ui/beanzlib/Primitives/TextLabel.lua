const Vide = require("../../vide-0.4.1/vide")
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
		BackgroundColor3 = function()
			return Styles.SelectedTheme().FrameBG
		end,
		RichText = true,
		Text = "Hello World!",
		FontFace = function()
			local theme = Styles.SelectedTheme()
			return bold and theme.BoldFont or theme.MainFont
		end,
		-------------
		props,
		children,
	}
end