const vide = require("../../vide")
const Animation = require("../animation")
const scope = require("../scope")
const frame = require("../primitives/frame")
const textbutton = require("../primitives/textbutton")
const textlabel = require("../primitives/textlabel")
const uistroke = require("../primitives/uistroke")
const BaseElement = require("./base")

const ROW_HEIGHT = 40
const ON_POSITION = UDim2.fromOffset(18, 2)
const OFF_POSITION = UDim2.fromOffset(2, 2)

return function(parent, options, window)
	options = options or {}

	const Toggle = BaseElement.new(options, "Toggle")
	Toggle.Callback = options.Callback
	Toggle.Locked = options.Locked == true
	Toggle.Window = window

	const state = vide.source(options.Default == true)
	const hovered = vide.source(false)
	local locked = Toggle.Locked

	const destroyScope, ui = scope(function()
		const row = textbutton {
			Parent = parent,
			AutoButtonColor = false,
			Name = Toggle.Name,
			Size = UDim2.new(1, 0, 0, ROW_HEIGHT),
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
			Text = options.Text or options.Name or "Toggle",
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
			Size = UDim2.new(1, -70, 1, 0),
			Position = UDim2.fromOffset(12, 0),
			ZIndex = 2,
		}

		const track = frame {
			Parent = row,
			Name = "Track",
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(1, -48, 0.5, 0),
			Size = UDim2.fromOffset(36, 20),
			BackgroundColor3 = function()
				const theme = window:GetTheme()
				return if state()
					then (options.IndicatorColor or theme.AccentColor)
					else theme.DropdownItem
			end,
			BorderSizePixel = 0,
			ZIndex = 2,
		}

		vide.create "UICorner" {
			Parent = track,
			CornerRadius = UDim.new(1, 0),
		}

		uistroke {
			Parent = track,
			Color = function()
				const theme = window:GetTheme()
				return if state() then theme.AccentColor else theme.ElementStroke
			end,
			Thickness = 1,
			StrokeSizingMode = Enum.StrokeSizingMode.FixedSize,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		}

		const knob = frame {
			Parent = track,
			Name = "Knob",
			Position = if state() then ON_POSITION else OFF_POSITION,
			Size = UDim2.fromOffset(16, 16),
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
			Knob = knob,
		}
	end)

	const knobSpring = Animation.createSpring(ui.Knob.Position, Animation.config.figmaQuick)
	const knobDisconnect = knobSpring:onChange(function(position)
		ui.Knob.Position = position
	end)
	knobSpring:start()

	local function updateKnob(animate: boolean)
		const goal = if state() then ON_POSITION else OFF_POSITION
		if animate then
			knobSpring:setGoal(goal)
		else
			knobSpring:stop()
			knobSpring:setPosition(goal)
			knobSpring:start()
		end
	end

	function Toggle:GetValue(): boolean
		return state()
	end

	function Toggle:SetValue(value: boolean, fireCallback: boolean?)
		Toggle:Toggle(value, fireCallback == true)
	end

	function Toggle:SetCallback(callback)
		Toggle.Callback = callback
	end

	function Toggle:Toggle(value: boolean?, fireCallback: boolean?)
		if locked then
			return
		end

		const newValue = if value ~= nil then value == true else not state()
		state(newValue)
		updateKnob(true)

		if fireCallback ~= false and Toggle.Callback then
			Toggle.Callback(newValue)
		end
	end

	function Toggle:SetLocked(value: boolean)
		locked = value
		Toggle.Locked = value
	end

	function Toggle:IsLocked(): boolean
		return locked
	end

	Toggle:AddConnection(ui.Row.MouseEnter:Connect(function()
		hovered(true)
	end))
	Toggle:AddConnection(ui.Row.MouseLeave:Connect(function()
		hovered(false)
	end))
	Toggle:AddConnection(ui.Row.MouseButton1Click:Connect(function()
		Toggle:Toggle()
	end))
	Toggle:AddCleanup(destroyScope)
	Toggle:AddCleanup(function()
		knobDisconnect()
		knobSpring:destroy()
	end)

	Toggle.Label = ui.Title
	Toggle.Instance = ui.Row
	return Toggle
end
