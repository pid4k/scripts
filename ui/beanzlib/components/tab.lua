const vide = require("../../vide")
const textbutton = require("../primitives/textbutton")
const scrollingframe = require("../primitives/scrollingframe")
const uipadding = require("../primitives/uipadding")

const buttonComponent = require("./button")
const bannerComponent = require("./banner")
const sliderComponent = require("./slider")
const dropdownComponent = require("./dropdown")
const toggleComponent = require("./toggle")
const textboxComponent = require("./textbox")
const bindbuttonComponent = require("./bindbutton")
const bindkeyComponent = require("./bindkey")

const Tab = {}
Tab.__index = Tab

function Tab.new(window, props)
	props = props or {}
	const tabName = props.Name or "Tab"

	const isActiveSource = vide.source(false)
	const isHoverSource = vide.source(false)
	const textSource = vide.source(tabName)

	-- Tab content container inside window.TabContainer
	const contentFrame = scrollingframe {
		Parent = window.TabContainer,
		Name = tabName,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
		ScrollingDirection = Enum.ScrollingDirection.Y,
		Visible = function()
			return isActiveSource()
		end,
		Children = {
			vide.create "UIListLayout" {
				Padding = UDim.new(0.01, 0),
				SortOrder = if props.Alphabetical == true then Enum.SortOrder.Name else Enum.SortOrder.LayoutOrder,
			},
			uipadding {
				PaddingTop = UDim.new(0.01, 0),
				PaddingLeft = UDim.new(0.01, 0),
			},
		},
	}

	-- Tab button inside window.TabButtonHolder (sidebar)
	const tabBtn = textbutton {
		Parent = window.TabButtonHolder,
		Name = tabName,
		AutoButtonColor = false,
		BorderSizePixel = 0,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextScaled = true,
		Size = UDim2.new(1, 0, 0.1, 0),
		Position = UDim2.new(0, 0, 0.188, 0),
		Text = function()
			return textSource()
		end,
		TextColor3 = function()
			return if isActiveSource() or isHoverSource()
				then Color3.fromRGB(255, 255, 255)
				else Color3.fromRGB(200, 200, 200)
		end,
		BackgroundTransparency = function()
			return if isActiveSource() then 0.8 else 1
		end,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		MouseEnter = function()
			isHoverSource(true)
		end,
		MouseLeave = function()
			isHoverSource(false)
		end,
		Children = {
			uipadding {
				PaddingTop = UDim.new(0.05, 0),
				PaddingLeft = UDim.new(0.05, 0),
			},
		},
	}

	const self = setmetatable({
		Window = window,
		Name = tabName,
		Hover = false,
		Active = false,
		Instance = contentFrame,
		TabFrame = contentFrame,
		TabButton = tabBtn,
		ScrollingFrame = contentFrame,
		IsActiveSource = isActiveSource,
		IsHoverSource = isHoverSource,
		TextSource = textSource,
		Elements = {},
	}, Tab)

	tabBtn.MouseButton1Click:Connect(function()
		self:Activate()
		if window.Tabs then
			for _, otherTab in window.Tabs do
				if otherTab ~= self then
					otherTab:Deactivate()
				end
			end
		end
	end)

	return self
end

function Tab:RegisterElement(elem)
	elem.Tab = self
	elem.Window = self.Window
	table.insert(self.Elements, elem)
	if self.Window and self.Window.Elements and elem.Flag then
		self.Window.Elements[elem.Flag] = elem
	end
	return elem
end

function Tab:Activate()
	if not self.Active then
		self.Active = true
		self.IsActiveSource(true)
		self.Window.CurrentTab = self
	end
end

function Tab:Deactivate()
	if self.Active then
		self.Active = false
		self.IsActiveSource(false)
		self.Hover = false
		self.IsHoverSource(false)
	end
end

function Tab:SetText(text: string)
	self.Name = text
	self.TextSource(text)
	if self.TabButton then
		self.TabButton.Name = text
	end
	if self.ScrollingFrame then
		self.ScrollingFrame.Name = text
	end
end

function Tab:Button(buttonoptions)
	return self:RegisterElement(buttonComponent(self.ScrollingFrame, buttonoptions, self.Window))
end

function Tab:Warning(warningoptions)
	return self:RegisterElement(bannerComponent(self.ScrollingFrame, "Warning", warningoptions, self.Window))
end

function Tab:Info(infooptions)
	return self:RegisterElement(bannerComponent(self.ScrollingFrame, "Info", infooptions, self.Window))
end

function Tab:Message(messageoptions)
	return self:RegisterElement(bannerComponent(self.ScrollingFrame, "Message", messageoptions, self.Window))
end

function Tab:Slider(slideroptions)
	return self:RegisterElement(sliderComponent(self.ScrollingFrame, slideroptions, self.Window))
end

function Tab:Dropdown(dropdownoptions)
	return self:RegisterElement(dropdownComponent(self.ScrollingFrame, dropdownoptions, self.Window))
end

function Tab:Toggle(toggleoptions)
	return self:RegisterElement(toggleComponent(self.ScrollingFrame, toggleoptions, self.Window))
end

function Tab:TextBox(textboxoptions)
	return self:RegisterElement(textboxComponent(self.ScrollingFrame, textboxoptions, self.Window))
end

function Tab:BindButton(options)
	return self:RegisterElement(bindbuttonComponent(self.ScrollingFrame, self.Window.ScreenGui, options, self.Window))
end

function Tab:BindKey(options)
	return self:RegisterElement(bindkeyComponent(self.ScrollingFrame, options, self.Window))
end

function Tab:Export(): { [string]: any }
	local config = {}
	for _, element in self.Elements do
		if element.CanSave and element:CanSave() then
			local val = element:Export()
			if val ~= nil then
				config[element.Flag] = val
			end
		end
	end
	return config
end

function Tab:Import(config: { [string]: any })
	if not config then return end
	for _, element in self.Elements do
		if element.CanSave and element:CanSave() and config[element.Flag] ~= nil then
			element:Import(config[element.Flag])
		end
	end
end

function Tab:Destroy()
	if self.TabButton then
		self.TabButton:Destroy()
	end
	if self.ScrollingFrame then
		self.ScrollingFrame:Destroy()
	end
end

return Tab