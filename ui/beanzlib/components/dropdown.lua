const UserInputService = game:GetService("UserInputService")
const vide = require("../../vide")
const scope = require("../scope")
const frame = require("../primitives/frame")
const textbutton = require("../primitives/textbutton")
const textlabel = require("../primitives/textlabel")
const scrollingframe = require("../primitives/scrollingframe")
const uipadding = require("../primitives/uipadding")
const uistroke = require("../primitives/uistroke")
const BaseElement = require("./base")

const ROW_HEIGHT = 40
const OPTION_HEIGHT = 30
const OPTION_GAP = 4
const POPUP_PADDING = 6

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

	const Dropdown = BaseElement.new(options, "Dropdown")
	Dropdown.Callback = options.Callback
	Dropdown.Selected = nil
	Dropdown.Options = {}
	Dropdown.Window = window

	const placeholder = options.Placeholder or "Select..."
	const hovered = vide.source(false)
	const openState = vide.source(false)
	const selected = vide.source(nil)

	local optionConnections = {}
	local optionsDestroy = nil

	const destroyScope, ui = scope(function()
		const row = textbutton {
			Parent = parent,
			AutoButtonColor = false,
			Name = Dropdown.Name,
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
			Text = options.Text or options.Name or "Dropdown",
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
			Size = UDim2.new(1, -188, 1, 0),
			Position = UDim2.fromOffset(12, 0),
			ZIndex = 2,
		}

		const valueLabel = textlabel {
			Parent = row,
			BackgroundTransparency = 1,
			Name = "Value",
			Text = function()
				const option = selected()
				return if option then option.Name else placeholder
			end,
			TextSize = 13,
			TextScaled = false,
			FontFace = function()
				return window:GetTheme().MainFont
			end,
			TextColor3 = function()
				const theme = window:GetTheme()
				if selected() then
					return theme.TextPrimaryColor
				end
				return theme.TextSecondaryColor or theme.TextPrimaryColor
			end,
			TextXAlignment = Enum.TextXAlignment.Right,
			TextTruncate = Enum.TextTruncate.AtEnd,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -38, 0, 0),
			Size = UDim2.new(0, 130, 1, 0),
			ZIndex = 2,
		}

		const chevron = textlabel {
			Parent = row,
			BackgroundTransparency = 1,
			Name = "Icon",
			Text = function()
				return if openState() then "^" else "v"
			end,
			TextSize = 12,
			TextScaled = false,
			FontFace = function()
				return window:GetTheme().MainFont
			end,
			TextColor3 = function()
				const theme = window:GetTheme()
				return theme.TextSecondaryColor or theme.TextPrimaryColor
			end,
			TextXAlignment = Enum.TextXAlignment.Center,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(1, -26, 0.5, 0),
			Size = UDim2.fromOffset(18, 18),
			ZIndex = 2,
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

		const popup = frame {
			Parent = window.DropdownLayer,
			Name = "DropdownOptions",
			Size = UDim2.fromOffset(180, 0),
			BackgroundColor3 = function()
				const theme = window:GetTheme()
				return theme.FrameBackground or theme.WindowBackground
			end,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Visible = function()
				return openState()
			end,
			ZIndex = 120,
		}

		vide.create "UICorner" {
			Parent = popup,
			CornerRadius = UDim.new(0, 8),
		}
		uistroke {
			Parent = popup,
			Color = function()
				return window:GetTheme().ElementStroke
			end,
			Thickness = 1,
			StrokeSizingMode = Enum.StrokeSizingMode.FixedSize,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		}

		const scroll = scrollingframe {
			Parent = popup,
			Name = "Options",
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollBarThickness = 3,
			ScrollBarImageColor3 = function()
				const theme = window:GetTheme()
				return theme.TextSecondaryColor or theme.TextPrimaryColor
			end,
			ZIndex = 121,
		}

		uipadding {
			Parent = scroll,
			PaddingTop = UDim.new(0, POPUP_PADDING),
			PaddingBottom = UDim.new(0, POPUP_PADDING),
			PaddingLeft = UDim.new(0, POPUP_PADDING),
			PaddingRight = UDim.new(0, POPUP_PADDING),
		}
		vide.create "UIListLayout" {
			Parent = scroll,
			Padding = UDim.new(0, OPTION_GAP),
			SortOrder = Enum.SortOrder.LayoutOrder,
		}

		return {
			Row = row,
			Title = title,
			ValueLabel = valueLabel,
			Chevron = chevron,
			Popup = popup,
			Scroll = scroll,
		}
	end)

	local function createOption(optionOptions)
		if typeof(optionOptions) == "string" then
			optionOptions = { Name = optionOptions }
		end

		const rawName = optionOptions.Name or optionOptions.Text
		if not rawName then
			error("Dropdown options require a Name or Text")
		end
		const name = tostring(rawName)

		const option = {
			Name = name,
			Value = if optionOptions.Value ~= nil then optionOptions.Value else name,
			Callback = optionOptions.Callback,
			Dropdown = Dropdown,
			Button = nil,
			Stroke = nil,
			Hovered = vide.source(false),
		}
		table.insert(Dropdown.Options, option)
		return option
	end

	local function findOption(target)
		if typeof(target) == "table" then
			if target.Dropdown == Dropdown then
				return target
			end
			target = if target.Value ~= nil then target.Value else target.Name
		elseif typeof(target) == "Instance" then
			target = target.Name
		end

		for _, option in Dropdown.Options do
			if option.Value == target or option.Name == target then
				return option
			end
		end
		return nil
	end

	local function selectOption(option, close, fireCallback)
		Dropdown.Selected = option
		selected(option)

		if close then
			Dropdown:Close()
		end
		if fireCallback then
			if option.Callback then
				option.Callback(option.Value, option)
			end
			if Dropdown.Callback then
				Dropdown.Callback(option.Value, option)
			end
		end
	end

	function Dropdown:Refresh()
		if openState() then
			Dropdown:Close()
		end

		for _, connection in optionConnections do
			connection:Disconnect()
		end
		table.clear(optionConnections)

		if optionsDestroy then
			optionsDestroy()
			optionsDestroy = nil
		end

		for _, child in ui.Scroll:GetChildren() do
			if child:IsA("GuiButton") or child.Name == "Empty" then
				child:Destroy()
			end
		end

		optionsDestroy = scope(function()
			for index, option in Dropdown.Options do
				option.Button = nil
				option.Stroke = nil
				option.Hovered(false)

				const button = textbutton {
					Parent = ui.Scroll,
					AutoButtonColor = false,
					Name = option.Name,
					Text = option.Name,
					Size = UDim2.new(1, 0, 0, OPTION_HEIGHT),
					LayoutOrder = index,
					BackgroundColor3 = function()
						const theme = window:GetTheme()
						return if option.Hovered()
							then (theme.DropdownItemHover or theme.DropdownItem)
							else theme.DropdownItem
					end,
					BackgroundTransparency = 0,
					BorderSizePixel = 0,
					TextSize = 13,
					TextScaled = false,
					FontFace = function()
						return window:GetTheme().MainFont
					end,
					TextColor3 = function()
						const theme = window:GetTheme()
						return if selected() == option then theme.AccentColor else theme.TextPrimaryColor
					end,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.AtEnd,
					ZIndex = 122,
				}

				vide.create "UICorner" {
					Parent = button,
					CornerRadius = UDim.new(0, 5),
				}
				uipadding {
					Parent = button,
					PaddingLeft = UDim.new(0, 8),
					PaddingRight = UDim.new(0, 8),
				}

				const stroke = uistroke {
					Parent = button,
					Color = function()
						return window:GetTheme().AccentColor
					end,
					Thickness = 1.5,
					StrokeSizingMode = Enum.StrokeSizingMode.FixedSize,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Enabled = function()
						return selected() == option
					end,
				}

				option.Button = button
				option.Stroke = stroke

				table.insert(optionConnections, button.MouseEnter:Connect(function()
					option.Hovered(true)
				end))
				table.insert(optionConnections, button.MouseLeave:Connect(function()
					option.Hovered(false)
				end))
				table.insert(optionConnections, button.MouseButton1Click:Connect(function()
					Dropdown:Select(option.Value)
				end))
			end

			if #Dropdown.Options == 0 then
				textlabel {
					Parent = ui.Scroll,
					BackgroundTransparency = 1,
					Name = "Empty",
					Text = "No options",
					Size = UDim2.new(1, 0, 0, 24),
					TextSize = 13,
					TextScaled = false,
					FontFace = function()
						return window:GetTheme().MainFont
					end,
					TextColor3 = function()
						const theme = window:GetTheme()
						return theme.TextSecondaryColor or theme.TextPrimaryColor
					end,
					TextXAlignment = Enum.TextXAlignment.Center,
					ZIndex = 122,
				}
			end
		end)
	end

	function Dropdown:AddOption(optionOptions)
		const option = createOption(optionOptions or {})
		Dropdown:Refresh()
		return option
	end

	function Dropdown:GetOption()
		return selected()
	end

	function Dropdown:GetValue()
		const option = selected()
		if option then
			return option.Value
		end
		return nil
	end

	function Dropdown:SetValue(target, fireCallback: boolean?)
		const option = findOption(target)
		if not option then
			error("Unknown dropdown option: " .. tostring(target))
		end
		selectOption(option, false, fireCallback == true)
	end

	function Dropdown:Select(target)
		const option = findOption(target)
		if not option then
			error("Unknown dropdown option: " .. tostring(target))
		end
		selectOption(option, true, true)
	end

	function Dropdown:SetCallback(callback)
		Dropdown.Callback = callback
	end

	function Dropdown:Open()
		if openState() or #Dropdown.Options == 0 then
			return
		end

		window:ClosePopups(Dropdown)
		openState(true)

		const layer = window.DropdownLayer
		const viewport = layer.AbsoluteSize
		const buttonPosition = ui.Row.AbsolutePosition - layer.AbsolutePosition
		const buttonSize = ui.Row.AbsoluteSize

		local popupHeight = #Dropdown.Options * OPTION_HEIGHT
			+ (#Dropdown.Options - 1) * OPTION_GAP
			+ POPUP_PADDING * 2
		popupHeight = math.min(popupHeight, 220)

		const width = math.min(math.max(buttonSize.X, 160), viewport.X - 16)
		const x = math.clamp(buttonPosition.X, 8, math.max(8, viewport.X - width - 8))
		local y = buttonPosition.Y + buttonSize.Y + 4
		if y + popupHeight > viewport.Y - 8 then
			y = math.max(8, buttonPosition.Y - popupHeight - 4)
		end

		ui.Popup.Position = UDim2.fromOffset(x, y)
		ui.Popup.Size = UDim2.fromOffset(width, popupHeight)

		Dropdown._outside = UserInputService.InputBegan:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.MouseButton1
				and input.UserInputType ~= Enum.UserInputType.Touch
			then
				return
			end
			if containsPoint(ui.Row, input.Position) or containsPoint(ui.Popup, input.Position) then
				return
			end
			Dropdown:Close()
		end)
	end

	function Dropdown:Close()
		if not openState() then
			return
		end

		openState(false)
		if Dropdown._outside then
			Dropdown._outside:Disconnect()
			Dropdown._outside = nil
		end
	end

	function Dropdown:Toggle()
		if openState() then
			Dropdown:Close()
		else
			Dropdown:Open()
		end
	end

	function Dropdown:IsOpen(): boolean
		return openState()
	end

	const baseSetVisible = Dropdown.SetVisible
	function Dropdown:SetVisible(visible: boolean)
		baseSetVisible(self, visible)
		if not visible then
			self:Close()
		end
	end

	if options.Options then
		for _, optionOptions in options.Options do
			createOption(optionOptions)
		end
	end
	Dropdown:Refresh()

	if options.Default ~= nil then
		Dropdown:SetValue(options.Default)
	end

	Dropdown:AddConnection(ui.Row.MouseEnter:Connect(function()
		hovered(true)
	end))
	Dropdown:AddConnection(ui.Row.MouseLeave:Connect(function()
		hovered(false)
	end))
	Dropdown:AddConnection(ui.Row.MouseButton1Click:Connect(function()
		Dropdown:Toggle()
	end))
	Dropdown:AddCleanup(function()
		for _, connection in optionConnections do
			connection:Disconnect()
		end
		table.clear(optionConnections)
		if optionsDestroy then
			optionsDestroy()
			optionsDestroy = nil
		end
		Dropdown:Close()
		window:UnregisterPopup(Dropdown)
		ui.Popup:Destroy()
	end)
	Dropdown:AddCleanup(destroyScope)

	window:RegisterPopup(Dropdown)
	Dropdown.Label = ui.Title
	Dropdown.Instance = ui.Row
	return Dropdown
end
