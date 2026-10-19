local old_req = require
local module_cache = {}
local dir_stack = {}

local function resolvePath(target, currentDir)
	local parts = {}
	if string.sub(target, 1, 1) == "." and currentDir and currentDir ~= "" then
		for part in string.gmatch(currentDir, "[^/\\]+") do
			table.insert(parts, part)
		end
	end

	for part in string.gmatch(target, "[^/\\]+") do
		if part == "." then
			-- stay in current directory
		elseif part == ".." then
			if #parts > 0 then
				table.remove(parts)
			end
		else
			table.insert(parts, part)
		end
	end

	local resolved = table.concat(parts, "/")
	if not string.match(resolved, "%.luau?$") then
		resolved = resolved .. ".lua"
	end
	return resolved
end

local function getDirectory(filePath)
	local dir = string.match(filePath, "^(.*)[/\\][^/\\]+$")
	return dir or ""
end
local opts = {
        RootUrl = "https://raw.githubusercontent.com/pid4k/scripts/main/"
    }
local function urlRequire(target,url)
	-- If target is not a string (e.g. game instances), pass directly to original require
	if typeof(target) ~= "string" then
		return old_req(target)
	end

	local currentDir = dir_stack[#dir_stack]
	local cleanPath = resolvePath(target, currentDir)

	-- Return cached module if already loaded
	if module_cache[cleanPath] then
		return module_cache[cleanPath]
	end
	if module_cache[target] then
		return module_cache[target]
	end

	local PROD = workspace ~= nil
	if PROD then
		local REPO_URL = url or opts.Url
		local fullUrl = REPO_URL .. cleanPath

		local fetchOk, source = pcall(function()
			return game:HttpGet(fullUrl)
		end)

		if not fetchOk or not source then
			error(string.format("[urlrequire] Failed to fetch '%s' from %s: %s", cleanPath, fullUrl, tostring(source)), 0)
		end

		local fn, compileErr = loadstring(source, "=" .. cleanPath)
		if not fn then
			fn, compileErr = loadstring(source)
		end
		if not fn then
			error(string.format("[urlrequire] Failed to compile '%s' (%s): %s\nFirst 100 chars: %s", cleanPath, fullUrl, tostring(compileErr), string.sub(source, 1, 100)), 0)
		end

		table.insert(dir_stack, getDirectory(cleanPath))
		local ok, result = pcall(fn)
		table.remove(dir_stack)

		if not ok then
			error(string.format("[urlrequire] Error running '%s': %s", cleanPath, tostring(result)), 0)
		end

		module_cache[cleanPath] = result
		module_cache[target] = result
		return result
	end

	local result = old_req(target)
	module_cache[cleanPath] = result
	module_cache[target] = result
	return result
end

return setmetatable(opts, {
    __call = function(self, target,url)
        return urlRequire(target,url)
    end
})