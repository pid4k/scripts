const Vide = require("../../vide-0.4.1/vide")
const create = Vide.create
return function(props : ImageLabel)
	const children = props.children or {}
	props.children = nil
	return create "ImageLabel" {
		BackgroundTransparency = 1,
		ScaleType = Enum.ScaleType.Fit,
		props,
		children
	}
end