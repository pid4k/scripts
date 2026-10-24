const hub = require("./BeanzHub")
const vide = require("./vide")

local story = {
	vide = vide,
	story = function(props)
		return hub
	end,
}

return story