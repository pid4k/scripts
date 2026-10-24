const vide = require("../../vide")
const frame = require("../primitives/frame")
const textlabel = require("../primitives/textlabel")
const uipadding = require("../primitives/uipadding")
const uistroke = require("../primitives/uistroke")
const BaseElement = require("./base")

type BannerType = "Warning" | "Info" | "Message"

local BANNER_CONFIG = {
	Warning = {
		Background = Color3.fromRGB(118, 103, 2),
		Stroke = Color3.fromRGB(198, 198, 0),
		MinTextSize = 14,
		MaxTextSize = 16,
	},
	Info = {
		Background = Color3.fromRGB(0, 88, 132),
		Stroke = Color3.fromRGB(0, 145, 217),
		MinTextSize = 10,
		MaxTextSize = 16,
	},
	Message = {
		Background = Color3.fromRGB(37, 37, 37),
		Stroke = Color3.fromRGB(154, 154, 154),
		MinTextSize = 10,
		MaxTextSize = 16,
	},
}

return function(parent: Instance, bannerType: BannerType, options)
	options = options or {}
	const config = BANNER_CONFIG[bannerType] or BANNER_CONFIG.Message

	const textSource = vide.source(options.Text or "")
	const visibleSource = vide.source(true)

	const bannerInstance = frame {
		Parent = parent,
		Name = bannerType,
		BorderSizePixel = 0,
		BackgroundColor3 = config.Background,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(0.9, 0, 0.05534, 0),
		Position = UDim2.new(0, 0, 0.08296, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Visible = function()
			return visibleSource()
		end,
		Children = {
			vide.create "UICorner" {},

			textlabel {
				Name = "Title",
				TextWrapped = true,
				BorderSizePixel = 0,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextScaled = true,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0.7, 0),
				Position = UDim2.new(0, 0, 0.13174, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = textSource,
				Children = {
					uipadding {
						PaddingLeft = UDim.new(0.05, 0),
						PaddingRight = UDim.new(0.05, 0),
					},
					vide.create "UITextSizeConstraint" {
						MaxTextSize = config.MaxTextSize,
						MinTextSize = config.MinTextSize,
					},
				},
			},

			uistroke {
				Color = config.Stroke,
			},
		},
	}

	local Banner = BaseElement.new(options, bannerType)
	Banner.Save = if options.Save ~= nil then options.Save == true else false
	Banner.Instance = bannerInstance

	function Banner:SetText(text: string)
		textSource(text)
	end

	function Banner:Toggle(b: boolean?)
		if b ~= nil then
			visibleSource(b)
		else
			visibleSource(not visibleSource())
		end
	end

	return Banner
end
