const vide = require("../../vide")
const scope = require("../scope")
const frame = require("../primitives/frame")
const textlabel = require("../primitives/textlabel")
const textbox = require("../primitives/textbox")
const uipadding = require("../primitives/uipadding")
const uistroke = require("../primitives/uistroke")
const BaseElement = require("./base")

const ROW_HEIGHT = 40

return function(parent, options, window)
	options = options or {}

	const TextBoxElement = BaseElement.new(options, "TextBox")
	TextBoxElement.Callback = options.Callback
	TextBoxElement.Window = window

	const placeholder = options.Placeholder or "Enter text..."
	local initial = ""
	if options.Default ~= nil then
		initial = tostring(options.Default)
	end

	const destroyScope, ui = scope(function()
		const row = frame {
			Parent = parent,
			Name = TextBoxElement.Name,
			Size = UDim2.new(1, 0, 0, ROW_HEIGHT),
			BackgroundColor3 = function()
				return options.Color or window:GetTheme().ElementBackground
			end,
			BorderSizePixel = 0,
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
			Text = options.Text or options.Name or "Textbox",
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
			Size = UDim2.new(0.38, -12, 1, 0),
			Position = UDim2.fromOffset(12, 0),
			ZIndex = 2,
		}

		const input = textbox {
			Parent = row,
			Name = "Input",
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0.4, 0, 0.5, 0),
			Size = UDim2.new(0.6, -24, 0, 28),
			BackgroundColor3 = function()
				return window:GetTheme().DropdownItem
			end,
			BorderSizePixel = 0,
			Text = tostring(initial),
			PlaceholderText = placeholder,
			PlaceholderColor3 = function()
				const theme = window:GetTheme()
				return theme.TextSecondaryColor or theme.TextPrimaryColor
			end,
			TextSize = 13,
			TextScaled = false,
			FontFace = function()
				return window:GetTheme().MainFont
			end,
			TextColor3 = function()
				return window:GetTheme().TextPrimaryColor
			end,
			TextXAlignment = Enum.TextXAlignment.Left,
			ClearTextOnFocus = false,
			ZIndex = 2,
		}

		vide.create "UICorner" {
			Parent = input,
			CornerRadius = UDim.new(0, 5),
		}
		uipadding {
			Parent = input,
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8),
		}
		uistroke {
			Parent = input,
			Color = function()
				return window:GetTheme().ElementStroke
			end,
			Thickness = 1,
			StrokeSizingMode = Enum.StrokeSizingMode.FixedSize,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		}
		uistroke {
			Parent = row,
			Color = function()
				return window:GetTheme().ElementStroke
			end,
			Thickness = 1,
			StrokeSizingMode = Enum.StrokeSizingMode.FixedSize,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		}

		return {
			Row = row,
			Title = title,
			Input = input,
		}
	end)

	function TextBoxElement:GetValue(): string
		return ui.Input.Text
	end

	function TextBoxElement:SetValue(value: string)
		ui.Input.Text = tostring(value)
	end

	function TextBoxElement:SetPlaceholder(value: string)
		ui.Input.PlaceholderText = value
	end

	function TextBoxElement:SetCallback(callback)
		TextBoxElement.Callback = callback
	end

	TextBoxElement:AddConnection(ui.Input.FocusLost:Connect(function(enterPressed)
		if TextBoxElement.Callback then
			TextBoxElement.Callback(ui.Input.Text, enterPressed)
		end
	end))
	TextBoxElement:AddCleanup(destroyScope)

	TextBoxElement.Input = ui.Input
	TextBoxElement.Label = ui.Title
	TextBoxElement.Instance = ui.Row
	return TextBoxElement
end
