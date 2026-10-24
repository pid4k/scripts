const Vide = require("../../vide")
const create = Vide.create

return function(props: ScrollingFrame & { Children: {any}? })
	const children = props.Children
	props.Children = nil
	return create "ScrollingFrame" {
		props,
		children,
	}
end