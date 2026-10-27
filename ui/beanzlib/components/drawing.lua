const vide = require("../../vide")
const frame = require("../primitives/frame")
const uistroke = require("../primitives/uistroke")
const BaseElement = require("./base")

return function(screenGui, options)
	options = options or {}

	local sizeValue = options.Size or 200

	const Drawing = BaseElement.new(options, "Drawing")
	Drawing.Size = sizeValue

	const drawingFrame = frame {
		Parent = screenGui,
		Name = "Drawing",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = options.Position or UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(sizeValue, sizeValue),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = options.Visible == true,
		ZIndex = 5,
	}

	vide.create "UICorner" {
		Parent = drawingFrame,
		CornerRadius = UDim.new(1, 0),
	}
	vide.create "UIAspectRatioConstraint" {
		Parent = drawingFrame,
		AspectRatio = 1,
	}

	const stroke = uistroke {
		Parent = drawingFrame,
		Color = options.Color or Color3.fromRGB(255, 255, 255),
		Thickness = options.Thickness or 1,
		StrokeSizingMode = Enum.StrokeSizingMode.FixedSize,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	}

	function Drawing:SetSize(value: number)
		sizeValue = value
		Drawing.Size = value
		drawingFrame.Size = UDim2.fromOffset(value, value)
	end

	function Drawing:GetSize(): number
		return sizeValue
	end

	function Drawing:SetColor(color: Color3)
		stroke.Color = color
	end

	function Drawing:SetThickness(value: number)
		stroke.Thickness = value
	end

	function Drawing:SetPosition(position: UDim2)
		drawingFrame.Position = position
	end

	function Drawing:GetPosition(): UDim2
		return drawingFrame.Position
	end

	Drawing.Instance = drawingFrame
	return Drawing
end
