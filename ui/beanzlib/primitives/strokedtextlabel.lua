const UIStroke = require("./uistroke")
local TextLabel = require("./textlabel")

return function(props: TextLabel & { Bold: boolean?, Children: {any}? })
	const bold = props.Bold
	props.Bold = nil
	const children = props.Children
	props.Children = nil
	return TextLabel {
		BackgroundTransparency = 1,
		Bold = bold == nil or bold == true,
		props,
		Children = {
			children,
			UIStroke {},
		},
	}
end