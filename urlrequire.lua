local old_req = require
local module_cache = {}
local source_cache = {}
local in_flight = {}
local thread_stacks = setmetatable({}, { __mode = "k" })
local cached_tree = nil
local Signal = getgenv() and loadstring(game:HttpGet("https://gist.githubusercontent.com/stravant/b75a322e0919d60dde8a0316d1f09d2f/raw/f6a8900676185457211ec25d22d681c20ee792cb/GoodSignal.lua"))()

local function getDirectory(filePath)
	local dir = string.match(filePath, "^(.*)[/\\][^/\\]+$")
	return dir or ""
end

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

local function getCurrentDir()
	-- 1. Try inspecting call stack for caller chunk name
	for level = 3, 10 do
		local source = debug.info(level, "s")
		if source and source ~= "" and source ~= "[C]" and source ~= "?" and source ~= "[string \"\"]" then
			if string.sub(source, 1, 1) == "=" then
				source = string.sub(source, 2)
			end
			local dir = getDirectory(source)
			if dir and dir ~= "" then
				return dir
			end
		end
	end
	-- 2. Fallback to coroutine-specific stack
	local thread = coroutine.running()
	local s = thread_stacks[thread]
	return s and s[#s] or nil
end

local opts = {
	RootUrl = "https://raw.githubusercontent.com/pid4k/scripts/main/"
}

local function getRepoTree(rootUrl)
	if cached_tree then
		return cached_tree
	end

	local owner, repo, branch = string.match(rootUrl, "raw%.githubusercontent%.com/([^/]+)/([^/]+)/refs/heads/([^/]+)")
	if not owner then
		owner, repo, branch = string.match(rootUrl, "raw%.githubusercontent%.com/([^/]+)/([^/]+)/([^/]+)")
	end

	if not owner or not repo then
		return nil
	end
	branch = branch or "main"

	local treeUrl = string.format("https://api.github.com/repos/%s/%s/git/trees/%s?recursive=1", owner, repo, branch)
		local res = request({
			Url = treeUrl,
			Method = "GET",
			Headers = {
				["User-Agent"] = "Roblox",
				["Accept"] = "application/vnd.github+json",
				["Authorization"] = "Bearer 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",
			}
		})
		const body = res.Body
		local HttpService = game:GetService("HttpService")
		const data = HttpService:JSONDecode(body)
		cached_tree = data
		return cached_tree
end

local function pathMatchesFolder(nodePath, folder)
	folder = string.gsub(folder, "[/\\]+$", "")
	if nodePath == folder or string.sub(nodePath, 1, #folder + 1) == folder .. "/" then
		return true
	end
	local uiFolder = "ui/" .. folder
	if nodePath == uiFolder or string.sub(nodePath, 1, #uiFolder + 1) == uiFolder .. "/" then
		return true
	end
	local withoutUi = string.gsub(folder, "^ui/", "")
	if nodePath == withoutUi or string.sub(nodePath, 1, #withoutUi + 1) == withoutUi .. "/" then
		return true
	end
	return false
end

local function preloadFolder(folderPath, customTree, customUrl)
	local REPO_URL = customUrl or opts.RootUrl
	if string.sub(REPO_URL, -1) ~= "/" then
		REPO_URL = REPO_URL .. "/"
	end

	local tree = (typeof(customTree) == "table" and (customTree.tree or customTree)) or getRepoTree(REPO_URL)
	if not tree then
		return false, "Could not fetch repository tree"
	end

	local spawnFn = (task and task.spawn) or spawn
	local waitFn = (task and task.wait) or wait
	local pending = 0

	for _, node in ipairs(tree) do
		if node.type == "blob" and pathMatchesFolder(node.path, folderPath) then
			if string.match(node.path, "%.luau?$") then
				local cleanNodePath = string.gsub(node.path, "^/+", "")
				if not source_cache[cleanNodePath] then
					pending = pending + 1
					spawnFn(function()
						local fullUrl = REPO_URL .. cleanNodePath
						if string.match(REPO_URL, "/ui/?$") and string.sub(cleanNodePath, 1, 3) == "ui/" then
							fullUrl = REPO_URL .. string.sub(cleanNodePath, 4)
						end

						local content = game:HttpGet(fullUrl)

						if content and content ~= "404: Not Found" and not string.match(content, "^404:? Not Found") then
							source_cache[cleanNodePath] = content
							local withoutUi = string.gsub(cleanNodePath, "^ui/", "")
							source_cache[withoutUi] = content
							source_cache[string.gsub(cleanNodePath, "%.luau?$", "")] = content
							source_cache[string.gsub(withoutUi, "%.luau?$", "")] = content
						end

						pending = pending - 1
					end)
				end
			end
		end
	end

	while pending > 0 do
		waitFn()
	end

	return true
end

opts.preloadFolder = preloadFolder

local function urlRequire(target, url)
	if typeof(target) ~= "string" then
		return old_req(target)
	end

	local currentDir = getCurrentDir()
	local cleanPath = resolvePath(target, currentDir)

	if module_cache[cleanPath] then
		return module_cache[cleanPath]
	end
	if module_cache[target] then
		return module_cache[target]
	end

	while in_flight[cleanPath] do
		in_flight[cleanPath]:Wait()
		if module_cache[cleanPath] then
			return module_cache[cleanPath]
		end
	end

	if module_cache[cleanPath] then
		return module_cache[cleanPath]
	end

	local inFlightEvent = Signal and Signal.new()
	in_flight[cleanPath] = inFlightEvent

	local PROD = getgenv() ~= nil
	if PROD then
		local REPO_URL = url or opts.RootUrl
		if string.sub(REPO_URL, -1) ~= "/" then
			REPO_URL = REPO_URL .. "/"
		end
		local fullUrl = REPO_URL .. cleanPath

		local source = source_cache[cleanPath] or source_cache[target]
		if not source then
			const fetched = game:HttpGet(fullUrl)

			if not fetched then
				in_flight[cleanPath] = nil
				if inFlightEvent then
					inFlightEvent:Fire()
					inFlightEvent:DisconnectAll()
				end
				error(string.format("[urlrequire] Failed to fetch '%s' from %s: %s", cleanPath, fullUrl, tostring(fetched)), 0)
			end
			source = fetched
		end

		if source == "404: Not Found" or string.match(source, "^404:? Not Found") then
			in_flight[cleanPath] = nil
			if inFlightEvent then
				inFlightEvent:Fire()
				inFlightEvent:DisconnectAll()
			end
			error(string.format("[urlrequire] 404 Not Found for '%s' (%s)", cleanPath, fullUrl), 0)
		end

		local fn, compileErr = loadstring(source, "=" .. cleanPath)
		if not fn then
			fn, compileErr = loadstring(source)
		end
		if not fn then
			in_flight[cleanPath] = nil
			if inFlightEvent then
				inFlightEvent:Fire()
				inFlightEvent:DisconnectAll()
			end
			error(string.format("[urlrequire] Failed to compile '%s' (%s): %s\nFirst 100 chars: %s", cleanPath, fullUrl, tostring(compileErr), string.sub(source, 1, 100)), 0)
		end

		local thread = coroutine.running()
		local stack = thread_stacks[thread]
		if not stack then
			stack = {}
			thread_stacks[thread] = stack
		end
		table.insert(stack, getDirectory(cleanPath))

		const result = fn()

		table.remove(stack)
		if #stack == 0 then
			thread_stacks[thread] = nil
		end

		in_flight[cleanPath] = nil
		if inFlightEvent then
			inFlightEvent:Fire()
			inFlightEvent:DisconnectAll()
		end

		module_cache[cleanPath] = result
		module_cache[target] = result
		source_cache[cleanPath] = source
		return result
	end

	in_flight[cleanPath] = nil
	if inFlightEvent then
		inFlightEvent:Fire()
		inFlightEvent:DisconnectAll()
	end

	local result = old_req(target)
	module_cache[cleanPath] = result
	module_cache[target] = result
	return result
end

return setmetatable(opts, {
	__call = function(self, target, url)
		return urlRequire(target, url)
	end
})