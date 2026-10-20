const Vide = require("../../vide-0.4.1/vide")
const create = Vide.create
return function(props : ImageButton)
	const children = props.children or {}
	props.children = nil
	return create "ImageButton" {
		props,
		children
	}
end