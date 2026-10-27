const tween = require("./ripple/tween")
const spring = require("./ripple/spring")
const config = require("./ripple/config")

const DEFAULT_TWEEN = {
	duration = 0.18,
	easing = "quadOut",
}

const Animation = {
	createTween = tween.createTween,
	createSpring = spring.createSpring,
	config = config,
}

local function resolveOptions(options)
	if options == nil then
		return table.clone(DEFAULT_TWEEN)
	end

	const resolved = table.clone(DEFAULT_TWEEN)
	for key, value in options do
		resolved[key] = value
	end
	return resolved
end

function Animation.Tween(object, goal, options, callback)
	const resolvedOptions = resolveOptions(options)
	const tweens = {}
	const disconnects = {}
	local remaining = 0
	local finished = false
	local stopped = false

	local function release()
		for _, disconnect in disconnects do
			disconnect()
		end
		table.clear(disconnects)

		for _, item in tweens do
			item:destroy()
		end
		table.clear(tweens)
	end

	local function complete()
		if finished or stopped then
			return
		end
		finished = true
		release()
		if callback then
			callback()
		end
	end

	for property, target in goal do
		const current = object[property]
		if current == target then
			continue
		end

		const item = Animation.createTween(current, resolvedOptions)
		table.insert(tweens, item)
		remaining += 1

		table.insert(disconnects, item:onChange(function(value)
			object[property] = value
		end))
		item:onComplete(function()
			remaining -= 1
			if remaining == 0 then
				complete()
			end
		end)

		item:setGoal(target)
	end

	if remaining == 0 then
		finished = true
		if callback then
			callback()
		end
		return function() end
	end

	for _, item in tweens do
		item:start()
	end

	return function()
		if finished or stopped then
			return
		end
		stopped = true
		release()
	end
end

return Animation
