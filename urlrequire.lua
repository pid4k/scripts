local old_req = require
local module_cache = {}
return function(target)
	-- If target is not a string (e.g. game instances), pass directly to original require
	if typeof(target) ~= "string" then
		return old_req(target)
	end

	-- Return cached module if already loaded
	if module_cache[target] then
		return module_cache[target]
	end

	local PROD = workspace ~= nil
	if PROD then
		local REPO_URL = "https://raw.githubusercontent.com/pid4k/scripts/main/"
		-- Remove leading ./ or ../ while preserving any nested path
		local cleanPath = string.gsub(target, "^%.+/", "")
		-- Ensure .lua extension is present for GitHub raw fetch
		if not string.match(cleanPath, "%.luau?$") then
			cleanPath = cleanPath .. ".lua"
		end

		local result = loadstring(game:HttpGet(REPO_URL .. cleanPath))()
		module_cache[target] = result
		return result
	end

	local result = old_req(target)
	module_cache[target] = result
	return result
end
