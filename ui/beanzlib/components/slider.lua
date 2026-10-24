const vide = require("../../vide")
const frame = require("../primitives/frame")
const textlabel = require("../primitives/textlabel")
const textbutton = require("../primitives/textbutton")
const textbox = require("../primitives/textbox")
const uipadding = require("../primitives/uipadding")
const uistroke = require("../primitives/uistroke")
const BaseElement = require("./base")

const UserInputService = game:GetService("UserInputService")
const Players = game:GetService("Players")

return function(parent: Instance, options, window: any?)
	options = options or {}

	const minVal = options.Min or 0
	const maxVal = options.Max or 100
	const range = math.max(maxVal - minVal, 1e-4)
	local decimalsPower = 10 ^ (options.Decimals or 0)

	const valueSource = vide.source(options.Default or minVal)
	const percentageSource = vide.source(math.clamp(((options.Default or minVal) - minVal) / range, 0, 1))
	const numberTextSource = vide.source(tostring(valueSource()))

	local sliderBackgroundInstance: GuiObject? = nil
	local isHeld = false

	local Slider = BaseElement.new(options, "Slider")
	Slider.Decimals = decimalsPower
	Slider.Callback = options.Callback
	Slider.Window = window
	local theme = window.Theme

	function Slider:SetValue(v: number?, doCallback: boolean?)
		local pct: number
		local val: number
		if v == nil then
			if not sliderBackgroundInstance then return end
			local mouse = Players.LocalPlayer and Players.LocalPlayer:GetMouse()
			local mouseX = (mouse and mouse.X) or UserInputService:GetMouseLocation().X
			pct = math.clamp((mouseX - sliderBackgroundInstance.AbsolutePosition.X) / sliderBackgroundInstance.AbsoluteSize.X, 0, 1)
			val = math.floor((((maxVal - minVal) * pct) + minVal) * Slider.Decimals) / Slider.Decimals
		else
			val = math.clamp(v, minVal, maxVal)
			pct = math.clamp((val - minVal) / range, 0, 1)
		end

		val = math.clamp(val, minVal, maxVal)
		pct = math.clamp(pct, 0, 1)

		valueSource(val)
		percentageSource(pct)
		numberTextSource(tostring(val))

		if v ~= nil and doCallback ~= false and Slider.Callback then
			Slider.Callback(val)
		end
	end

	function Slider:GetValue(): number
		return tonumber(valueSource()) or minVal
	end

	function Slider:SetCallback(fnc: (number) -> (), decimals: number?)
		Slider.Callback = fnc
		options.Callback = fnc
		if decimals then
			Slider.Decimals = 10 ^ decimals
		end
	end

	const sliderFrame = frame {
		Parent = parent,
		Name = options.Name or options.Text or "Slider",
		BorderSizePixel = 0,
		BackgroundColor3 = function()
			return options.Color or theme().ElementBackground
		end,
		Size = UDim2.new(0.9, 0, 0.08, 0),
		Position = UDim2.new(0, 0, 0.41186, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
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
				Size = UDim2.new(1, 0, 0.45282, 0),
				Position = UDim2.new(0, 0, 0.15, 0),
				Text = options.Text or "Slider",
				Children = {
					uipadding {
						PaddingLeft = UDim.new(0.05, 0),
					},
				},
			},

			textbox {
				Name = "Number",
				TextWrapped = true,
				BorderSizePixel = 0,
				TextScaled = true,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextColor3 = function()
					return theme().TextPrimaryColor
				end,
				BackgroundTransparency = 1,
				Size = UDim2.new(0.12762, 0, 0.48197, 0),
				Position = UDim2.new(0.85101, 0, 0.12085, 0),
				Text = function()
					return numberTextSource()
				end,
				FocusLost = function()
					local textVal = tonumber(numberTextSource()) or 0
					Slider:SetValue(textVal)
					if Slider.Callback then
						Slider.Callback(Slider:GetValue())
					end
				end,
			},

			textbutton {
				Name = "SliderBackground",
				AutoButtonColor = false,
				Text = "",
				BorderSizePixel = 0,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				Size = UDim2.new(0.92981, 0, 0.2, 0),
				Position = UDim2.new(0.03509, 0, 0.7, 0),
				BackgroundTransparency = 1,
				MouseButton1Down = function()
					isHeld = true
					Slider:SetValue()
				end,
				MouseButton1Up = function()
					if isHeld then
						isHeld = false
						if Slider.Callback then
							Slider.Callback(Slider:GetValue())
						end
					end
				end,
				Children = {
					vide.create "UICorner" {
						CornerRadius = UDim.new(1, 0),
					},
					uistroke {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						Color = function()
							return theme().ElementStroke
						end,
					},
					frame {
						Name = "Bar",
						BorderSizePixel = 0,
						BackgroundColor3 = function()
							return options.FillColor or theme().AccentColor
						end,
						Size = function()
							return UDim2.new(percentageSource(), 0, 1, 0)
						end,
						Children = {
							vide.create "UICorner" {
								CornerRadius = UDim.new(1, 0),
							},
						},
					},
				},
			},

			uistroke {
				Color = function()
					return theme().ElementStroke
				end,
			},
		},
	}

	sliderBackgroundInstance = sliderFrame:FindFirstChild("SliderBackground") :: GuiObject

	sliderFrame.MouseMoved:Connect(function()
		if not isHeld then return end
		Slider:SetValue()
	end)

	sliderFrame.MouseLeave:Connect(function()
		if isHeld then
			isHeld = false
			if Slider.Callback then
				Slider.Callback(Slider:GetValue())
			end
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			if isHeld then
				isHeld = false
				if Slider.Callback then
					Slider.Callback(Slider:GetValue())
				end
			end
		end
	end)

	Slider.Instance = sliderFrame
	Slider:SetValue(options.Default or minVal)
	return Slider
end
