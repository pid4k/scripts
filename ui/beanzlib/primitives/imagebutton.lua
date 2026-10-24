const Vide = require("../../vide")
const create = Vide.create

return function(props: ImageButton & { Children: {any}? })
	const children = props.Children
	props.Children = nil
	return create "ImageButton" {
		props,
		children,
	}
end