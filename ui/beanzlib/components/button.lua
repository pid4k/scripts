const vide = require("../../vide")
const scope = require("../scope")
const textbutton = require("../primitives/textbutton")
const textlabel = require("../primitives/textlabel")
const uistroke = require("../primitives/uistroke")
const BaseElement = require("./base")

const ROW_HEIGHT = 40

return function(parent, options, window)
	options = options or {}

	const Button = BaseElement.new(options, "Button")
	Button.Callback = options.Callback
	Button.Window = window

	const hovered = vide.source(false)
	const active = vide.source(options.Active == true)

	const destroyScope, ui = scope(function()
		const height = options.Height or ROW_HEIGHT

		const row = textbutton {
			Parent = parent,
			AutoButtonColor = false,
			Name = Button.Name,
			Size = UDim2.new(1, 0, 0, height),
			BackgroundColor3 = function()
				if options.Color then
					return options.Color
				end
				const theme = window:GetTheme()
				return if hovered()
					then (theme.ElementHoverBackground or theme.ElementBackground)
					else theme.ElementBackground
			end,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Text = "",
			TextScaled = false,
			ClipsDescendants = true,
			ZIndex = 1,
		}

		vide.create "UICorner" {
			Parent = row,
			CornerRadius = UDim.new(0, 6),
		}

		const title = textlabel {
			Parent = row,
			BackgroundTransparency = 1,
			Name = "Title",
			Text = options.Text or options.Name or "Button",
			TextSize = 14,
			TextScaled = false,
			FontFace = function()
				return window:GetTheme().MainFont
			end,
			TextColor3 = function()
				return window:GetTheme().TextPrimaryColor
			end,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			Size = UDim2.new(1, -44, 1, 0),
			Position = UDim2.fromOffset(12, 0),
			ZIndex = 2,
		}

		textlabel {
			Parent = row,
			BackgroundTransparency = 1,
			Name = "Icon",
			Text = ">",
			TextSize = 14,
			TextScaled = false,
			FontFace = function()
				return window:GetTheme().MainFont
			end,
			TextColor3 = function()
				const theme = window:GetTheme()
				return theme.TextSecondaryColor or theme.TextPrimaryColor
			end,
			TextXAlignment = Enum.TextXAlignment.Center,
			Size = UDim2.fromOffset(24, height),
			Position = UDim2.new(1, -32, 0, 0),
			ZIndex = 2,
		}

		const stroke = uistroke {
			Parent = row,
			Color = function()
				const theme = window:GetTheme()
				return if active() then theme.AccentColor else theme.ElementStroke
			end,
			Thickness = 1,
			StrokeSizingMode = Enum.StrokeSizingMode.FixedSize,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		}

		return {
			Row = row,
			Title = title,
			Stroke = stroke,
		}
	end)

	function Button:SetCallback(callback)
		Button.Callback = callback
	end

	function Button:IsActive(): boolean
		return active()
	end

	function Button:SetActive(value: boolean)
		active(value == true)
	end

	function Button:Toggle()
		Button:SetActive(not active())
	end

	Button:AddConnection(ui.Row.MouseEnter:Connect(function()
		hovered(true)
	end))
	Button:AddConnection(ui.Row.MouseLeave:Connect(function()
		hovered(false)
	end))
	Button:AddConnection(ui.Row.MouseButton1Click:Connect(function()
		if Button.Callback then
			Button.Callback()
		end
	end))
	Button:AddCleanup(destroyScope)

	Button.Label = ui.Title
	Button.Instance = ui.Row
	return Button
end
