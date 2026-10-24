const vide = require("../../vide")
const frame = require("../primitives/frame")
const textlabel = require("../primitives/textlabel")
const textbutton = require("../primitives/textbutton")
const uistroke = require("../primitives/uistroke")

return function(parent: Instance)
	const hiddenPos = UDim2.new(0.28899, 0, 1.1, 0)
	const activePos = UDim2.fromScale(0.289, 0.786)

	const targetPos = vide.source(hiddenPos)
	const currentPos = vide.spring(targetPos, 0.35, 0.8)

	const notifyText = vide.source("")
	local dismissThread: thread? = nil

	local function dismiss()
		targetPos(hiddenPos)
		if dismissThread then
			task.cancel(dismissThread)
			dismissThread = nil
		end
	end

	const notifyFrame = frame {
		Parent = parent,
		Name = "Notifyframe",
		ZIndex = 5,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0.4213, 0, 0.21207, 0),
		Position = function()
			return currentPos()
		end,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Children = {
			vide.create "UICorner" {
				CornerRadius = UDim.new(0.05, 0),
			},

			textlabel {
				Name = "TextLabel",
				TextWrapped = true,
				ZIndex = 5,
				BorderSizePixel = 0,
				TextScaled = true,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0.65123, 0),
				Position = UDim2.new(0, 0, 0.16429, 0),
				Text = function()
					return notifyText()
				end,
				Children = {
					vide.create "UITextSizeConstraint" {
						MaxTextSize = 35,
					},
				},
			},

			textbutton {
				Name = "CloseButton",
				TextWrapped = true,
				BorderSizePixel = 0,
				TextScaled = true,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				ZIndex = 5,
				Size = UDim2.new(0.08817, 0, 0.34885, 0),
				BackgroundTransparency = 1,
				Text = "X",
				Position = UDim2.new(0.91179, 0, -0.00002, 0),
				MouseButton1Click = dismiss,
			},

			uistroke {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = Color3.fromRGB(255, 255, 255),
			},
		},
	}

	return {
		Instance = notifyFrame,
		Notify = function(self, text: string)
			-- Support both Notifier:Notify(text) and Notifier.Notify(text)
			local msg = if text ~= nil then text else tostring(self)
			notifyText(tostring(msg))
			targetPos(activePos)

			if dismissThread then
				task.cancel(dismissThread)
			end
			dismissThread = task.delay(4, function()
				targetPos(hiddenPos)
				dismissThread = nil
			end)
		end,
		Dismiss = dismiss,
	}
end
