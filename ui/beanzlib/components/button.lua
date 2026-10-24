const vide = require("../../vide")
const frame = require("../primitives/frame")
const textlabel = require("../primitives/textlabel")
const textbutton = require("../primitives/textbutton")
const imagelabel = require("../primitives/imagelabel")
const uipadding = require("../primitives/uipadding")
const uistroke = require("../primitives/uistroke")
const BaseElement = require("./base")

return function(parent: Instance, options, window)
	options = options or {}
	local theme = window.Theme

	const textSource = vide.source(options.Text or "Button")
	const visibleSource = vide.source(true)
	const isToggledSource = vide.source(false)
	const isHoverSource = vide.source(false)

	const buttonSize = (options.Mini and UDim2.new(0.9, 0, 0.04, 0))
		or (options.Small and UDim2.new(0.9, 0, 0.05, 0))
		or UDim2.new(0.9, 0, 0.06, 0)

	const btnInstance = textbutton {
		Parent = parent,
		Name = options.Name or "Button",
		Text = "",
		BorderSizePixel = 0,
		BackgroundColor3 = function()
			if options.Color then
				return options.Color
			end
			if isHoverSource() then
				return theme().ElementHoverBackground or theme().ElementBackground
			end
			return theme().ElementBackground
		end,
		Size = buttonSize,
		Position = UDim2.new(0, 0, 0.0101, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Visible = function()
			return visibleSource()
		end,
		MouseEnter = function()
			isHoverSource(true)
		end,
		MouseLeave = function()
			isHoverSource(false)
		end,
		MouseButton1Click = function()
			if options.Callback then
				options.Callback()
			end
		end,
		Children = {
			vide.create "UICorner" {},

			textlabel {
				Name = "Title",
				Text = function()
					return textSource()
				end,
				TextWrapped = true,
				BorderSizePixel = 0,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextScaled = true,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextColor3 = function()
					return theme().TextPrimaryColor
				end,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0.7, 0),
				Position = UDim2.new(0, 0, 0.15, 0),
				Children = {
					uipadding {
						PaddingLeft = UDim.new(0.05, 0),
						PaddingRight = UDim.new(0.1, 0),
					},
				},
			},

			imagelabel {
				Name = "Icon",
				Image = "rbxassetid://91052455220714",
				ImageColor3 = function()
					return theme().TextSecondaryColor or theme().TextPrimaryColor
				end,
				ScaleType = Enum.ScaleType.Fit,
				Size = UDim2.new(0.07635, 0, 0.71069, 0),
				Position = UDim2.new(0.87516, 0, 0.13931, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
			},

			uistroke {
				Color = function()
					if isToggledSource() then
						return Color3.fromRGB(0, 170, 0)
					end
					return theme().ElementStroke
				end,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			},
		},
	}

	local Button = BaseElement.new(options, "Button")
	Button.Save = if options.Save ~= nil then options.Save == true else false
	Button.Instance = btnInstance
	Button.Window = window
	Button.Enabled = false

	function Button:SetText(text: string)
		textSource(text)
	end

	function Button:IsToggled(): boolean
		return isToggledSource()
	end

	function Button:Toggle(v: boolean?)
		local newState: boolean
		if v == nil then
			newState = not isToggledSource()
		else
			newState = v == true
		end
		isToggledSource(newState)
		Button.Enabled = newState
	end

	function Button:ToggleVisible(b: boolean?)
		if b == true then
			visibleSource(true)
		elseif b == false then
			visibleSource(false)
		else
			visibleSource(not visibleSource())
		end
	end

	function Button:SetCallback(fnc: () -> ())
		options.Callback = fnc
	end

	return Button
end
