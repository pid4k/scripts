const Vide = require("../../vide")
const create = Vide.create

return function(props: UIPadding & { Padding: UDim?, PaddingHorizontal: UDim?, PaddingVertical: UDim?, Children: {any}? })
	const children = props.Children
	props.Children = nil
	const padding = props.Padding
	props.Padding = nil
	const paddingHorizontal = props.PaddingHorizontal
	props.PaddingHorizontal = nil
	const paddingVertical = props.PaddingVertical
	props.PaddingVertical = nil
	props.PaddingTop = props.PaddingTop or paddingVertical or padding
	props.PaddingBottom = props.PaddingBottom or paddingVertical or padding
	props.PaddingLeft = props.PaddingLeft or paddingHorizontal or padding
	props.PaddingRight = props.PaddingRight or paddingHorizontal or padding
	return create "UIPadding" {
		props,
		children,
	}
end