const RunService = game:GetService("RunService")
const Players = game:GetService("Players")
const UserInputService = game:GetService("UserInputService")
const HttpService = game:GetService("HttpService")
const Animation = require("../animation")
const vide = require("../../vide")
const scope = require("../scope")
const frame = require("../primitives/frame")
const textbutton = require("../primitives/textbutton")
const textlabel = require("../primitives/textlabel")
const imagelabel = require("../primitives/imagelabel")
const scrollingframe = require("../primitives/scrollingframe")
const uipadding = require("../primitives/uipadding")
const Tab = require("./tab")
const notifyComponent = require("./notify")
const drawingComponent = require("./drawing")
const Themes = require("../../utils/themes/registry")
const defaultTheme = require("../../utils/themes/default")

const TOPBAR_HEIGHT = 40
const SIDEBAR_WIDTH = 132
const WINDOW_CORNER = 10
const CLOSE_HOVER = Color3.fromRGB(190, 52, 52)
const WINDOW_TWEEN = {
	duration = 0.18,
	easing = "quadOut",
}

local function getViewport(): Vector2
	return workspace.CurrentCamera.ViewportSize
end

local function getGuiParent(): Instance
	if typeof(gethui) == "function" then
		return gethui()
	end
	if RunService:IsStudio() then
		return Players.LocalPlayer:WaitForChild("PlayerGui")
	end
	return game:GetService("CoreGui")
end

local function resolveSize(size: UDim2?, fallbackWidth: number, fallbackHeight: number): UDim2
	const viewport = getViewport()
	local width = fallbackWidth
	local height = fallbackHeight

	if size then
		width = size.X.Scale * viewport.X + size.X.Offset
		height = size.Y.Scale * viewport.Y + size.Y.Offset
	end

	width = math.min(math.max(width, 360), viewport.X - 24)
	height = math.min(math.max(height, 240), viewport.Y - 24)

	return UDim2.fromOffset(width, height)
end

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

const Window = {}
Window.__index = Window

function Window.new(options)
	options = options or {}

	const theme = vide.source(Themes.Get(options.Theme or defaultTheme))
	const minimized = vide.source(false)

	const viewport = getViewport()
	const expandedSize = resolveSize(
		options.Size,
		math.clamp(viewport.X * 0.42, 520, 620),
		math.clamp(viewport.Y * 0.56, 340, 500)
	)

	const minimizedSize = UDim2.fromOffset(expandedSize.X.Offset, TOPBAR_HEIGHT)
	const position = options.Position or UDim2.fromScale(0.5, 0.5)
	const anchor = options.AnchorPoint
		or (if options.Position then Vector2.zero else Vector2.new(0.5, 0.5))

	const self = setmetatable({
		Name = options.Title or "Beans",
		Tabs = {},
		Elements = {},
		CurrentTab = nil,
		OnDestroyed = options.OnDestroyed,
		Destroyed = false,
		Destroying = false,
		Popups = {},
		ExpandedSize = expandedSize,
		MinimizedSize = minimizedSize,
		_theme = theme,
		_minimized = minimized,
		_connections = {},
	}, Window)

	const guiParent = options.Parent or getGuiParent()

	const destroyScope, ui = scope(function()
		const screenGui = vide.create "ScreenGui" {
			Name = "BeanzUI",
			ResetOnSpawn = false,
			IgnoreGuiInset = false,
			DisplayOrder = options.DisplayOrder or 50,
			Enabled = options.Visible ~= false,
		}
		screenGui.Parent = guiParent

		const root = frame {
			Parent = screenGui,
			Name = "Root",
			Size = expandedSize,
			Position = position,
			AnchorPoint = anchor,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1,
		}

		imagelabel {
			Parent = root,
			Name = "Shadow",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(1, 48, 1, 48),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Image = "rbxassetid://6014261993",
			ImageColor3 = Color3.fromRGB(0, 0, 0),
			ImageTransparency = 0.45,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(49, 49, 450, 450),
			ZIndex = 1,
		}

		const main = frame {
			Parent = root,
			Name = "Main",
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = function()
				const current = theme()
				return current.WindowBackground or current.FrameBackground
			end,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			ZIndex = 2,
		}

		vide.create "UICorner" {
			Parent = main,
			CornerRadius = UDim.new(0, WINDOW_CORNER),
		}

		const topbar = frame {
			Parent = main,
			Name = "TopBar",
			Size = UDim2.new(1, 0, 0, TOPBAR_HEIGHT),
			BackgroundColor3 = function()
				return theme().TopBarBackground
			end,
			BorderSizePixel = 0,
			ZIndex = 10,
		}

		vide.create "UICorner" {
			Parent = topbar,
			CornerRadius = UDim.new(0, WINDOW_CORNER),
		}

		frame {
			Parent = topbar,
			Name = "Fill",
			Size = UDim2.new(1, 0, 0.5, 0),
			Position = UDim2.new(0, 0, 0.5, 0),
			BackgroundColor3 = function()
				return theme().TopBarBackground
			end,
			BorderSizePixel = 0,
			ZIndex = 1,
		}

		local icon
		if options.Icon then
			icon = imagelabel {
				Parent = topbar,
				Name = "Icon",
				Position = UDim2.fromOffset(12, 9),
				Size = UDim2.fromOffset(22, 22),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Image = options.Icon,
				ScaleType = Enum.ScaleType.Fit,
				ZIndex = 3,
			}
		else
			icon = frame {
				Parent = topbar,
				Name = "Icon",
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0, 23, 0.5, 0),
				Size = UDim2.fromOffset(10, 10),
				BackgroundColor3 = function()
					return theme().AccentColor
				end,
				BorderSizePixel = 0,
				ZIndex = 3,
			}
			vide.create "UICorner" {
				Parent = icon,
				CornerRadius = UDim.new(1, 0),
			}
		end

		const title = textlabel {
			Parent = topbar,
			BackgroundTransparency = 1,
			Name = "Title",
			Text = self.Name,
			Position = UDim2.fromOffset(42, 0),
			Size = UDim2.new(1, -152, 1, 0),
			TextSize = 15,
			TextScaled = false,
			FontFace = function()
				return theme().BoldFont
			end,
			TextColor3 = function()
				return theme().TextPrimaryColor
			end,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 3,
		}

		local function makeCaptionButton(name: string, text: string, xOffset: number, hoverBackground: Color3?)
			const hovered = vide.source(false)

			const button = textbutton {
				Parent = topbar,
				AutoButtonColor = false,
				Name = name,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(1, xOffset, 0.5, 0),
				Size = UDim2.fromOffset(28, 28),
				BackgroundColor3 = function()
					if hoverBackground then
						return hoverBackground
					end
					const current = theme()
					return current.ElementHoverBackground or current.ElementBackground
				end,
				BackgroundTransparency = function()
					return if hovered() then 0 else 1
				end,
				BorderSizePixel = 0,
				Text = text,
				TextSize = 15,
				TextScaled = false,
				FontFace = function()
					return theme().MainFont
				end,
				TextColor3 = function()
					return if hovered() then Color3.fromRGB(255, 255, 255) else theme().TextPrimaryColor
				end,
				ZIndex = 4,
			}

			vide.create "UICorner" {
				Parent = button,
				CornerRadius = UDim.new(0, 5),
			}

			table.insert(self._connections, button.MouseEnter:Connect(function()
				hovered(true)
			end))
			table.insert(self._connections, button.MouseLeave:Connect(function()
				hovered(false)
			end))

			return button
		end

		const minimizeButton = makeCaptionButton("Minimize", "-", -68)
		const closeButton = makeCaptionButton("Close", "X", -36, CLOSE_HOVER)

		const topbarLine = frame {
			Parent = main,
			Name = "TopBarLine",
			Position = UDim2.fromOffset(0, TOPBAR_HEIGHT),
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = function()
				const current = theme()
				return current.SeparatorColor or current.LineColor
			end,
			BorderSizePixel = 0,
			Visible = function()
				return not minimized()
			end,
			ZIndex = 11,
		}

		const sidebar = frame {
			Parent = main,
			Name = "Sidebar",
			Position = UDim2.fromOffset(0, TOPBAR_HEIGHT),
			Size = UDim2.new(0, SIDEBAR_WIDTH, 1, -TOPBAR_HEIGHT),
			BackgroundColor3 = function()
				return theme().SidebarBackground
			end,
			BorderSizePixel = 0,
			Visible = function()
				return not minimized()
			end,
			ZIndex = 5,
		}

		frame {
			Parent = sidebar,
			Name = "Line",
			Position = UDim2.new(1, -1, 0, 0),
			Size = UDim2.new(0, 1, 1, 0),
			BackgroundColor3 = function()
				const current = theme()
				return current.LineColor or current.SeparatorColor
			end,
			BorderSizePixel = 0,
			ZIndex = 1,
		}

		const tabButtonHolder = scrollingframe {
			Parent = sidebar,
			Name = "Tabs",
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollBarThickness = 0,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ZIndex = 2,
		}

		uipadding {
			Parent = tabButtonHolder,
			PaddingTop = UDim.new(0, 8),
			PaddingBottom = UDim.new(0, 8),
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8),
		}
		vide.create "UIListLayout" {
			Parent = tabButtonHolder,
			Padding = UDim.new(0, 4),
			SortOrder = Enum.SortOrder.LayoutOrder,
		}

		const tabContent = frame {
			Parent = main,
			Name = "Content",
			Position = UDim2.fromOffset(SIDEBAR_WIDTH, TOPBAR_HEIGHT),
			Size = UDim2.new(1, -SIDEBAR_WIDTH, 1, -TOPBAR_HEIGHT),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Visible = function()
				return not minimized()
			end,
			ZIndex = 6,
		}

		const dropdownLayer = frame {
			Parent = screenGui,
			Name = "DropdownLayer",
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.fromOffset(0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 100,
		}

		return {
			ScreenGui = screenGui,
			Root = root,
			Main = main,
			TopBar = topbar,
			TopBarLine = topbarLine,
			Sidebar = sidebar,
			TabButtonHolder = tabButtonHolder,
			TabContent = tabContent,
			DropdownLayer = dropdownLayer,
			TitleLabel = title,
			MinimizeButton = minimizeButton,
			CloseButton = closeButton,
		}
	end)

	self._videDestroy = destroyScope
	self.ScreenGui = ui.ScreenGui
	self.Root = ui.Root
	self.Main = ui.Main
	self.TopBar = ui.TopBar
	self.TopBarLine = ui.TopBarLine
	self.Sidebar = ui.Sidebar
	self.TabButtonHolder = ui.TabButtonHolder
	self.TabContent = ui.TabContent
	self.DropdownLayer = ui.DropdownLayer
	self.TitleLabel = ui.TitleLabel
	self.Notifier = notifyComponent(self)

	table.insert(self._connections, ui.MinimizeButton.Activated:Connect(function()
		self:ToggleMinimized()
	end))
	table.insert(self._connections, ui.CloseButton.Activated:Connect(function()
		self:Destroy()
	end))
	table.insert(self._connections, self.TopBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch
		then
			self:ClosePopups()
		end
	end))

	self._dragCleanup = makeDraggable(self.TopBar, self.Root)

	if options.ToggleKey then
		const keyCode = if typeof(options.ToggleKey) == "string"
			then Enum.KeyCode[options.ToggleKey]
			else options.ToggleKey
		if keyCode == nil then
			error("Unknown window ToggleKey: " .. tostring(options.ToggleKey))
		end
		table.insert(self._connections, UserInputService.InputBegan:Connect(function(input, processed)
			if processed then
				return
			end
			if input.KeyCode == keyCode then
				self:ToggleVisible()
			end
		end))
	end

	return self
end

function Window:GetTheme(): any
	return self._theme()
end

function Window:SetTheme(value: string | { [string]: any })
	self._theme(Themes.Get(value))
end

function Window:SetTitle(value: string)
	self.Name = value
	self.TitleLabel.Text = value
end

function Window:RegisterPopup(popup: any)
	table.insert(self.Popups, popup)
end

function Window:UnregisterPopup(popup: any)
	const index = table.find(self.Popups, popup)
	if index then
		table.remove(self.Popups, index)
	end
end

function Window:ClosePopups(except: any?)
	for _, popup in self.Popups do
		if popup ~= except then
			popup:Close()
		end
	end
end

function Window:SetMinimized(value: boolean)
	value = value == true
	if self._minimized() == value then
		return
	end

	self._minimized(value)
	if value then
		self:ClosePopups()
	end

	if self._sizeCleanup then
		self._sizeCleanup()
		self._sizeCleanup = nil
	end

	const target = if value then self.MinimizedSize else self.ExpandedSize
	self._sizeCleanup = Animation.Tween(self.Root, { Size = target }, WINDOW_TWEEN, function()
		self._sizeCleanup = nil
	end)
end

function Window:ToggleMinimized()
	self:SetMinimized(not self._minimized())
end

function Window:IsMinimized(): boolean
	return self._minimized()
end

function Window:SetVisible(value: boolean)
	self.ScreenGui.Enabled = value
	if not value then
		self:ClosePopups()
	end
end

function Window:IsVisible(): boolean
	return self.ScreenGui.Enabled
end

function Window:ToggleVisible()
	self:SetVisible(not self:IsVisible())
end

function Window:SetSize(size: UDim2)
	const resolved = resolveSize(size, self.ExpandedSize.X.Offset, self.ExpandedSize.Y.Offset)
	self.ExpandedSize = resolved
	self.MinimizedSize = UDim2.fromOffset(resolved.X.Offset, self.MinimizedSize.Y.Offset)

	if self._sizeCleanup then
		self._sizeCleanup()
		self._sizeCleanup = nil
	end

	self.Root.Size = if self._minimized() then self.MinimizedSize else resolved
end

function Window:Notify(text: any, duration: number?)
	return self.Notifier:Notify(text, duration)
end

function Window:Drawing(options)
	return drawingComponent(self.ScreenGui, options)
end

function Window:CreateTab(options)
	const tab = Tab.new(self, options)
	table.insert(self.Tabs, tab)
	if self.CurrentTab == nil then
		tab:Activate()
	end
	return tab
end

function Window:SelectTab(tab: any)
	tab:Activate()
end

function Window:GetElement(flag: string)
	return self.Elements[flag]
end

function Window:Export(): { [string]: any }
	const config = {}
	for _, tab in self.Tabs do
		const tabConfig = tab:Export()
		for flag, value in tabConfig do
			config[flag] = value
		end
	end
	return config
end

function Window:Import(config: { [string]: any })
	if not config then
		return
	end
	for _, tab in self.Tabs do
		tab:Import(config)
	end
end

function Window:ExportJSON(): string
	return HttpService:JSONEncode(self:Export())
end

function Window:ImportJSON(json: string): boolean
	local success, data = pcall(function()
		return HttpService:JSONDecode(json)
	end)
	if success and typeof(data) == "table" then
		self:Import(data)
		return true
	end
	return false
end

function Window:Destroy()
	if self.Destroyed then
		return
	end
	self.Destroyed = true
	self.Destroying = true

	if self.OnDestroyed then
		self.OnDestroyed()
	end

	self:ClosePopups()

	for _, tab in table.clone(self.Tabs) do
		tab:Destroy()
	end
	table.clear(self.Tabs)
	table.clear(self.Elements)

	if self._dragCleanup then
		self._dragCleanup()
		self._dragCleanup = nil
	end

	if self._sizeCleanup then
		self._sizeCleanup()
		self._sizeCleanup = nil
	end

	if self.Notifier then
		self.Notifier:Destroy()
		self.Notifier = nil
	end

	for _, connection in self._connections do
		connection:Disconnect()
	end
	table.clear(self._connections)

	if self._videDestroy then
		self._videDestroy()
		self._videDestroy = nil
	end

	if self.ScreenGui then
		self.ScreenGui:Destroy()
		self.ScreenGui = nil
	end
end

return Window
