const Vide = require("../../vide-0.4.1/vide")
const create = Vide.create
return function(props : Frame)
	const children = props.children or {}
	props.children = nil
	return create "Frame" {
		props,
		children
	}
end