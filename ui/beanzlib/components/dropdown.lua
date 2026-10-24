const TweenService = game:GetService("TweenService")
const vide = require("../../vide")
const textlabel = require("../primitives/textlabel")
const textbutton = require("../primitives/textbutton")
const imagelabel = require("../primitives/imagelabel")
const scrollingframe = require("../primitives/scrollingframe")
const uipadding = require("../primitives/uipadding")
const uistroke = require("../primitives/uistroke")
const BaseElement = require("./base")

local defaultTweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local function tween(object: Instance, goal: { [string]: any }, info: TweenInfo?, callback: (() -> ())?)
	local tw = TweenService:Create(object, info or defaultTweenInfo, goal)
	if callback then
		tw.Completed:Once(callback)
	end
	tw:Play()
	return tw
end

return function(parent: Instance, options, window)
	options = options or {}
	local theme = window.Theme

	const selectedText = vide.source("")

	local dropdownclosedsize = UDim2.fromScale(0.9, 0.09326)
	local dropdownclosedtextsize = UDim2.fromScale(1, 0.4)
	local dropdownclosedtextposition = UDim2.fromScale(0.5, 0.3)
	local arrowclosedsize = UDim2.fromScale(0.07881, 1.18696)
	local arrowclosedposition = UDim2.fromScale(0.87213, -0.3)

	local dropdownopensize = UDim2.fromScale(0.9, 0.2376)
	local dropdownopentextsize = UDim2.fromScale(1, 0.18954)
	local dropdownopentextposition = UDim2.fromScale(0.5, 0.15762)
	local arrowopensize = UDim2.fromScale(0.07635, 0.18778)
	local arrowopenposition = UDim2.fromScale(0.87516, 0.05838)

	local isAnimating = false
	local dropdownBtn: any

	local Dropdown = BaseElement.new(options, "Dropdown")
	Dropdown.Closed = true
	Dropdown.Selected = nil
	Dropdown.Options = {}
	Dropdown.Window = window

	const optionsContainer = scrollingframe {
		Name = "Options",
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		ScrollingDirection = Enum.ScrollingDirection.Y,
		Size = UDim2.new(0.95, 0, 0.7, 0),
		Position = UDim2.new(0.5, 0, 0.6005, 0),
		Visible = false,
		Children = {
			vide.create "UIListLayout" {
				Padding = UDim.new(0.05, 0),
				SortOrder = Enum.SortOrder.LayoutOrder,
			},
			uipadding {
				PaddingTop = UDim.new(0.1, 0),
			},
		},
	}

	const titleLabel = textlabel {
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
		AnchorPoint = Vector2.new(0.5, 0.5),
		Text = options.Name or options.Text or "Dropdown",
		Size = dropdownclosedtextsize,
		Position = dropdownclosedtextposition,
		Children = {
			uipadding {
				PaddingLeft = UDim.new(0.05, 0),
			},
		},
	}

	const iconLabel = imagelabel {
		Name = "Icon",
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ScaleType = Enum.ScaleType.Fit,
		Image = "rbxassetid://107003984522008",
		Rotation = 90,
		Size = arrowclosedsize,
		Position = arrowclosedposition,
	}

	const textBoxLabel = textlabel {
		Name = "TextBox",
		TextWrapped = true,
		BorderSizePixel = 0,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextScaled = true,
		BackgroundColor3 = Color3.fromRGB(186, 186, 186),
		TextColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0.90372, 0, 0.37501, 0),
		Position = UDim2.new(0.05, 0, 0.55, 0),
		Text = function()
			return selectedText()
		end,
		Visible = true,
		Active = false,
		Children = {
			vide.create "UICorner" {},
			uipadding {
				PaddingLeft = UDim.new(0.05, 0),
			},
			uistroke {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = Color3.fromRGB(255, 255, 255),
			},
		},
	}

	local function toggleDropdown()
		if isAnimating then return end
		isAnimating = true

		if not Dropdown.Closed then
			-- TWEEN TO CLOSE
			optionsContainer.Visible = false
			textBoxLabel.Visible = true

			tween(dropdownBtn, { Size = dropdownclosedsize }, nil, function()
				Dropdown.Closed = true
				isAnimating = false
			end)
			tween(titleLabel, { Size = dropdownclosedtextsize, Position = dropdownclosedtextposition })
			tween(iconLabel, { Size = arrowclosedsize, Position = arrowclosedposition, Rotation = 90 })
		else
			-- TWEEN TO OPEN
			textBoxLabel.Visible = false

			tween(dropdownBtn, { Size = dropdownopensize }, nil, function()
				optionsContainer.Visible = true
				Dropdown.Closed = false
				isAnimating = false
			end)
			tween(titleLabel, { Size = dropdownopentextsize, Position = dropdownopentextposition })
			tween(iconLabel, { Size = arrowopensize, Position = arrowopenposition, Rotation = -90 })
		end
	end

	dropdownBtn = textbutton {
		Parent = parent,
		Name = "Dropdown",
		Text = "",
		AutoButtonColor = false,
		BorderSizePixel = 0,
		BackgroundColor3 = function()
			return options.Color or theme().ElementBackground
		end,
		ClipsDescendants = true,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = dropdownclosedsize,
		Position = UDim2.new(0, 0, 0.24976, 0),
		MouseButton1Click = toggleDropdown,
		Children = {
			vide.create "UICorner" {},
			titleLabel,
			iconLabel,
			uistroke {
				Color = function()
					return theme().ElementStroke
				end,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			},
			textBoxLabel,
			optionsContainer,
		},
	}

	function Dropdown:Select(buzzon)
		local targetInstance: Instance? = nil
		local targetObj = nil

		if typeof(buzzon) == "string" then
			for _, opt in Dropdown.Options do
				if opt.Name == buzzon or (opt.Instance and opt.Instance.Name == buzzon) then
					targetObj = opt
					targetInstance = opt.Instance
					break
				end
			end
		elseif typeof(buzzon) == "table" and buzzon.Instance then
			targetObj = buzzon
			targetInstance = buzzon.Instance
		elseif typeof(buzzon) == "Instance" then
			targetInstance = buzzon
			for _, opt in Dropdown.Options do
				if opt.Instance == buzzon then
					targetObj = opt
					break
				end
			end
		end

		if not targetInstance then return end

		for _, opt in Dropdown.Options do
			local stroke = opt.Instance:FindFirstChildOfClass("UIStroke")
			if stroke then
				stroke.Enabled = (opt.Instance == targetInstance)
			end
		end

		Dropdown.Selected = targetObj or targetInstance
		selectedText(targetInstance.Name)

		if targetObj and targetObj.Callback then
			targetObj.Callback(targetInstance.Name)
		end

		if not Dropdown.Closed then
			toggleDropdown()
		end
	end

	function Dropdown:Default(buzzon)
		Dropdown:Select(buzzon)
	end

	function Dropdown:GetOption(): string?
		if Dropdown.Selected then
			if typeof(Dropdown.Selected) == "table" and Dropdown.Selected.Instance then
				return Dropdown.Selected.Instance.Name
			elseif typeof(Dropdown.Selected) == "Instance" then
				return Dropdown.Selected.Name
			end
		end
		return nil
	end

	function Dropdown:GetValue(): string?
		return self:GetOption()
	end

	function Dropdown:SetValue(v: any)
		self:Select(v)
	end

	function Dropdown:Option(optOptions)
		optOptions = optOptions or {}
		const optName = optOptions.Name or "Option"

		local OptionObj = {}

		const optBtn = textbutton {
			Name = optName,
			Text = optName,
			TextWrapped = true,
			BorderSizePixel = 0,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextScaled = true,
			BackgroundColor3 = function()
				return theme().DropdownItem
			end,
			TextColor3 = function()
				return theme().TextPrimaryColor
			end,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0.9, 0, 0.24645, 0),
			Position = UDim2.new(0.5, 0, 0.12323, 0),
			MouseButton1Click = function()
				Dropdown:Select(OptionObj)
			end,
			Children = {
				vide.create "UICorner" {
					CornerRadius = UDim.new(1, 0),
				},
				uipadding {
					PaddingLeft = UDim.new(0.05, 0),
				},
				vide.create "UIStroke" {
					Enabled = false,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Thickness = 2,
					Color = function()
						return theme().AccentColor
					end,
				},
			},
		}

		optBtn.Parent = optionsContainer
		OptionObj.Instance = optBtn
		OptionObj.Name = optName
		OptionObj.Callback = optOptions.Callback

		function OptionObj:GetButton()
			return optBtn
		end
		function OptionObj:GetName()
			return optName
		end

		table.insert(Dropdown.Options, OptionObj)
		return OptionObj
	end

	Dropdown.Instance = dropdownBtn
	return Dropdown
end
