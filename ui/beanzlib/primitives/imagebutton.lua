const Vide = require("../../vide")
const create = Vide.create
return function(props : ImageButton)
	const children = props.children or {}
	props.children = nil
	return create "ImageButton" {
		props,
		children
	}
end