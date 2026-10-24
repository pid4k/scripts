const Vide = require("../../vide")
const create = Vide.create

return function(props: ImageLabel & { Children: {any}? })
	const children = props.Children
	props.Children = nil
	return create "ImageLabel" {
		BackgroundTransparency = 1,
		ScaleType = Enum.ScaleType.Fit,
		props,
		children,
	}
end