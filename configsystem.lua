-- Configuration System
tick = function() return 0 end
local ConfigSystem = {}
function ConfigSystem:new(filename, template)
	local config = {}
	config.FileName = filename

	-- Save configuration table
	function config:SaveConfig(configTable)
		if not isfile then return end
		local json = game:GetService("HttpService"):JSONEncode(configTable)
		writefile(self.FileName, json)
	end

	-- Load config
	function config:LoadConfig()
		if not isfile then return end
		if not isfile(self.FileName) then
			return nil
		end
		local json = readfile(self.FileName)
		return game:GetService("HttpService"):JSONDecode(json)
	end

	function config:AppendConfig(newData)
		if not isfile then return end
		local existingConfig = self:LoadConfig() or {}
		for key, value in pairs(newData) do
			existingConfig[key] = value
		end
		self:SaveConfig(existingConfig)
	end

	-- template
	local defaultconfig = template or {}
	config.loadedConfig = nil
	config.loadedConfig = config:LoadConfig()
	if config.loadedConfig then
		for i,v in pairs(config.loadedConfig) do
			defaultconfig[i] = v
		end
	else
		config:SaveConfig(defaultconfig)
		config.loadedConfig = config:LoadConfig()
	end
	return config
end
return ConfigSystem
