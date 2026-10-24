const Vide = require("../../vide")
const create = Vide.create

return function(props: UIStroke & { Children: {any}? })
	const children = props.Children
	props.Children = nil
	return create "UIStroke" {
		StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
		Thickness = .02,
		props,
		children,
	}
end