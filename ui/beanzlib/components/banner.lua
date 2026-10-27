const vide = require("../../vide")
const scope = require("../scope")
const frame = require("../primitives/frame")
const textlabel = require("../primitives/textlabel")
const uipadding = require("../primitives/uipadding")
const uistroke = require("../primitives/uistroke")
const BaseElement = require("./base")

const BANNER_CONFIG = {
	Warning = {
		Background = Color3.fromRGB(118, 103, 2),
		Stroke = Color3.fromRGB(198, 198, 0),
	},
	Info = {
		Background = Color3.fromRGB(0, 88, 132),
		Stroke = Color3.fromRGB(0, 145, 217),
	},
	Message = {
		Background = Color3.fromRGB(37, 37, 37),
		Stroke = Color3.fromRGB(154, 154, 154),
	},
}

return function(parent, bannerType, options, window)
	options = options or {}

	const config = BANNER_CONFIG[bannerType]
	const Banner = BaseElement.new(options, bannerType)
	Banner.Save = options.Save == true
	Banner.Window = window

	const destroyScope, ui = scope(function()
		const bannerFrame = frame {
			Parent = parent,
			Name = bannerType,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = config.Background,
			BorderSizePixel = 0,
			Visible = options.Visible ~= false,
			ZIndex = 1,
		}

		vide.create "UICorner" {
			Parent = bannerFrame,
			CornerRadius = UDim.new(0, 6),
		}
		uistroke {
			Parent = bannerFrame,
			Color = config.Stroke,
			Thickness = 1,
			StrokeSizingMode = Enum.StrokeSizingMode.FixedSize,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		}

		uipadding {
			Parent = bannerFrame,
			PaddingTop = UDim.new(0, 8),
			PaddingBottom = UDim.new(0, 8),
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
		}

		const label = textlabel {
			Parent = bannerFrame,
			BackgroundTransparency = 1,
			Name = "Title",
			Text = options.Text or "",
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			TextWrapped = true,
			TextSize = 13,
			TextScaled = false,
			FontFace = function()
				return window:GetTheme().MainFont
			end,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			ZIndex = 2,
		}

		return {
			Frame = bannerFrame,
			Label = label,
		}
	end)

	Banner:AddCleanup(destroyScope)

	Banner.Label = ui.Label
	Banner.Instance = ui.Frame
	return Banner
end
