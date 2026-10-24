const vide = require("../../vide")
const frame = require("../primitives/frame")
const textlabel = require("../primitives/textlabel")
const textbutton = require("../primitives/textbutton")
const uipadding = require("../primitives/uipadding")
const uistroke = require("../primitives/uistroke")
const BaseElement = require("./base")
const makeDraggable = require("../../utils/draggable")
return function(parent: Instance, screenGui: Instance, options, window)
	options = options or {}
	local theme = window.Theme

	const isMovingSource = vide.source(false)
	const visibleSource = vide.source(options.Visible ~= false)
	local dragCleanup: (() -> ())? = nil

	-- Floating button created in the ScreenGui root
	const mobileLock = textbutton {
		Parent = screenGui,
		Name = "MobileLock",
		TextWrapped = true,
		BorderSizePixel = 0,
		TextSize = 14,
		TextColor3 = Color3.fromRGB(0, 0, 0),
		TextScaled = true,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		Size = UDim2.new(0.05, 0, 0.08961, 0),
		Position = UDim2.new(0.66912, 0, 0.67579, 0),
		Text = options.Text or "Lock",
		Visible = function()
			return visibleSource()
		end,
		Children = {
			vide.create "UICorner" {
				CornerRadius = UDim.new(1, 0),
			},
			vide.create "UIAspectRatioConstraint" {
				AspectRatio = 0.99777,
			},
		},
	}

	-- Control row in the Tab
	const controlFrame = frame {
		Parent = parent,
		Name = "ButtonBind",
		BorderSizePixel = 0,
		BackgroundColor3 = function()
			return options.Color or theme().ElementBackground
		end,
		Size = UDim2.new(0.9, 0, 0.07, 0),
		Position = UDim2.new(0, 0, 0.51186, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Children = {
			vide.create "UICorner" {},

			textlabel {
				Name = "Title",
				TextWrapped = true,
				BorderSizePixel = 0,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextScaled = true,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextColor3 = function()
					return theme().TextPrimaryColor
				end,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0.45282, 0),
				Position = UDim2.new(0, 0, 0.26446, 0),
				Text = options.Name or "CustomBind",
				Children = {
					uipadding {
						PaddingLeft = UDim.new(0.05, 0),
					},
				},
			},

			uistroke {
				Color = function()
					return theme().ElementStroke
				end,
			},

			textbutton {
				Name = "TextBox",
				TextWrapped = true,
				BorderSizePixel = 0,
				TextScaled = true,
				Size = UDim2.new(0.17467, 0, 0.71728, 0),
				Position = UDim2.new(0.80257, 0, 0.13354, 0),
				Text = "Move",
				TextColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundColor3 = function()
					return if isMovingSource() then Color3.fromRGB(0, 0, 127) else Color3.fromRGB(0, 0, 255)
				end,
				MouseButton1Click = function()
					if not isMovingSource() then
						isMovingSource(true)
						mobileLock.Position = UDim2.new(0.66912, 0, 0.67579, 0)
						if dragCleanup then
							dragCleanup()
						end
						dragCleanup = makeDraggable(mobileLock, mobileLock)
					else
						isMovingSource(false)
						if dragCleanup then
							dragCleanup()
							dragCleanup = nil
						end
					end
				end,
				Children = {
					uistroke {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						Color = Color3.fromRGB(255, 255, 255),
					},
					vide.create "UICorner" {},
					uipadding {
						PaddingLeft = UDim.new(0.05, 0),
					},
				},
			},
		},
	}

	local BindButton = BaseElement.new(options, "BindButton")
	BindButton.Save = if options.Save ~= nil then options.Save == true else false
	BindButton.Instance = controlFrame
	BindButton.Button = mobileLock
	BindButton.Window = window

	function BindButton:GetButton(): GuiObject
		return mobileLock
	end

	function BindButton:ToggleVisible(v: boolean?)
		if v ~= nil then
			visibleSource(v)
		else
			visibleSource(not visibleSource())
		end
	end

	function BindButton:SetDraggable(enabled: boolean)
		if enabled then
			isMovingSource(true)
			if dragCleanup then
				dragCleanup()
			end
			dragCleanup = makeDraggable(mobileLock, mobileLock)
		else
			isMovingSource(false)
			if dragCleanup then
				dragCleanup()
				dragCleanup = nil
			end
		end
	end

	if options.Draggable == true then
		dragCleanup = makeDraggable(mobileLock, mobileLock)
	end

	return BindButton
end
