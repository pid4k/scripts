const start = require("./beanzlib/start")
const vide = require("./vide")

local story = {
	vide = vide,
	story = function(props)
		local window = start:CreateWindow {
			Size = UDim2.fromScale(.5,.5),
			Name = "BeanzUI Test",
			Parent = props.target,
		}

		local tab1 = window:CreateTab {
			Name = "Elements",
		}

		local btn = tab1:Button {
			Text = "Click Me",
			Callback = function()
				window:Notify("Button was clicked!")
			end,
		}

		local tog = tab1:Toggle {
			Text = "Enable Feature",
			Toggled = true,
			Callback = function(v)
				window:Notify("Toggle is now: " .. tostring(v))
			end,
		}

		local slider = tab1:Slider {
			Text = "WalkSpeed",
			Min = 16,
			Max = 200,
			Default = 50,
			Decimals = 0,
			Callback = function(v)
				print("Slider value:", v)
			end,
		}

		local dd = tab1:Dropdown {
			Name = "Select Weapon",
		}
		local opt1 = dd:Option { Name = "AK-47" }
		local opt2 = dd:Option { Name = "M4A1" }
		local opt3 = dd:Option { Name = "AWP" }
		dd:Select(opt1)

		local tb = tab1:TextBox {
			Text = "Custom Name",
			PlaceholderText = "Enter name...",
			Callback = function(txt)
				window:Notify("Input: " .. txt)
			end,
		}

		tab1:Warning {
			Text = "Warning: Use at your own risk!",
		}

		tab1:Info {
			Text = "Info: Ported cleanly to Vide reactive system.",
		}

		tab1:Message {
			Text = "Message: Welcome to BeanzUI v2.",
		}

		tab1:BindKey {
			Name = "Teleport Key",
			Bind = "T",
			Callback = function()
				window:Notify("Teleport key pressed!")
			end,
		}

		tab1:BindButton {
			Name = "Mobile Lock",
			Text = "Lock",
			Visible = true,
		}

		local unsavedTog = tab1:Toggle {
			Text = "Unsaved Toggle",
			Save = false,
			Toggled = false,
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
		local themeDrop = tab2:Dropdown{
			Name = "Theme"
		}
		local registry = require("./utils/themes/registry")
		local themeOpts = {}
		for themeName, theme in registry do
			if typeof(theme) == "function" then continue end
			const opt =  themeDrop:Option{
				Name = themeName,
				Callback = function()
					window:SetTheme(themeName)
				end,
			}
			themeOpts[themeName] = opt
		end
		themeDrop:Select(themeOpts.Default)
		tab2:Button {
			Text = "Load Preset Config",
			Callback = function()
				window:Import({
					["WalkSpeed"] = 120,
					["Select Weapon"] = "AWP",
					["Enable Feature"] = false,
					["Custom Name"] = "LoadedUser",
				})
				window:Notify("Loaded Preset Config!")
			end,
		}

		return window.Instance
	end,
}

return story