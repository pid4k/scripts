const vide = require("../../vide")
const scope = require("../scope")
const frame = require("../primitives/frame")
const textbutton = require("../primitives/textbutton")
const textlabel = require("../primitives/textlabel")
const scrollingframe = require("../primitives/scrollingframe")
const uipadding = require("../primitives/uipadding")
const buttonComponent = require("./button")
const toggleComponent = require("./toggle")
const sliderComponent = require("./slider")
const dropdownComponent = require("./dropdown")
const textboxComponent = require("./textbox")
const bindkeyComponent = require("./bindkey")
const bindbuttonComponent = require("./bindbutton")
const bannerComponent = require("./banner")

const ROW_GAP = 8

const Tab = {}
Tab.__index = Tab

function Tab.new(window, options)
	if typeof(options) == "string" then
		options = { Name = options }
	end
	options = options or {}

	const name = options.Name or "Tab"
	const active = vide.source(false)
	const hovered = vide.source(false)

	const destroyScope, ui = scope(function()
		const content = scrollingframe {
			Parent = window.TabContent,
			Name = name,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = active,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			ScrollBarImageColor3 = function()
				const theme = window:GetTheme()
				return theme.TextSecondaryColor or theme.TextPrimaryColor
			end,
			ScrollBarImageTransparency = 0.4,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollBarThickness = 3,
			ZIndex = 1,
		}

		uipadding {
			Parent = content,
			PaddingTop = UDim.new(0, 12),
			PaddingBottom = UDim.new(0, 12),
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
		}
		vide.create "UIListLayout" {
			Parent = content,
			Padding = UDim.new(0, ROW_GAP),
			SortOrder = if options.Alphabetical == true then Enum.SortOrder.Name else Enum.SortOrder.LayoutOrder,
		}

		const tabButton = textbutton {
			Parent = window.TabButtonHolder,
			AutoButtonColor = false,
			Name = name,
			Size = UDim2.new(1, 0, 0, 34),
			BackgroundColor3 = function()
				return window:GetTheme().TabButtonBackground
			end,
			BackgroundTransparency = function()
				if active() then
					return 0.82
				elseif hovered() then
					return 0.92
				end
				return 1
			end,
			BorderSizePixel = 0,
			Text = "",
			TextScaled = false,
			ClipsDescendants = true,
			ZIndex = 1,
		}

		vide.create "UICorner" {
			Parent = tabButton,
			CornerRadius = UDim.new(0, 6),
		}

		const accent = frame {
			Parent = tabButton,
			Name = "Accent",
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.fromOffset(3, 14),
			BackgroundColor3 = function()
				return window:GetTheme().AccentColor
			end,
			BorderSizePixel = 0,
			Visible = active,
			ZIndex = 2,
		}

		vide.create "UICorner" {
			Parent = accent,
			CornerRadius = UDim.new(1, 0),
		}

		const title = textlabel {
			Parent = tabButton,
			BackgroundTransparency = 1,
			Name = "Title",
			Text = name,
			Size = UDim2.new(1, -20, 1, 0),
			Position = UDim2.fromOffset(14, 0),
			TextSize = 13,
			TextScaled = false,
			FontFace = function()
				return window:GetTheme().MainFont
			end,
			TextColor3 = function()
				const theme = window:GetTheme()
				return if active() or hovered()
					then (theme.TabButtonActive or theme.TextPrimaryColor)
					else theme.TabButtonInactive
			end,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 2,
		}

		return {
			Content = content,
			TabButton = tabButton,
			Title = title,
		}
	end)

	const self = setmetatable({
		Window = window,
		Name = name,
		Content = ui.Content,
		TabButton = ui.TabButton,
		Elements = {},
		Destroyed = false,
		_videDestroy = destroyScope,
	}, Tab)

	self._connections = {}

	function Tab:RegisterElement(element)
		element.Tab = self
		element.Window = self.Window
		table.insert(self.Elements, element)
		if element.Flag then
			self.Window.Elements[element.Flag] = element
		end
		return element
	end

	function Tab:Activate()
		if active() then
			return
		end

		for _, other in self.Window.Tabs do
			if other ~= self then
				other:Deactivate()
			end
		end

		active(true)
		self.Window.CurrentTab = self
		self.Window:ClosePopups()
	end

	function Tab:Deactivate()
		if not active() then
			return
		end

		active(false)
		hovered(false)
		if self.Window.CurrentTab == self then
			self.Window.CurrentTab = nil
		end
		self.Window:ClosePopups()
	end

	function Tab:IsActive(): boolean
		return active()
	end

	function Tab:SetText(text: string)
		self.Name = text
		ui.Title.Text = text
		self.TabButton.Name = text
		self.Content.Name = text
	end

	function Tab:Button(options)
		return self:RegisterElement(buttonComponent(self.Content, options, self.Window))
	end

	function Tab:Toggle(options)
		return self:RegisterElement(toggleComponent(self.Content, options, self.Window))
	end

	function Tab:Slider(options)
		return self:RegisterElement(sliderComponent(self.Content, options, self.Window))
	end

	function Tab:Dropdown(options)
		return self:RegisterElement(dropdownComponent(self.Content, options, self.Window))
	end

	function Tab:TextBox(options)
		return self:RegisterElement(textboxComponent(self.Content, options, self.Window))
	end

	function Tab:BindKey(options)
		return self:RegisterElement(bindkeyComponent(self.Content, options, self.Window))
	end

	function Tab:BindButton(options)
		return self:RegisterElement(bindbuttonComponent(self.Content, options, self.Window))
	end

	function Tab:Warning(options)
		return self:RegisterElement(bannerComponent(self.Content, "Warning", options, self.Window))
	end

	function Tab:Info(options)
		return self:RegisterElement(bannerComponent(self.Content, "Info", options, self.Window))
	end

	function Tab:Message(options)
		return self:RegisterElement(bannerComponent(self.Content, "Message", options, self.Window))
	end

	function Tab:Export()
		const config = {}
		for _, element in self.Elements do
			if element:CanSave() then
				const value = element:Export()
				if value ~= nil then
					config[element.Flag] = value
				end
			end
		end
		return config
	end

	function Tab:Import(config)
		if not config then
			return
		end
		for _, element in self.Elements do
			if element:CanSave() and config[element.Flag] ~= nil then
				element:Import(config[element.Flag])
			end
		end
	end

	function Tab:Destroy()
		if self.Destroyed then
			return
		end
		self.Destroyed = true
		active(false)
		hovered(false)

		for _, connection in self._connections do
			connection:Disconnect()
		end
		table.clear(self._connections)

		if self._videDestroy then
			self._videDestroy()
			self._videDestroy = nil
		end

		for _, element in self.Elements do
			if element.Flag and self.Window.Elements[element.Flag] == element then
				self.Window.Elements[element.Flag] = nil
			end
			element:Destroy()
		end
		table.clear(self.Elements)

		const index = table.find(self.Window.Tabs, self)
		if index then
			table.remove(self.Window.Tabs, index)
		end
		if self.Window.CurrentTab == self then
			self.Window.CurrentTab = nil
		end

		self.TabButton:Destroy()
		self.Content:Destroy()

		if self.Window.CurrentTab == nil and self.Window.Tabs[1] and not self.Window.Destroying then
			self.Window.Tabs[1]:Activate()
		end
	end

	table.insert(self._connections, self.TabButton.MouseEnter:Connect(function()
		hovered(true)
	end))
	table.insert(self._connections, self.TabButton.MouseLeave:Connect(function()
		hovered(false)
	end))
	table.insert(self._connections, self.TabButton.MouseButton1Click:Connect(function()
		self:Activate()
	end))

	return self
end

return Tab
