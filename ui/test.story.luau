const start = require("./beanzlib/start")
const vide = require("./vide")

local story = {
	vide = vide,
	story = function(_props)
		local window = start.CreateWindow {
			Title = "BeanzUI Test",
			Size = UDim2.fromScale(0.5, 0.5),
		}

		vide.cleanup(function()
			window:Destroy()
		end)

		local tab1 = window:CreateTab {
			Name = "Elements",
		}

		tab1:Button {
			Text = "Click Me",
			Callback = function()
				window:Notify("Button was clicked!")
			end,
		}

		tab1:Toggle {
			Text = "Enable Feature",
			Default = true,
			Callback = function(value)
				window:Notify("Toggle is now: " .. tostring(value))
			end,
		}

		tab1:Slider {
			Text = "WalkSpeed",
			Min = 16,
			Max = 200,
			Default = 50,
			Decimals = 0,
			Callback = function(value)
				print("Slider value:", value)
			end,
		}

		local weaponDropdown = tab1:Dropdown {
			Name = "Select Weapon",
		}
		local ak = weaponDropdown:AddOption { Name = "AK-47" }
		weaponDropdown:AddOption { Name = "M4A1" }
		weaponDropdown:AddOption { Name = "AWP" }
		weaponDropdown:Select(ak)

		tab1:TextBox {
			Text = "Custom Name",
			Placeholder = "Enter name...",
			Callback = function(text)
				window:Notify("Input: " .. text)
			end,
		}

		tab1:Warning {
			Text = "Warning: Use at your own risk!",
		}

		tab1:Info {
			Text = "Info: Ported cleanly to the Ripple animation library.",
		}

		tab1:Message {
			Text = "Message: Welcome to BeanzUI v2.",
		}

		tab1:BindKey {
			Name = "Teleport Key",
			Default = "T",
			Callback = function()
				window:Notify("Teleport key pressed!")
			end,
		}

		tab1:BindButton {
			Name = "Mobile Lock",
			Text = "Mobile Lock",
			ButtonText = "Lock",
			Visible = true,
		}

		tab1:Toggle {
			Text = "Unsaved Toggle",
			Save = false,
			Default = false,
		}

		local tab2 = window:CreateTab {
			Name = "Settings",
		}

		tab2:Button {
			Text = "Export Config (JSON)",
			Callback = function()
				local json = window:ExportJSON()
				print("Exported Config:", json)
				window:Notify("Exported: " .. json)
			end,
		}

		local themeDropdown = tab2:Dropdown {
			Name = "Theme",
		}
		const registry = require("./utils/themes/registry")
		const themeOptions = {}
		for themeName, theme in registry do
			if typeof(theme) == "function" then
				continue
			end
			themeOptions[themeName] = themeDropdown:AddOption {
				Name = themeName,
				Callback = function()
					window:SetTheme(themeName)
				end,
			}
		end
		themeDropdown:Select(themeOptions.Default)

		tab2:Button {
			Text = "Load Preset Config",
			Callback = function()
				window:Import({
					WalkSpeed = 120,
					["Select Weapon"] = "AWP",
					["Enable Feature"] = false,
					["Custom Name"] = "LoadedUser",
				})
				window:Notify("Loaded Preset Config!")
			end,
		}
	end,
}

return story
