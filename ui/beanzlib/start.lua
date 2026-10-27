const Animation = require("./animation")
const Window = require("./components/window")
const Themes = require("../utils/themes/registry")

const beanz = {
	Themes = Themes,
}

function beanz.CreateWindow(options)
	return Window.new(options)
end

function beanz.Tween(object, goal, options, callback)
	return Animation.Tween(object, goal, options, callback)
end

return beanz
