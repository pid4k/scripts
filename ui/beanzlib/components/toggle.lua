const vide = require("../../vide")
const frame = require("../primitives/frame")
const textlabel = require("../primitives/textlabel")
const textbutton = require("../primitives/textbutton")
const uipadding = require("../primitives/uipadding")
const uistroke = require("../primitives/uistroke")
const BaseElement = require("./base")

return function(parent: Instance, options, window: any?)
	options = options or {}

	const isToggledSource = vide.source(options.Toggled == true)
	local isLocked = false

	const buttonSize = (options.Mini and UDim2.new(0.9, 0, 0.04, 0))
		or (options.Small and UDim2.new(0.9, 0, 0.05, 0))
		or UDim2.new(0.9, 0, 0.06, 0)

	local Toggle = BaseElement.new(options, "Toggle")
	Toggle.Locked = false
	Toggle.Callback = options.Callback
	Toggle.Window = window
	local theme = window.Theme

	function Toggle:SetCallback(fnc: (boolean) -> ())
		Toggle.Callback = fnc
	end

	function Toggle:IsToggled(): boolean
		return isToggledSource()
	end

	function Toggle:GetValue(): boolean
		return self:IsToggled()
	end

	function Toggle:SetValue(v: boolean)
		self:Toggle(v)
	end

	function Toggle:Toggle(v: boolean?)
		if isLocked then return end
		local newState: boolean
		if v ~= nil then
			newState = v
		else
			newState = not isToggledSource()
		end
		isToggledSource(newState)
		if Toggle.Callback then
			Toggle.Callback(newState)
		end
	end

	function Toggle:Lock()
		isLocked = true
		Toggle.Locked = true
	end

	function Toggle:Unlock()
		isLocked = false
		Toggle.Locked = false
	end

	function Toggle:IsLocked(): boolean
		return isLocked
	end

	const btnInstance = textbutton {
		Parent = parent,
		Name = "Toggle",
		Text = "",
		BorderSizePixel = 0,
		BackgroundColor3 = function()
			return options.Color or theme().ElementBackground
		end,
		Size = buttonSize,
		Position = UDim2.new(0, 0, 0.0101, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		MouseButton1Click = function()
			Toggle:Toggle()
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
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(1, 0, 0.7, 0),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Text = options.Text or "Toggle",
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
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			},

			frame {
				Name = "Bool",
				BorderSizePixel = 0,
				BackgroundColor3 = function()
					return options.IndicatorColor or theme().AccentColor
				end,
				Size = UDim2.new(0.05914, 0, 0.61915, 0),
				Position = UDim2.new(0.88391, 0, 0.18468, 0),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = function()
					return if isToggledSource() then 0 else 1
				end,
				Children = {
					vide.create "UICorner" {
						CornerRadius = UDim.new(0.2, 0),
					},
					vide.create "UIStroke" {
						Color = Color3.fromRGB(255, 255, 255),
					},
					vide.create "UIAspectRatioConstraint" {},
				},
			},
		},
	}

	Toggle.Instance = btnInstance
	return Toggle
end
