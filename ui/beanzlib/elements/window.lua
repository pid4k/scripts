const vide = require("../../vide-0.4.1/vide")
const tab = require("./tab")
const frame = require("../primitives/frame")
const textlabel = require("../primitives/textlabel")
const textbutton = require("../primitives/textbutton")
const imagelabel = require("../primitives/imagelabel")
const uipadding = require("../primitives/uipadding")
const defaultTheme = require("../../utils/themes/default")

const UserInputService = game:GetService("UserInputService")
const RunService = game:GetService("RunService")
const Players = game:GetService("Players")

local function makeDraggable(handle: GuiObject, target: GuiObject)
	local dragging = false
	local dragStart = Vector3.zero
	local startPos = target.Position

	handle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = target.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			target.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

const Window = {}
Window.__index = Window

function Window.new(lib, props)
	props = props or {}

	const self = setmetatable({
		name = props.name or "yummy beans",
		tabs = {},
		ondestroyed = props.ondestroyed,
		theme = vide.context(props.theme or defaultTheme),
	}, Window)

	if self.theme ~= defaultTheme then
		for k, v in defaultTheme do
			if self.theme[k] == nil then
				self.theme[k] = v
			end
		end
	end

	local minimized = vide.source(false)
	self.minimized = minimized

	local defaultSize = props.Size or UDim2.new(0.3, 0, 0.3, 0)
	local minSize = props.MinimizedSize or UDim2.new(defaultSize.X.Scale, defaultSize.X.Offset, 0.045, 0)

	local topbar = frame {
		Name = "TopBar",
		Size = UDim2.new(1, 0, 0.11424, 0),
		Position = UDim2.new(0, 0, -0.00234, 0),
		BackgroundColor3 = function()
			return self.theme().TopBarBackground
		end,
		vide.create "UICorner" {
			CornerRadius = UDim.new(0.2, 0),
		},

		-- Square bottom cover to only round top corners of topbar
		frame {
			Name = "Bottom",
			Size = UDim2.new(1, 0, 0.85083, 0),
			Position = UDim2.new(0, 0, 0.14917, 0),
			BackgroundColor3 = function()
				return self.theme().TopBarBackground
			end,
		},

		-- Logo Icon
		imagelabel {
			Name = "Icon",
			Image = props.icon or "http://www.roblox.com/asset/?id=18187292776",
			Size = UDim2.new(0.1023, 0, 1.055, 0),
			Position = UDim2.new(-0.00147, 0, 0, 0),
		},

		-- Vertical separator line next to icon
		frame {
			Name = "Line",
			Size = UDim2.new(0, 1, 0.8, 0),
			Position = UDim2.new(0.10084, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = function()
				return self.theme().LineColor or Color3.fromRGB(151, 151, 151)
			end,
		},

		-- Title
		textlabel {
			Name = "Title",
			Text = self.name,
			Size = UDim2.new(0.5, 0, 1, 0),
			Position = UDim2.new(0.12321, 0, -0.02193, 0),
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			TextColor3 = function()
				return self.theme().TextPrimaryColor
			end,
			uipadding {
				PaddingVertical = UDim.new(0.1, 0),
				PaddingLeft = UDim.new(0.05, 0),
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
				return self.theme().TextPrimaryColor
			end,
			uipadding {
				PaddingVertical = UDim.new(0.1, 0),
				PaddingLeft = UDim.new(0.05, 0),
			},
			MouseButton1Click = function()
				minimized(not minimized())
			end,
		},

		-- Exit button
		textbutton {
			Name = "Exit",
			Size = UDim2.new(0.1, 0, 1, 0),
			Position = UDim2.new(0.89932, 0, 0, 0),
			BackgroundTransparency = 1,
			Text = "X",
			TextColor3 = function()
				return self.theme().TextPrimaryColor
			end,
			uipadding {
				PaddingVertical = UDim.new(0.1, 0),
				PaddingLeft = UDim.new(0.05, 0),
			},
			MouseButton1Click = function()
				self:Destroy()
			end,
		},

		-- Horizontal bottom line of topbar
		frame {
			Name = "Line",
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 0.99327, 0),
			BackgroundColor3 = function()
				return self.theme().SeparatorColor or Color3.fromRGB(204, 204, 204)
			end,
			Visible = function()
				return not minimized()
			end,
		},
	}

	-- Tab Buttons Container in Sidebar
	local tabButtonHolder = frame {
		Name = "Holder",
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		uipadding {
			PaddingTop = UDim.new(0.05, 0),
		},
		vide.create "UIListLayout" {
			SortOrder = Enum.SortOrder.LayoutOrder,
		},
	}

	-- Sidebar
	local sidebar = frame {
		Name = "Sidebar",
		Size = UDim2.new(0.2619, 0, 0.88598, 0),
		Position = UDim2.new(0.13061, 0, 0.55701, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = function()
			return self.theme().SidebarBackground
		end,
		Visible = function()
			return not minimized()
		end,
		vide.create "UICorner" {
			CornerRadius = UDim.new(0.08, 0),
		},

		-- Square hide patches so only bottom-left corner is rounded
		frame {
			Name = "Hide",
			Size = UDim2.new(0.2, 0, 0.2, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundColor3 = function()
				return self.theme().SidebarBackground
			end,
		},
		frame {
			Name = "Hide",
			Size = UDim2.new(0.2, 0, 0.2, 0),
			Position = UDim2.new(0.8, 0, 0.00271, 0),
			BackgroundColor3 = function()
				return self.theme().SidebarBackground
			end,
		},
		frame {
			Name = "Hide",
			Size = UDim2.new(0.2, 0, 0.2, 0),
			Position = UDim2.new(0.9974, 0, 0.99851, 0),
			AnchorPoint = Vector2.new(1, 1),
			BackgroundColor3 = function()
				return self.theme().SidebarBackground
			end,
		},

		tabButtonHolder,
	}

	-- Tab Pages Container
	local tabContainer = frame {
		Name = "TabHolder",
		Size = UDim2.new(0.69686, 0, 0.79967, 0),
		Position = UDim2.new(0.63331, 0, 0.57126, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Visible = function()
			return not minimized()
		end,
	}

	-- Main Window Frame
	local mainFrame = frame {
		Name = "Main",
		Size = function()
			return if minimized() then minSize else defaultSize
		end,
		Position = props.Position or UDim2.new(0.3, 0, 0.3, 0),
		AnchorPoint = props.AnchorPoint or Vector2.zero,
		BackgroundColor3 = function()
			return self.theme().WindowBackground or self.theme().FrameBackground
		end,
		ClipsDescendants = true,
		vide.create "UICorner" {
			CornerRadius = UDim.new(0.03, 0),
		},

		topbar,
		sidebar,
		tabContainer,
	}

	makeDraggable(topbar, mainFrame)

	self.mainFrame = mainFrame
	self.topbar = topbar
	self.sidebar = sidebar
	self.tabButtonHolder = tabButtonHolder
	self.tabContainer = tabContainer

	local guiParent = (RunService:IsStudio() and Players.LocalPlayer and Players.LocalPlayer:WaitForChild("PlayerGui"))
		or game:GetService("CoreGui")

	self.screenGui = vide.create "ScreenGui" {
		Name = "BeanzUI",
		ResetOnSpawn = false,
		IgnoreGuiInset = false,
		mainFrame,
	}

	self.destroyRoot = vide.mount(function()
		return self.screenGui
	end, guiParent)

	return self
end

function Window:CreateTab(props)
	const newTab = tab.new(self, props)
	table.insert(self.tabs, newTab)
	return newTab
end

function Window:Destroy()
	if self.ondestroyed then
		self.ondestroyed()
	end
	self.screenGui:Destroy()
	self.destroyRoot()
end

return Window