const Vide = require("../../vide-0.4.1/vide")
const create = Vide.create
return function(props : ScrollingFrame)
	const children = props.children or {}
	props.children = nil
	return create "ScrollingFrame" {
		props,
		children
	}
end