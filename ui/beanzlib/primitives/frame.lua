const Vide = require("../../vide")
const create = Vide.create

return function(props: Frame & { Children: {any}? })
	const children = props.Children
	props.Children = nil
	return create "Frame" {
		props,
		children,
	}
end