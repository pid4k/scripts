const UserInputService = game:GetService("UserInputService")
const vide = require("../../vide")
const scope = require("../scope")
const frame = require("../primitives/frame")
const textbutton = require("../primitives/textbutton")
const textlabel = require("../primitives/textlabel")
const uistroke = require("../primitives/uistroke")
const BaseElement = require("./base")

const ROW_HEIGHT = 40

const MOUSE_BINDS = {
	MouseButton1 = true,
	MouseButton2 = true,
	MouseButton3 = true,
	LMB = true,
	RMB = true,
	MMB = true,
}

const MOUSE_ALIASES = {
	LMB = "MouseButton1",
	RMB = "MouseButton2",
	MMB = "MouseButton3",
}

const MOUSE_LABELS = {
	MouseButton1 = "LMB",
	MouseButton2 = "RMB",
	MouseButton3 = "MMB",
}

local function containsPoint(gui: GuiObject, position: Vector3): boolean
	const origin = gui.AbsolutePosition
	const size = gui.AbsoluteSize
	return position.X >= origin.X
		and position.X <= origin.X + size.X
		and position.Y >= origin.Y
		and position.Y <= origin.Y + size.Y
end

return function(parent, options, window)
	options = options or {}

	const KeyBind = BaseElement.new(options, "Keybind")
	KeyBind.Callback = options.Callback
	KeyBind.Processed = options.Processed == true
	KeyBind.Window = window

	const placeholder = options.Placeholder or "Bind"
	const hovered = vide.source(false)
	const listening = vide.source(false)
	const bind = vide.source(nil)
	const isKey = vide.source(false)

	local allowProcessed = KeyBind.Processed
	local ignoreClick = false

	const destroyScope, ui = scope(function()
		const row = frame {
			Parent = parent,
			Name = KeyBind.Name,
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
			Text = options.Text or options.Name or "Keybind",
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
			Size = UDim2.new(1, -116, 1, 0),
			Position = UDim2.fromOffset(12, 0),
			ZIndex = 2,
		}

		const bindButton = textbutton {
			Parent = row,
			AutoButtonColor = false,
			Name = "Bind",
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(1, -102, 0.5, 0),
			Size = UDim2.fromOffset(90, 28),
			BackgroundColor3 = function()
				const theme = window:GetTheme()
				return if listening() then theme.AccentColor else theme.DropdownItem
			end,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Text = function()
				if listening() then
					return "..."
				end
				const current = bind()
				if current == nil then
					return placeholder
				end
				return if isKey() then current else (MOUSE_LABELS[current] or current)
			end,
			TextSize = 12,
			TextScaled = false,
			FontFace = function()
				return window:GetTheme().MainFont
			end,
			TextColor3 = function()
				const theme = window:GetTheme()
				return if listening() then Color3.fromRGB(255, 255, 255) else theme.TextPrimaryColor
			end,
			TextXAlignment = Enum.TextXAlignment.Center,
			ZIndex = 2,
		}

		vide.create "UICorner" {
			Parent = bindButton,
			CornerRadius = UDim.new(0, 5),
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
		uistroke {
			Parent = bindButton,
			Color = function()
				const theme = window:GetTheme()
				return if listening() then theme.AccentColor else theme.ElementStroke
			end,
			Thickness = 1,
			StrokeSizingMode = Enum.StrokeSizingMode.FixedSize,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		}

		return {
			Row = row,
			Title = title,
			BindButton = bindButton,
		}
	end)

	local function setBind(value: string?, keyboard: boolean)
		bind(value)
		isKey(keyboard)
		KeyBind.Bind = value
		KeyBind.IsKey = keyboard
	end

	function KeyBind:GetValue(): string?
		return bind()
	end

	function KeyBind:SetValue(value: string | EnumItem | nil)
		if value == nil or value == "" then
			setBind(nil, false)
			return
		end

		if typeof(value) == "EnumItem" then
			if value.EnumType == Enum.KeyCode then
				setBind(value.Name, true)
			elseif value.EnumType == Enum.UserInputType and MOUSE_BINDS[value.Name] == true then
				setBind(MOUSE_ALIASES[value.Name] or value.Name, false)
			else
				error("Keybind value must be a KeyCode or mouse button")
			end
			return
		end

		if typeof(value) ~= "string" then
			error("Keybind value must be a string or EnumItem")
		end

		if MOUSE_ALIASES[value] then
			setBind(MOUSE_ALIASES[value], false)
		elseif MOUSE_BINDS[value] then
			setBind(value, false)
		elseif Enum.KeyCode[value] then
			setBind(value, true)
		else
			error("Unknown keybind: " .. value)
		end
	end

	function KeyBind:SetCallback(callback)
		KeyBind.Callback = callback
	end

	function KeyBind:SetProcessed(processed: boolean)
		allowProcessed = processed
		KeyBind.Processed = processed
	end

	KeyBind:AddConnection(ui.Row.MouseEnter:Connect(function()
		hovered(true)
	end))
	KeyBind:AddConnection(ui.Row.MouseLeave:Connect(function()
		hovered(false)
	end))
	KeyBind:AddConnection(ui.BindButton.Activated:Connect(function()
		if ignoreClick then
			ignoreClick = false
			return
		end
		listening(not listening())
	end))
	KeyBind:AddConnection(UserInputService.InputBegan:Connect(function(input, processed)
		if listening() then
			if input.UserInputType == Enum.UserInputType.Keyboard then
				if input.KeyCode ~= Enum.KeyCode.Escape then
					setBind(input.KeyCode.Name, true)
				end
				listening(false)
			elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
				setBind("MouseButton1", false)
				listening(false)
				if containsPoint(ui.BindButton, input.Position) then
					ignoreClick = true
				end
			elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
				setBind("MouseButton2", false)
				listening(false)
			elseif input.UserInputType == Enum.UserInputType.MouseButton3 then
				setBind("MouseButton3", false)
				listening(false)
			end
			return
		end

		if processed and not allowProcessed then
			return
		end
		if not bind() then
			return
		end

		local triggered = false
		if isKey() then
			triggered = input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode.Name == bind()
		else
			triggered = input.UserInputType.Name == bind()
		end

		if triggered and KeyBind.Callback then
			KeyBind.Callback(bind())
		end
	end))
	KeyBind:AddCleanup(destroyScope)
	KeyBind:AddCleanup(function()
		listening(false)
	end)

	KeyBind:SetValue(options.Default)
	KeyBind.Label = ui.Title
	KeyBind.Instance = ui.Row
	return KeyBind
end
