const vide = require("../../vide")
const tab = require("./tab")
const frame = require("../primitives/frame")
const textlabel = require("../primitives/textlabel")
const textbutton = require("../primitives/textbutton")
const imagelabel = require("../primitives/imagelabel")
const uipadding = require("../primitives/uipadding")
const defaultTheme = require("../../utils/themes/default")
const Themes = require("../../utils/themes/registry")
const notifyComponent = require("./notify")
const drawingComponent = require("./drawing")

const UserInputService = game:GetService("UserInputService")
const RunService = game:GetService("RunService")
const Players = game:GetService("Players")
const makeDraggable = require("../../utils/draggable")

const Window = {}
Window.__index = Window
Window.MakeDraggable = makeDraggable

function Window.new(lib, props)
	props = props or {}

	const initialTheme = Themes.Get(props.Theme or defaultTheme)

	const self = setmetatable({
		Name = props.Name or "yummy beans",
		Tabs = {},
		Elements = {},
		CurrentTab = nil,
		OnDestroyed = props.OnDestroyed,
		Theme = vide.source(initialTheme),
	}, Window)

	self.Minimized = vide.source(false)

	local defaultSize = props.Size or UDim2.new(0.3, 0, 0.3, 0)
	local minSize = props.MinimizedSize or UDim2.new(defaultSize.X.Scale, defaultSize.X.Offset, 0.045, 0)

	local topbar = frame {
		Name = "TopBar",
		Size = function() 
			return self.Minimized() and UDim2.fromScale(1, 1) or UDim2.fromScale(1, 0.11424)
		end,
		Position = UDim2.new(0, 0, -0.00234, 0),
		BackgroundColor3 = function()
			return self.Theme().TopBarBackground
		end,
		Children = {
			vide.create "UICorner" {
				CornerRadius = UDim.new(0.2, 0),
			},

			-- Square bottom cover to only round top corners of topbar
			frame {
				Name = "Bottom",
				Size = UDim2.new(1, 0, 0.85083, 0),
				Position = UDim2.new(0, 0, 0.14917, 0),
				BackgroundColor3 = function()
					return self.Theme().TopBarBackground
				end,
			},

			-- Logo Icon
			imagelabel {
				Name = "Icon",
				Image = props.Icon or "http://www.roblox.com/asset/?id=18187292776",
				Size = UDim2.new(0.1023, 0, 1.055, 0),
				Position = UDim2.new(-0.00147, 0, 0, 0),
			},

			-- Vertical separator line next to icon
			frame {
				Name = "Line",
				Size = UDim2.new(0, 1, .8, 0),
				Position = UDim2.new(0.1, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = function()
					return self.Theme().LineColor or Color3.fromRGB(151, 151, 151)
				end,
			},

			-- Title
			textlabel {
				Name = "Title",
				Text = self.Name,
				Size = UDim2.new(0.5, 0, 1, 0),
				Position = UDim2.new(0.12321, 0, -0.02193, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundTransparency = 1,
				TextColor3 = function()
					return self.Theme().TextPrimaryColor
				end,
				Children = {
					uipadding {
						PaddingVertical = UDim.new(0.1, 0),
						PaddingLeft = UDim.new(0.05, 0),
					},
				},
			},

			-- Minimize button
			textbutton {
				Name = "Minimize",
				Size = UDim2.new(0.1, 0, 1, 0),
				Position = UDim2.new(0.75, 0, 0, 0),
				BackgroundTransparency = 1,
				Text = "-",
				TextColor3 = function()
					return self.Theme().TextPrimaryColor
				end,
				MouseButton1Click = function()
					self.Minimized(not self.Minimized())
				end,
				Children = {
					uipadding {
						PaddingVertical = UDim.new(0.1, 0),
						PaddingLeft = UDim.new(0.05, 0),
					},
				},
			},

			-- Exit button
			textbutton {
				Name = "Exit",
				Size = UDim2.new(0.1, 0, 1, 0),
				Position = UDim2.new(0.89932, 0, 0, 0),
				BackgroundTransparency = 1,
				Text = "X",
				TextColor3 = function()
					return self.Theme().TextPrimaryColor
				end,
				MouseButton1Click = function()
					self:Destroy()
				end,
				Children = {
					uipadding {
						PaddingVertical = UDim.new(0.1, 0),
						PaddingLeft = UDim.new(0.05, 0),
					},
				},
			},

			-- Horizontal bottom line of topbar
			frame {
				Name = "Line",
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = function()
					return self.Theme().SeparatorColor or Color3.fromRGB(204, 204, 204)
				end,
				Visible = function()
					return not self.Minimized()
				end,
			},
		},
	}

	-- Tab Buttons Container in Sidebar
	local tabButtonHolder = frame {
		Name = "Holder",
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Children = {
			uipadding {
				PaddingTop = UDim.new(0.05, 0),
			},
			vide.create "UIListLayout" {
				SortOrder = Enum.SortOrder.LayoutOrder,
			},
		},
	}

	-- Sidebar
	local sidebar = frame {
		Name = "Sidebar",
		Size = UDim2.new(0.2619, 0, 0.88598, 0),
		Position = UDim2.new(0.13061, 0, 0.55701, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = function()
			return self.Theme().SidebarBackground
		end,
		Visible = function()
			return not self.Minimized()
		end,
		Children = {
			vide.create "UICorner" {
				CornerRadius = UDim.new(0.08, 0),
			},

			-- Square hide patches so only bottom-left corner is rounded
			frame {
				Name = "Hide",
				Size = UDim2.new(0.2, 0, 0.2, 0),
				Position = UDim2.new(0, 0, 0, 0),
				BackgroundColor3 = function()
					return self.Theme().SidebarBackground
				end,
			},
			frame {
				Name = "Hide",
				Size = UDim2.new(0.2, 0, 0.2, 0),
				Position = UDim2.new(0.8, 0, 0.00271, 0),
				BackgroundColor3 = function()
					return self.Theme().SidebarBackground
				end,
			},
			frame {
				Name = "Hide",
				Size = UDim2.new(0.2, 0, 0.2, 0),
				Position = UDim2.new(0.9974, 0, 0.99851, 0),
				AnchorPoint = Vector2.new(1, 1),
				BackgroundColor3 = function()
					return self.Theme().SidebarBackground
				end,
			},
			frame {
				Name = "Line",
				BorderSizePixel = 0,
				BackgroundColor3 = function()
					return self.Theme().SeparatorColor or Color3.fromRGB(204, 204, 204)
				end,
				Size = UDim2.new(0, 1, 1, 0),
				Position = UDim2.new(0.99788, 0, 0.0047, 0),
			},

			tabButtonHolder,
		},
	}

	-- Tab Pages Container
	local tabContainer = frame {
		Name = "TabHolder",
		Size = UDim2.new(0.69686, 0, 0.79967, 0),
		Position = UDim2.new(0.63331, 0, 0.57126, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Visible = function()
			return not self.Minimized()
		end,
	}

	-- Main Window Frame
	local mainFrame = frame {
		Name = "Main",
		Size = function()
			return self.Minimized() and minSize or defaultSize
		end,
		Position = props.Position or UDim2.new(0.3, 0, 0.3, 0),
		AnchorPoint = props.AnchorPoint or Vector2.zero,
		BackgroundColor3 = function()
			return self.Theme().WindowBackground or self.Theme().FrameBackground
		end,
		ClipsDescendants = true,
		Children = {
			vide.create "UICorner" {
				CornerRadius = UDim.new(0.03, 0),
			},
			tabContainer,
			sidebar,
			topbar,
		},
	}

	makeDraggable(topbar, mainFrame)
	self.Instance = mainFrame
	self.TopBar = topbar
	self.Sidebar = sidebar
	self.TabButtonHolder = tabButtonHolder
	self.TabContainer = tabContainer

	self.Notifier = notifyComponent(mainFrame)

	local guiParent = props.Parent

	self.ScreenGui = vide.create "ScreenGui" {
		Name = "BeanzUI",
		ResetOnSpawn = false,
		IgnoreGuiInset = false,
		mainFrame,
	}

	self.DestroyRoot = vide.mount(function()
		return self.ScreenGui
	end, guiParent)

	return self
end

function Window:Notify(text: string)
	if self.Notifier then
		self.Notifier:Notify(text)
	end
end

function Window:Drawing(drawingoptions)
	return drawingComponent(self.ScreenGui, drawingoptions)
end

function Window:CreateTab(props)
	const newTab = tab.new(self, props)
	table.insert(self.Tabs, newTab)
	if self.CurrentTab == nil then
		newTab:Activate()
	end
	return newTab
end

function Window:GetElement(flag: string)
	return self.Elements[flag]
end

function Window:SetTheme(theme: string | { [string]: any })
	local resolved = Themes.Get(theme)
	self.Theme(resolved)
end

function Window:GetTheme()
	return self.Theme()
end

function Window:Export(): { [string]: any }
	local config = {}
	for _, tab in self.Tabs do
		if tab.Export then
			local tabConfig = tab:Export()
			for flag, val in tabConfig do
				config[flag] = val
			end
		end
	end
	return config
end

function Window:Import(config: { [string]: any })
	if not config then return end
	for _, tab in self.Tabs do
		if tab.Import then
			tab:Import(config)
		end
	end
end

function Window:ExportJSON(): string
	local HttpService = game:GetService("HttpService")
	return HttpService:JSONEncode(self:Export())
end

function Window:ImportJSON(jsonStr: string): boolean
	local HttpService = game:GetService("HttpService")
	local success, data = pcall(function()
		return HttpService:JSONDecode(jsonStr)
	end)
	if success and typeof(data) == "table" then
		self:Import(data)
		return true
	end
	return false
end

function Window:Destroy()
	if self.OnDestroyed then
		self.OnDestroyed()
	end
	if self.ScreenGui then
		self.ScreenGui:Destroy()
	end
	if self.DestroyRoot then
		self.DestroyRoot()
	end
end

return Window