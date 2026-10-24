const vide = require("../../vide")
const frame = require("../primitives/frame")
const uistroke = require("../primitives/uistroke")
const BaseElement = require("./base")

return function(screenGui: Instance, options)
	options = options or {}

	const sizeVal = tonumber(options.Size) or 0.1
	const sizeSource = vide.source(UDim2.new(sizeVal, 0, sizeVal, 0))
	const posSource = vide.source(UDim2.new(0.5, 0, 0.5, 0))
	const colorSource = vide.source(options.Color or Color3.fromRGB(0, 0, 0))
	const visibleSource = vide.source(options.Visible == true)

	const drawFrame = frame {
		Parent = screenGui,
		Name = "zirkul",
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = function()
			return sizeSource()
		end,
		Position = function()
			return posSource()
		end,
		Visible = function()
			return visibleSource()
		end,
		Children = {
			vide.create "UICorner" {
				CornerRadius = UDim.new(1, 0),
			},
			uistroke {
				Color = function()
					return colorSource()
				end,
			},
			vide.create "UIAspectRatioConstraint" {},
		},
	}

	local Drawing = BaseElement.new(options, "Drawing")
	Drawing.Save = if options.Save ~= nil then options.Save == true else false
	Drawing.Instance = drawFrame

	function Drawing:ToggleVisible(v: boolean?)
		if v ~= nil then
			visibleSource(v)
		else
			visibleSource(not visibleSource())
		end
	end

	function Drawing:SetRadius(v: number)
		options.Size = v
		sizeSource(UDim2.new(v, 0, v, 0))
	end

	function Drawing:SetColor(v: Color3)
		options.Color = v
		colorSource(v)
	end

	function Drawing:GetPosition(): Vector2
		return drawFrame.AbsolutePosition
	end

	function Drawing:SetPosition(v: UDim2)
		posSource(v)
	end

	function Drawing:GetRadius(): number
		return drawFrame.AbsoluteSize.X
	end

	return Drawing
end
