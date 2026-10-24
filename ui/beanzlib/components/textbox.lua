const vide = require("../../vide")
const frame = require("../primitives/frame")
const textlabel = require("../primitives/textlabel")
const textbox = require("../primitives/textbox")
const uipadding = require("../primitives/uipadding")
const uistroke = require("../primitives/uistroke")
const BaseElement = require("./base")

return function(parent: Instance, options, window)
	options = options or {}
	local theme = window.Theme

	const textContentSource = vide.source(options.DefaultText or "")
	const visibleSource = vide.source(true)
	local callback = options.Callback

	local TextBoxObj = BaseElement.new(options, "TextBox")
	TextBoxObj.Callback = callback
	TextBoxObj.Window = window

	function TextBoxObj:ToggleVisible(b: boolean?)
		if b == true then
			visibleSource(true)
		elseif b == false then
			visibleSource(false)
		else
			visibleSource(not visibleSource())
		end
	end

	function TextBoxObj:GetText(): string
		return textContentSource()
	end

	function TextBoxObj:SetText(text: string)
		textContentSource(text)
	end

	function TextBoxObj:GetValue(): string
		return self:GetText()
	end

	function TextBoxObj:SetValue(v: string)
		self:SetText(tostring(v))
		if self.Callback then
			self.Callback(tostring(v))
		end
	end

	function TextBoxObj:SetCallback(fnc: (string) -> ())
		callback = fnc
		TextBoxObj.Callback = fnc
	end

	const container = frame {
		Parent = parent,
		Name = "TextBox",
		BorderSizePixel = 0,
		BackgroundColor3 = function()
			return options.Color or theme().ElementBackground
		end,
		Size = UDim2.new(0.9, 0, 0.06377, 0),
		Position = UDim2.new(0, 0, 0.51186, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Visible = function()
			return visibleSource()
		end,
		Children = {
			vide.create "UICorner" {},

			textlabel {
				Name = "Title",
				TextWrapped = true,
				BorderSizePixel = 0,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextScaled = true,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextColor3 = function()
					return theme().TextPrimaryColor
				end,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0.5, 0),
				Position = UDim2.new(0, 0, 0.26446, 0),
				Text = options.Text or "Textbox",
				Children = {
					uipadding {
						PaddingLeft = UDim.new(0.05, 0),
					},
				},
			},

			uistroke {
				Color = function()
					return theme().ElementStroke
				end,
			},

			textbox {
				Name = "Input",
				TextColor3 = function()
					return theme().TextPrimaryColor
				end,
				BorderSizePixel = 0,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextWrapped = true,
				TextScaled = true,
				PlaceholderText = options.PlaceholderText or "Placeholder",
				PlaceholderColor3 = function()
					return theme().TextSecondaryColor or Color3.fromRGB(113, 113, 113)
				end,
				ClearTextOnFocus = false,
				BackgroundColor3 = function()
					return theme().DropdownItem or Color3.fromRGB(185, 185, 185)
				end,
				Size = UDim2.new(0.52197, 0, 0.71728, 0),
				Position = UDim2.new(0.45527, 0, 0.13354, 0),
				Text = function()
					return textContentSource()
				end,
				FocusLost = function(enterPressed)
					if TextBoxObj.Callback then
						TextBoxObj.Callback(textContentSource(), enterPressed)
					elseif callback then
						callback(textContentSource(), enterPressed)
					end
				end,
				Children = {
					uistroke {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						Color = Color3.fromRGB(255, 255, 255),
					},
					vide.create "UICorner" {},
					uipadding {
						PaddingLeft = UDim.new(0.05, 0),
					},
				},
			},
		},
	}

	const inputEl = container:FindFirstChild("Input") :: TextBox?
	if inputEl then
		inputEl:GetPropertyChangedSignal("Text"):Connect(function()
			textContentSource(inputEl.Text)
		end)
	end

	TextBoxObj.Instance = container
	return TextBoxObj
end
