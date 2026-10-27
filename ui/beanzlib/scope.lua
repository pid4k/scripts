const vide = require("../vide")

return function(build)
	const destroy, result = vide.root(build)
	return destroy, result
end
