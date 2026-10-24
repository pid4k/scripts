const UIStroke = require("./uistroke")
const Vide = require("../../vide")
const TextButton = require("./textbutton")
const create = Vide.create

return function(props: TextLabel & { Bold: boolean?, Children: {any}? })
	const bold = props.Bold
	props.Bold = nil
	const children = props.Children
	props.Children = nil
	return TextButton {
		Bold = true,
		props,
		Children = {
			children,
			UIStroke {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
			},
		},
	}
end