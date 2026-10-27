const UserInputService = game:GetService("UserInputService")
const vide = require("../../vide")
const scope = require("../scope")
const frame = require("../primitives/frame")
const textbutton = require("../primitives/textbutton")
const textlabel = require("../primitives/textlabel")
const uistroke = require("../primitives/uistroke")
const BaseElement = require("./base")

const ROW_HEIGHT = 40

local function makeDraggable(handle: GuiObject, target: GuiObject): () -> ()
	local dragging = false
	local dragStart = Vector3.zero
	local startPosition = Vector2.zero

	const began = handle.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1
			and input.UserInputType ~= Enum.UserInputType.Touch
		then
			return
		end

		dragging = true
		dragStart = input.Position

		const absolute = target.AbsolutePosition
		const size = target.AbsoluteSize
		const anchor = target.AnchorPoint
		startPosition = Vector2.new(
			absolute.X + size.X * anchor.X,
			absolute.Y + size.Y * anchor.Y
		)

		local ended
		ended = input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
				ended:Disconnect()
			end
		end)
	end)

	const changed = UserInputService.InputChanged:Connect(function(input)
		if not dragging then
			return
		end
		if input.UserInputType ~= Enum.UserInputType.MouseMovement
			and input.UserInputType ~= Enum.UserInputType.Touch
		then
			return
		end

		const delta = input.Position - dragStart
		target.Position = UDim2.fromOffset(
			startPosition.X + delta.X,
			startPosition.Y + delta.Y
		)
	end)

	return function()
		dragging = false
		began:Disconnect()
		changed:Disconnect()
	end
end

return function(parent, options, window)
	options = options or {}

	const BindButton = BaseElement.new(options, "BindButton")
	BindButton.Window = window

	const hovered = vide.source(false)
	const moving = vide.source(false)
	const visible = vide.source(options.Visible ~= false)
	const buttonText = vide.source(options.ButtonText or "Lock")

	local dragCleanup = nil

	const destroyScope, ui = scope(function()
		const row = frame {
			Parent = parent,
			Name = BindButton.Name,
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
			Text = options.Text or options.Name or "Bind Button",
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
			Size = UDim2.new(1, -108, 1, 0),
			Position = UDim2.fromOffset(12, 0),
			ZIndex = 2,
		}

		const moveButton = textbutton {
			Parent = row,
			AutoButtonColor = false,
			Name = "Move",
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(1, -86, 0.5, 0),
			Size = UDim2.fromOffset(74, 28),
			BackgroundColor3 = function()
				const theme = window:GetTheme()
				return if moving() then theme.AccentColor else theme.DropdownItem
			end,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Text = function()
				return if moving() then "Stop" else "Move"
			end,
			TextSize = 12,
			TextScaled = false,
			FontFace = function()
				return window:GetTheme().MainFont
			end,
			TextColor3 = function()
				const theme = window:GetTheme()
				return if moving() then Color3.fromRGB(255, 255, 255) else theme.TextPrimaryColor
			end,
			TextXAlignment = Enum.TextXAlignment.Center,
			ZIndex = 2,
		}

		vide.create "UICorner" {
			Parent = moveButton,
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
			Parent = moveButton,
			Color = function()
				return window:GetTheme().AccentColor
			end,
			Thickness = 1,
			StrokeSizingMode = Enum.StrokeSizingMode.FixedSize,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		}

		const floating = textbutton {
			Parent = window.ScreenGui,
			AutoButtonColor = false,
			Name = BindButton.Name,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = options.Position or UDim2.fromScale(0.75, 0.75),
			Size = UDim2.fromOffset(52, 52),
			BackgroundColor3 = function()
				const theme = window:GetTheme()
				return theme.FrameBackground or theme.WindowBackground
			end,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Text = function()
				return buttonText()
			end,
			TextSize = 13,
			TextScaled = false,
			FontFace = function()
				return window:GetTheme().BoldFont
			end,
			TextColor3 = function()
				return window:GetTheme().TextPrimaryColor
			end,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextWrapped = true,
			Visible = function()
				return visible()
			end,
			ZIndex = 150,
		}

		vide.create "UICorner" {
			Parent = floating,
			CornerRadius = UDim.new(1, 0),
		}
		uistroke {
			Parent = floating,
			Color = function()
				return window:GetTheme().AccentColor
			end,
			Thickness = 1.5,
			StrokeSizingMode = Enum.StrokeSizingMode.FixedSize,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		}
		vide.create "UIAspectRatioConstraint" {
			Parent = floating,
			AspectRatio = 1,
		}

		return {
			Row = row,
			Title = title,
			MoveButton = moveButton,
			Floating = floating,
		}
	end)

	local function stopDragging()
		if dragCleanup then
			dragCleanup()
			dragCleanup = nil
		end
	end

	function BindButton:GetButton(): TextButton
		return ui.Floating
	end

	function BindButton:SetVisible(value: boolean)
		visible(value == true)
	end

	function BindButton:IsVisible(): boolean
		return visible()
	end

	function BindButton:SetDraggable(enabled: boolean)
		moving(enabled == true)
		stopDragging()
		if enabled then
			dragCleanup = makeDraggable(ui.Floating, ui.Floating)
		end
	end

	function BindButton:IsDraggable(): boolean
		return moving()
	end

	function BindButton:SetPosition(position: UDim2)
		ui.Floating.Position = position
	end

	function BindButton:GetPosition(): UDim2
		return ui.Floating.Position
	end

	function BindButton:SetButtonText(text: string)
		buttonText(text)
	end

	BindButton:AddConnection(ui.Row.MouseEnter:Connect(function()
		hovered(true)
	end))
	BindButton:AddConnection(ui.Row.MouseLeave:Connect(function()
		hovered(false)
	end))
	BindButton:AddConnection(ui.MoveButton.Activated:Connect(function()
		BindButton:SetDraggable(not moving())
	end))
	BindButton:AddCleanup(destroyScope)
	BindButton:AddCleanup(function()
		stopDragging()
		ui.Floating:Destroy()
	end)

	if options.Draggable == true then
		BindButton:SetDraggable(true)
	end

	BindButton.Label = ui.Title
	BindButton.Instance = ui.Row
	return BindButton
end
