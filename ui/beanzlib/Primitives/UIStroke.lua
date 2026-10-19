const Vide = require("../../vide-0.4.1/vide")
const create = Vide.create
return function(props : UIStroke)
	const children = props.children or {}
	props.children = nil
	return create "UIStroke" {
		StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
		Thickness = .02,
		props,
		children
	}
end