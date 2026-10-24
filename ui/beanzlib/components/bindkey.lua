const vide = require("../../vide")
const frame = require("../primitives/frame")
const textlabel = require("../primitives/textlabel")
const textbutton = require("../primitives/textbutton")
const uipadding = require("../primitives/uipadding")
const uistroke = require("../primitives/uistroke")
const BaseElement = require("./base")

const UserInputService = game:GetService("UserInputService")

return function(parent: Instance, options, window)
	options = options or {}
	local theme = window.Theme

	const bindSource = vide.source(options.Bind or "")
	const isKeySource = vide.source(options.Bind and #options.Bind == 1 or false)
	local isFocused = false

	local KeyBind = BaseElement.new(options, "KeyBind")
	KeyBind.Bind = options.Bind
	KeyBind.IsKey = isKeySource()
	KeyBind.UseProc = false
	KeyBind.Callback = nil
	KeyBind.Window = window

	function KeyBind:SetCallback(fnc: () -> (), proc: boolean?)
		KeyBind.UseProc = proc == true
		KeyBind.Callback = fnc
	end

	function KeyBind:GetBind(): string?
		return KeyBind.Bind
	end

	function KeyBind:GetValue(): string?
		return self:GetBind()
	end

	function KeyBind:SetValue(v: string)
		KeyBind.Bind = tostring(v)
		KeyBind.IsKey = #tostring(v) == 1
		bindSource(tostring(v))
		isKeySource(KeyBind.IsKey)
		if KeyBind.Callback then
			KeyBind.Callback(tostring(v))
		end
	end

	const bindContainer = frame {
		Parent = parent,
		Name = options.Name or "Keybind",
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
				Text = options.Name or "Keybind",
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
				BackgroundColor3 = Color3.fromRGB(185, 185, 185),
				TextColor3 = Color3.fromRGB(0, 0, 0),
				Size = UDim2.new(0.17467, 0, 0.71728, 0),
				Position = UDim2.new(0.80257, 0, 0.13354, 0),
				Text = function()
					const b = bindSource()
					return if b and #b > 0 then b else (options.Placeholder or "Bind")
				end,
				MouseButton1Click = function()
					isFocused = true
					bindSource("...")
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

	UserInputService.InputBegan:Connect(function(input, proc)
		if isFocused then
			if input.UserInputType == Enum.UserInputType.Keyboard then
				if input.KeyCode ~= Enum.KeyCode.Escape then
					const keyName = input.KeyCode.Name
					bindSource(keyName)
					KeyBind.Bind = keyName
					KeyBind.IsKey = true
				else
					bindSource(KeyBind.Bind or "")
				end
			elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
				bindSource("LMB")
				KeyBind.Bind = "MouseButton1"
				KeyBind.IsKey = false
			elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
				bindSource("RMB")
				KeyBind.Bind = "MouseButton2"
				KeyBind.IsKey = false
			elseif input.UserInputType == Enum.UserInputType.MouseButton3 then
				bindSource("MMB")
				KeyBind.Bind = "MouseButton3"
				KeyBind.IsKey = false
			end
			isFocused = false
		else
			if proc and not KeyBind.UseProc then return end
			if not KeyBind.Bind then return end

			if KeyBind.IsKey then
				if input.KeyCode.Name == KeyBind.Bind then
					if KeyBind.Callback then
						KeyBind.Callback()
					end
				end
			else
				if input.UserInputType.Name == KeyBind.Bind then
					if KeyBind.Callback then
						KeyBind.Callback()
					end
				end
			end
		end
	end)

	KeyBind.Instance = bindContainer
	return KeyBind
end
