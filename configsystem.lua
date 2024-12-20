-- Configuration System
local ConfigSystem = {}
function ConfigSystem:new(filename)
	local config = {}
	config.FileName = filename
	
	-- Save configuration table to a file
	function config:SaveConfig(configTable)
		if not isfile then return end
		local json = game:GetService("HttpService"):JSONEncode(configTable)
		writefile(self.FileName, json)
	end

	-- Load configuration table from a file
	function config:LoadConfig()
		if not isfile then return end
		if not isfile(self.FileName) then
			return nil -- Return nil if the file doesn't exist
		end
		local json = readfile(self.FileName)
		return game:GetService("HttpService"):JSONDecode(json)
	end

	-- Append data to the configuration file (for specific use cases)
	function config:AppendConfig(newData)
		if not isfile then return end
		local existingConfig = self:LoadConfig() or {}
		for key, value in pairs(newData) do
			existingConfig[key] = value
		end
		self:SaveConfig(existingConfig)
	end

	-- Example usage:
	local defaultconfig = {
		crimeautofarmingstarted = false,
		serverhop = false,
		OwnsSilver = "",
		OwnsGold = "",
	}

	-- Save configuration

	-- Load configuration
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
