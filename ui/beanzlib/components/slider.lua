const vide = require("../../vide")
const scope = require("../scope")
const frame = require("../primitives/frame")
const textbutton = require("../primitives/textbutton")
const textlabel = require("../primitives/textlabel")
const textbox = require("../primitives/textbox")
const uistroke = require("../primitives/uistroke")
const BaseElement = require("./base")

local function formatNumber(value: number, decimals: number): string
	if decimals <= 0 then
		return tostring(math.round(value))
	end
	return string.format("%." .. tostring(decimals) .. "f", value)
end

return function(parent, options, window)
	options = options or {}

	const minValue = vide.source(options.Min or 0)
	const maxValue = vide.source(options.Max or 100)
	if maxValue() <= minValue() then
		error("Slider Max must be greater than Min")
	end

	const decimals = vide.source(math.max(0, math.floor(options.Decimals or 0)))
	const value = vide.source(math.clamp(options.Default or minValue(), minValue(), maxValue()))

	const Slider = BaseElement.new(options, "Slider")
	Slider.Callback = options.Callback
	Slider.Decimals = decimals()
	Slider.Min = minValue()
	Slider.Max = maxValue()
	Slider.Window = window

	local dragging = false

	const destroyScope, ui = scope(function()
		const row = frame {
			Parent = parent,
			Name = Slider.Name,
			Size = UDim2.new(1, 0, 0, 54),
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
			Text = options.Text or options.Name or "Slider",
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
			Size = UDim2.new(1, -80, 0, 22),
			Position = UDim2.fromOffset(12, 6),
			ZIndex = 2,
		}

		const number = textbox {
			Parent = row,
			Name = "Number",
			Size = UDim2.fromOffset(58, 22),
			Position = UDim2.new(1, -70, 0, 6),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = function()
				return formatNumber(value(), decimals())
			end,
			TextSize = 13,
			TextScaled = false,
			FontFace = function()
				return window:GetTheme().MainFont
			end,
			TextColor3 = function()
				return window:GetTheme().TextPrimaryColor
			end,
			TextXAlignment = Enum.TextXAlignment.Right,
			ClearTextOnFocus = false,
			ZIndex = 2,
		}

		const track = textbutton {
			Parent = row,
			AutoButtonColor = false,
			Name = "Track",
			Size = UDim2.new(1, -24, 0, 6),
			Position = UDim2.fromOffset(12, 38),
			BackgroundColor3 = function()
				return window:GetTheme().DropdownItem
			end,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Text = "",
			TextScaled = false,
			ClipsDescendants = false,
			ZIndex = 2,
		}

		vide.create "UICorner" {
			Parent = track,
			CornerRadius = UDim.new(1, 0),
		}
		uistroke {
			Parent = track,
			Color = function()
				return window:GetTheme().ElementStroke
			end,
			Thickness = 1,
			StrokeSizingMode = Enum.StrokeSizingMode.FixedSize,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		}

		const fill = frame {
			Parent = track,
			Name = "Fill",
			Size = function()
				const percentage = math.clamp(
					(value() - minValue()) / (maxValue() - minValue()),
					0,
					1
				)
				return UDim2.new(percentage, 0, 1, 0)
			end,
			BackgroundColor3 = function()
				return options.FillColor or window:GetTheme().AccentColor
			end,
			BorderSizePixel = 0,
			ZIndex = 2,
		}

		vide.create "UICorner" {
			Parent = fill,
			CornerRadius = UDim.new(1, 0),
		}

		const knob = frame {
			Parent = track,
			Name = "Knob",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = function()
				const percentage = math.clamp(
					(value() - minValue()) / (maxValue() - minValue()),
					0,
					1
				)
				return UDim2.new(percentage, 0, 0.5, 0)
			end,
			Size = UDim2.fromOffset(14, 14),
			BackgroundColor3 = function()
				return window:GetTheme().TextPrimaryColor
			end,
			BorderSizePixel = 0,
			ZIndex = 3,
		}

		vide.create "UICorner" {
			Parent = knob,
			CornerRadius = UDim.new(1, 0),
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
			Number = number,
			Track = track,
		}
	end)

	function Slider:SetValue(newValue: number, fireCallback: boolean?)
		if typeof(newValue) ~= "number" then
			error("Slider value must be a number")
		end

		const multiplier = 10 ^ decimals()
		const rounded = math.round(newValue * multiplier) / multiplier
		value(math.clamp(rounded, minValue(), maxValue()))

		if fireCallback == true and Slider.Callback then
			Slider.Callback(value())
		end
	end

	function Slider:GetValue(): number
		return value()
	end

	function Slider:GetMin(): number
		return minValue()
	end

	function Slider:GetMax(): number
		return maxValue()
	end

	function Slider:SetRange(newMin: number, newMax: number)
		if newMax <= newMin then
			error("Slider Max must be greater than Min")
		end
		minValue(newMin)
		maxValue(newMax)
		Slider.Min = newMin
		Slider.Max = newMax
		Slider:SetValue(value(), false)
	end

	function Slider:SetCallback(callback)
		Slider.Callback = callback
	end

	function Slider:SetDecimals(newDecimals: number)
		const resolved = math.max(0, math.floor(newDecimals))
		decimals(resolved)
		Slider.Decimals = resolved
		Slider:SetValue(value(), false)
	end

	local function setFromPointer(x: number)
		const percentage = math.clamp(
			(x - ui.Track.AbsolutePosition.X) / ui.Track.AbsoluteSize.X,
			0,
			1
		)
		Slider:SetValue(minValue() + (maxValue() - minValue()) * percentage, true)
	end

	Slider:AddConnection(ui.Track.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1
			and input.UserInputType ~= Enum.UserInputType.Touch
		then
			return
		end
		dragging = true
		setFromPointer(input.Position.X)
	end))
	Slider:AddConnection(game:GetService("UserInputService").InputChanged:Connect(function(input)
		if not dragging then
			return
		end
		if input.UserInputType ~= Enum.UserInputType.MouseMovement
			and input.UserInputType ~= Enum.UserInputType.Touch
		then
			return
		end
		setFromPointer(input.Position.X)
	end))
	Slider:AddConnection(game:GetService("UserInputService").InputEnded:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1
			and input.UserInputType ~= Enum.UserInputType.Touch
		then
			return
		end
		dragging = false
	end))
	Slider:AddConnection(ui.Number.FocusLost:Connect(function()
		const parsed = tonumber(ui.Number.Text)
		if parsed then
			Slider:SetValue(parsed, true)
		else
			ui.Number.Text = formatNumber(value(), decimals())
		end
	end))
	Slider:AddCleanup(destroyScope)
	Slider:AddCleanup(function()
		dragging = false
	end)

	Slider.Label = ui.Title
	Slider.Instance = ui.Row
	return Slider
end
