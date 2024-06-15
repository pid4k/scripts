-- // GUI TO LUA \\ --
-- this sucks i have no idea what i was thinking while writing this :Skull:
-- // INSTANCES: 135 | SCRIPTS: 1 | MODULES: 1 \\ --

local UI = {}

-- // StarterGui.skullissuesifuusethis \\ --
UI["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"))
UI["1"]["IgnoreGuiInset"] = true
UI["1"]["DisplayOrder"] = 100
UI["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets
UI["1"]["Name"] = [[skullissuesifuusethis]]
UI["1"]["ResetOnSpawn"] = false

-- // StarterGui.skullissuesifuusethis.MAmamama \\ --
UI["2"] = Instance.new("LocalScript", UI["1"])
UI["2"]["Name"] = [[MAmamama]]

-- // StarterGui.skullissuesifuusethis.HubFrame \\ --
UI["3"] = Instance.new("Frame", UI["1"])
UI["3"]["BorderSizePixel"] = 0
UI["3"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["3"]["Size"] = UDim2.new(0.28545, 0, 0.6539, 0)
UI["3"]["Position"] = UDim2.new(0.05023, 0, 0.32302, 0)
UI["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["3"]["Name"] = [[HubFrame]]
UI["3"]["BackgroundTransparency"] = 0.9

-- // StarterGui.skullissuesifuusethis.HubFrame.UIStroke \\ --
UI["4"] = Instance.new("UIStroke", UI["3"])
UI["4"]["Thickness"] = 2.7
UI["4"]["Color"] = Color3.fromRGB(0, 0, 255)

-- // StarterGui.skullissuesifuusethis.HubFrame.Title \\ --
UI["5"] = Instance.new("TextLabel", UI["3"])
UI["5"]["TextWrapped"] = true
UI["5"]["BorderSizePixel"] = 0
UI["5"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["5"]["TextScaled"] = true
UI["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["5"]["TextSize"] = 14
UI["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["5"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["5"]["BackgroundTransparency"] = 0.9
UI["5"]["Size"] = UDim2.new(1, 0, 0.08437, 0)
UI["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["5"]["Text"] = [[Beanz Hub]]
UI["5"]["Name"] = [[Title]]
UI["5"]["Position"] = UDim2.new(-0, 0, 0, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.ModeSelect \\ --
UI["6"] = Instance.new("Frame", UI["3"])
UI["6"]["BorderSizePixel"] = 0
UI["6"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["6"]["Size"] = UDim2.new(1, 0, 0.07407, 0)
UI["6"]["Position"] = UDim2.new(0, 0, 0.08279, 0)
UI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["6"]["Name"] = [[ModeSelect]]
UI["6"]["BackgroundTransparency"] = 0.8

-- // StarterGui.skullissuesifuusethis.HubFrame.ModeSelect.AimbotTotal \\ --
UI["7"] = Instance.new("TextButton", UI["6"])
UI["7"]["TextWrapped"] = true
UI["7"]["BorderSizePixel"] = 0
UI["7"]["TextSize"] = 14
UI["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["7"]["TextScaled"] = true
UI["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["7"]["Size"] = UDim2.new(0.513, 0, 0.92312, 0)
UI["7"]["BackgroundTransparency"] = 1
UI["7"]["Name"] = [[AimbotTotal]]
UI["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["7"]["Text"] = [[Aimbot]]
UI["7"]["Position"] = UDim2.new(0.0183, 0, 0.07688, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.ModeSelect.AimbotTotal.UIPadding \\ --
UI["8"] = Instance.new("UIPadding", UI["7"])
UI["8"]["PaddingRight"] = UDim.new(0.6, 0)
UI["8"]["PaddingLeft"] = UDim.new(0.1, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.ModeSelect.UIListLayout \\ --
UI["9"] = Instance.new("UIListLayout", UI["6"])
UI["9"]["Padding"] = UDim.new(-0.3, 0)
UI["9"]["SortOrder"] = Enum.SortOrder.LayoutOrder
UI["9"]["FillDirection"] = Enum.FillDirection.Horizontal

-- // StarterGui.skullissuesifuusethis.HubFrame.ModeSelect.EspTotal \\ --
UI["a"] = Instance.new("TextButton", UI["6"])
UI["a"]["TextWrapped"] = true
UI["a"]["BorderSizePixel"] = 0
UI["a"]["TextTransparency"] = 0.5
UI["a"]["TextSize"] = 14
UI["a"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["a"]["TextScaled"] = true
UI["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["a"]["Size"] = UDim2.new(0.513, 0, 0.92312, 0)
UI["a"]["BackgroundTransparency"] = 1
UI["a"]["Name"] = [[EspTotal]]
UI["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["a"]["Text"] = [[Esp]]
UI["a"]["Position"] = UDim2.new(0.20389, 0, 0.07688, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.ModeSelect.EspTotal.UIPadding \\ --
UI["b"] = Instance.new("UIPadding", UI["a"])
UI["b"]["PaddingRight"] = UDim.new(0.75, 0)
UI["b"]["PaddingLeft"] = UDim.new(0.1, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal \\ --
UI["c"] = Instance.new("Frame", UI["3"])
UI["c"]["BorderSizePixel"] = 0
UI["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["c"]["Size"] = UDim2.new(1, 0, 1, 0)
UI["c"]["Position"] = UDim2.new(0, 0, 0.02, 0)
UI["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["c"]["Name"] = [[AimbotTotal]]
UI["c"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu \\ --
UI["d"] = Instance.new("Frame", UI["c"])
UI["d"]["BorderSizePixel"] = 0
UI["d"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["d"]["Size"] = UDim2.new(0.9701, 0, 0.81021, 0)
UI["d"]["Position"] = UDim2.new(0.01374, 0, 0.15577, 0)
UI["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["d"]["Name"] = [[AimbotMenu]]
UI["d"]["BackgroundTransparency"] = 0.65

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.UICorner \\ --
UI["e"] = Instance.new("UICorner", UI["d"])


-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.UIStroke \\ --
UI["f"] = Instance.new("UIStroke", UI["d"])
UI["f"]["Thickness"] = 0.6
UI["f"]["Color"] = Color3.fromRGB(255, 255, 255)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles \\ --
UI["10"] = Instance.new("Frame", UI["d"])
UI["10"]["BorderSizePixel"] = 0
UI["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["10"]["Size"] = UDim2.new(0.4923, 0, 0.84235, 0)
UI["10"]["Position"] = UDim2.new(0.01872, 0, 0.09676, 0)
UI["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["10"]["Name"] = [[Toggles]]
UI["10"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.UIListLayout \\ --
UI["11"] = Instance.new("UIListLayout", UI["10"])
UI["11"]["Padding"] = UDim.new(0.03, 0)
UI["11"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.AimbotToggle \\ --
UI["12"] = Instance.new("Frame", UI["10"])
UI["12"]["BorderSizePixel"] = 0
UI["12"]["BackgroundColor3"] = Color3.fromRGB(85, 85, 85)
UI["12"]["Size"] = UDim2.new(0.58102, 0, 0.07642, 0)
UI["12"]["Position"] = UDim2.new(-0, 0, -0, 0)
UI["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["12"]["Name"] = [[AimbotToggle]]
UI["12"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.AimbotToggle.Text \\ --
UI["13"] = Instance.new("TextLabel", UI["12"])
UI["13"]["TextWrapped"] = true
UI["13"]["BorderSizePixel"] = 0
UI["13"]["TextScaled"] = true
UI["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["13"]["TextSize"] = 14
UI["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["13"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["13"]["BackgroundTransparency"] = 1
UI["13"]["Size"] = UDim2.new(0.82192, 0, 0.70213, 0)
UI["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["13"]["Text"] = [[Enable Aimbot]]
UI["13"]["Name"] = [[Text]]
UI["13"]["Position"] = UDim2.new(0.2663, 0, 0.08511, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.AimbotToggle.Toggle \\ --
UI["14"] = Instance.new("TextButton", UI["12"])
UI["14"]["BorderSizePixel"] = 0
UI["14"]["TextSize"] = 14
UI["14"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["14"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 255)
UI["14"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["14"]["Size"] = UDim2.new(0.20548, 0, 0.42553, 0)
UI["14"]["BackgroundTransparency"] = 1
UI["14"]["Name"] = [[Toggle]]
UI["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["14"]["Text"] = [[]]
UI["14"]["Position"] = UDim2.new(0, 0, 0.23404, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.AimbotToggle.Toggle.UICorner \\ --
UI["15"] = Instance.new("UICorner", UI["14"])


-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.AimbotToggle.Toggle.UIStroke \\ --
UI["16"] = Instance.new("UIStroke", UI["14"])
UI["16"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.UIStroke \\ --
UI["17"] = Instance.new("UIStroke", UI["10"])
UI["17"]["Thickness"] = 1.7
UI["17"]["Color"] = Color3.fromRGB(86, 86, 255)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.UIPadding \\ --
UI["18"] = Instance.new("UIPadding", UI["10"])
UI["18"]["PaddingTop"] = UDim.new(0.02, 0)
UI["18"]["PaddingLeft"] = UDim.new(0.04, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockBind \\ --
UI["19"] = Instance.new("Frame", UI["10"])
UI["19"]["BorderSizePixel"] = 0
UI["19"]["BackgroundColor3"] = Color3.fromRGB(85, 85, 85)
UI["19"]["Size"] = UDim2.new(0.58102, 0, 0.07642, 0)
UI["19"]["Position"] = UDim2.new(-0, 0, 0.10249, 0)
UI["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["19"]["Name"] = [[LockBind]]
UI["19"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockBind.Text \\ --
UI["1a"] = Instance.new("TextLabel", UI["19"])
UI["1a"]["TextWrapped"] = true
UI["1a"]["BorderSizePixel"] = 0
UI["1a"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["1a"]["TextScaled"] = true
UI["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1a"]["TextSize"] = 14
UI["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["1a"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["1a"]["BackgroundTransparency"] = 1
UI["1a"]["Size"] = UDim2.new(0.82192, 0, 0.70213, 0)
UI["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1a"]["Text"] = [[Lock Bind]]
UI["1a"]["Name"] = [[Text]]
UI["1a"]["Position"] = UDim2.new(-0.00475, 0, 0.16347, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockBind.TextBox \\ --
UI["1b"] = Instance.new("TextBox", UI["19"])
UI["1b"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["1b"]["BorderSizePixel"] = 0
UI["1b"]["TextEditable"] = false
UI["1b"]["TextWrapped"] = true
UI["1b"]["TextSize"] = 14
UI["1b"]["TextScaled"] = true
UI["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["1b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["1b"]["PlaceholderText"] = [[Key]]
UI["1b"]["Size"] = UDim2.new(0.71574, 0, 0.78723, 0)
UI["1b"]["Position"] = UDim2.new(0.7417, 0, 0.11754, 0)
UI["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1b"]["Text"] = [[RMB]]
UI["1b"]["BackgroundTransparency"] = 0.55

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockBind.TextBox.UIStroke \\ --
UI["1c"] = Instance.new("UIStroke", UI["1b"])
UI["1c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockBind.TextBox.UICorner \\ --
UI["1d"] = Instance.new("UICorner", UI["1b"])


-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockBind.TextBox.UIPadding \\ --
UI["1e"] = Instance.new("UIPadding", UI["1b"])
UI["1e"]["PaddingTop"] = UDim.new(0.1, 0)
UI["1e"]["PaddingRight"] = UDim.new(0.1, 0)
UI["1e"]["PaddingLeft"] = UDim.new(0.1, 0)
UI["1e"]["PaddingBottom"] = UDim.new(0.1, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Mode \\ --
UI["1f"] = Instance.new("Frame", UI["10"])
UI["1f"]["BorderSizePixel"] = 0
UI["1f"]["BackgroundColor3"] = Color3.fromRGB(85, 85, 85)
UI["1f"]["Size"] = UDim2.new(0.84681, 0, 0.14091, 0)
UI["1f"]["Position"] = UDim2.new(-0, 0, 0.20499, 0)
UI["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["1f"]["Name"] = [[Mode]]
UI["1f"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Mode.Text \\ --
UI["20"] = Instance.new("TextLabel", UI["1f"])
UI["20"]["TextWrapped"] = true
UI["20"]["BorderSizePixel"] = 0
UI["20"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["20"]["TextScaled"] = true
UI["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["20"]["TextSize"] = 14
UI["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["20"]["BackgroundTransparency"] = 1
UI["20"]["Size"] = UDim2.new(0.56512, 0, 0.38136, 0)
UI["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["20"]["Text"] = [[Mode]]
UI["20"]["Name"] = [[Text]]
UI["20"]["Position"] = UDim2.new(-0.00534, 0, 0.16347, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Mode.ChangeToggleMode \\ --
UI["21"] = Instance.new("TextButton", UI["1f"])
UI["21"]["TextWrapped"] = true
UI["21"]["BorderSizePixel"] = 0
UI["21"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["21"]["TextSize"] = 14
UI["21"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["21"]["TextScaled"] = true
UI["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["21"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["21"]["ZIndex"] = 2
UI["21"]["Size"] = UDim2.new(1.00663, 0, 0.46241, 0)
UI["21"]["BackgroundTransparency"] = 0.55
UI["21"]["Name"] = [[ChangeToggleMode]]
UI["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["21"]["Text"] = [[Hold]]
UI["21"]["Position"] = UDim2.new(-0.00663, 0, 0.65332, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Mode.ChangeToggleMode.UICorner \\ --
UI["22"] = Instance.new("UICorner", UI["21"])


-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Mode.ChangeToggleMode.UIPadding \\ --
UI["23"] = Instance.new("UIPadding", UI["21"])
UI["23"]["PaddingTop"] = UDim.new(0.1, 0)
UI["23"]["PaddingRight"] = UDim.new(0.1, 0)
UI["23"]["PaddingLeft"] = UDim.new(0.1, 0)
UI["23"]["PaddingBottom"] = UDim.new(0.1, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Mode.ChangeToggleMode.UIStroke \\ --
UI["24"] = Instance.new("UIStroke", UI["21"])
UI["24"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Mode.ChangeToggleMode.DropFrame \\ --
UI["25"] = Instance.new("Frame", UI["21"])
UI["25"]["Visible"] = false
UI["25"]["BorderSizePixel"] = 0
UI["25"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["25"]["Size"] = UDim2.new(1.25, 0, 1.25732, 0)
UI["25"]["Position"] = UDim2.new(-0.125, 0, 1.125, 0)
UI["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["25"]["Name"] = [[DropFrame]]
UI["25"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Mode.ChangeToggleMode.DropFrame.TextButton \\ --
UI["26"] = Instance.new("TextButton", UI["25"])
UI["26"]["TextWrapped"] = true
UI["26"]["BorderSizePixel"] = 0
UI["26"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["26"]["TextSize"] = 14
UI["26"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["26"]["TextScaled"] = true
UI["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["26"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["26"]["Size"] = UDim2.new(1, 0, 1, 0)
UI["26"]["BackgroundTransparency"] = 0.65
UI["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["26"]["Text"] = [[Toggle]]

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Mode.ChangeToggleMode.DropFrame.TextButton.UIPadding \\ --
UI["27"] = Instance.new("UIPadding", UI["26"])
UI["27"]["PaddingTop"] = UDim.new(0.1, 0)
UI["27"]["PaddingRight"] = UDim.new(0.1, 0)
UI["27"]["PaddingLeft"] = UDim.new(0.1, 0)
UI["27"]["PaddingBottom"] = UDim.new(0.1, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Mode.Arrow \\ --
UI["28"] = Instance.new("TextLabel", UI["1f"])
UI["28"]["TextWrapped"] = true
UI["28"]["ZIndex"] = 3
UI["28"]["BorderSizePixel"] = 0
UI["28"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["28"]["TextScaled"] = true
UI["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["28"]["TextSize"] = 14
UI["28"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["28"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["28"]["BackgroundTransparency"] = 1
UI["28"]["Size"] = UDim2.new(0.10333, 0, 0.5183, 0)
UI["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["28"]["Text"] = [[◣]]
UI["28"]["Rotation"] = -45
UI["28"]["Name"] = [[Arrow]]
UI["28"]["Position"] = UDim2.new(0.83863, 0, 0.50099, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Target \\ --
UI["29"] = Instance.new("Frame", UI["10"])
UI["29"]["BorderSizePixel"] = 0
UI["29"]["BackgroundColor3"] = Color3.fromRGB(85, 85, 85)
UI["29"]["Size"] = UDim2.new(0.84681, 0, 0.14091, 0)
UI["29"]["Position"] = UDim2.new(-0, 0, 0.37197, 0)
UI["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["29"]["Name"] = [[Target]]
UI["29"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Target.Text \\ --
UI["2a"] = Instance.new("TextLabel", UI["29"])
UI["2a"]["TextWrapped"] = true
UI["2a"]["BorderSizePixel"] = 0
UI["2a"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["2a"]["TextScaled"] = true
UI["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["2a"]["TextSize"] = 14
UI["2a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["2a"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["2a"]["BackgroundTransparency"] = 1
UI["2a"]["Size"] = UDim2.new(0.56512, 0, 0.38136, 0)
UI["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2a"]["Text"] = [[Target]]
UI["2a"]["Name"] = [[Text]]
UI["2a"]["Position"] = UDim2.new(-0.00534, 0, 0.16347, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Target.ChangeToggleMode \\ --
UI["2b"] = Instance.new("TextButton", UI["29"])
UI["2b"]["TextWrapped"] = true
UI["2b"]["BorderSizePixel"] = 0
UI["2b"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["2b"]["TextSize"] = 14
UI["2b"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["2b"]["TextScaled"] = true
UI["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["2b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["2b"]["ZIndex"] = 2
UI["2b"]["Size"] = UDim2.new(1.00663, 0, 0.46241, 0)
UI["2b"]["BackgroundTransparency"] = 0.55
UI["2b"]["Name"] = [[ChangeToggleMode]]
UI["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2b"]["Text"] = [[Head]]
UI["2b"]["Position"] = UDim2.new(-0.00663, 0, 0.65332, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Target.ChangeToggleMode.UICorner \\ --
UI["2c"] = Instance.new("UICorner", UI["2b"])


-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Target.ChangeToggleMode.UIPadding \\ --
UI["2d"] = Instance.new("UIPadding", UI["2b"])
UI["2d"]["PaddingTop"] = UDim.new(0.1, 0)
UI["2d"]["PaddingRight"] = UDim.new(0.1, 0)
UI["2d"]["PaddingLeft"] = UDim.new(0.1, 0)
UI["2d"]["PaddingBottom"] = UDim.new(0.1, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Target.ChangeToggleMode.UIStroke \\ --
UI["2e"] = Instance.new("UIStroke", UI["2b"])
UI["2e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Target.ChangeToggleMode.DropFrame \\ --
UI["2f"] = Instance.new("Frame", UI["2b"])
UI["2f"]["Visible"] = false
UI["2f"]["ZIndex"] = 2
UI["2f"]["BorderSizePixel"] = 0
UI["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["2f"]["Size"] = UDim2.new(1.25, 0, 1.25732, 0)
UI["2f"]["Position"] = UDim2.new(-0.125, 0, 1.125, 0)
UI["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2f"]["Name"] = [[DropFrame]]
UI["2f"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Target.ChangeToggleMode.DropFrame.TextButton \\ --
UI["30"] = Instance.new("TextButton", UI["2f"])
UI["30"]["TextWrapped"] = true
UI["30"]["BorderSizePixel"] = 0
UI["30"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["30"]["TextSize"] = 14
UI["30"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["30"]["TextScaled"] = true
UI["30"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["30"]["Selectable"] = false
UI["30"]["ZIndex"] = 2
UI["30"]["Size"] = UDim2.new(1, 0, 1, 0)
UI["30"]["BackgroundTransparency"] = 0.65
UI["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["30"]["Text"] = [[HumanoidRootPart]]

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Target.ChangeToggleMode.DropFrame.TextButton.UIPadding \\ --
UI["31"] = Instance.new("UIPadding", UI["30"])
UI["31"]["PaddingTop"] = UDim.new(0.1, 0)
UI["31"]["PaddingRight"] = UDim.new(0.1, 0)
UI["31"]["PaddingLeft"] = UDim.new(0.1, 0)
UI["31"]["PaddingBottom"] = UDim.new(0.1, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Target.Arrow \\ --
UI["32"] = Instance.new("TextLabel", UI["29"])
UI["32"]["TextWrapped"] = true
UI["32"]["ZIndex"] = 3
UI["32"]["BorderSizePixel"] = 0
UI["32"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["32"]["TextScaled"] = true
UI["32"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["32"]["TextSize"] = 14
UI["32"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["32"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["32"]["BackgroundTransparency"] = 1
UI["32"]["Size"] = UDim2.new(0.10333, 0, 0.5183, 0)
UI["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["32"]["Text"] = [[◣]]
UI["32"]["Rotation"] = -45
UI["32"]["Name"] = [[Arrow]]
UI["32"]["Position"] = UDim2.new(0.83863, 0, 0.50099, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockMode \\ --
UI["33"] = Instance.new("Frame", UI["10"])
UI["33"]["BorderSizePixel"] = 0
UI["33"]["BackgroundColor3"] = Color3.fromRGB(85, 85, 85)
UI["33"]["Size"] = UDim2.new(0.84681, 0, 0.14091, 0)
UI["33"]["Position"] = UDim2.new(-0, 0, 0.53896, 0)
UI["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["33"]["Name"] = [[LockMode]]
UI["33"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockMode.Text \\ --
UI["34"] = Instance.new("TextLabel", UI["33"])
UI["34"]["TextWrapped"] = true
UI["34"]["BorderSizePixel"] = 0
UI["34"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["34"]["TextScaled"] = true
UI["34"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["34"]["TextSize"] = 14
UI["34"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["34"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["34"]["BackgroundTransparency"] = 1
UI["34"]["Size"] = UDim2.new(0.56512, 0, 0.38136, 0)
UI["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["34"]["Text"] = [[Lock Mode]]
UI["34"]["Name"] = [[Text]]
UI["34"]["Position"] = UDim2.new(-0.00534, 0, 0.16347, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockMode.ChangeToggleMode \\ --
UI["35"] = Instance.new("TextButton", UI["33"])
UI["35"]["TextWrapped"] = true
UI["35"]["BorderSizePixel"] = 0
UI["35"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["35"]["TextSize"] = 14
UI["35"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["35"]["TextScaled"] = true
UI["35"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["35"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["35"]["ZIndex"] = 2
UI["35"]["Size"] = UDim2.new(1.00663, 0, 0.46241, 0)
UI["35"]["BackgroundTransparency"] = 0.55
UI["35"]["Name"] = [[ChangeToggleMode]]
UI["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["35"]["Text"] = [[Camera]]
UI["35"]["Position"] = UDim2.new(-0.00663, 0, 0.65332, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockMode.ChangeToggleMode.UICorner \\ --
UI["36"] = Instance.new("UICorner", UI["35"])


-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockMode.ChangeToggleMode.UIPadding \\ --
UI["37"] = Instance.new("UIPadding", UI["35"])
UI["37"]["PaddingTop"] = UDim.new(0.1, 0)
UI["37"]["PaddingRight"] = UDim.new(0.1, 0)
UI["37"]["PaddingLeft"] = UDim.new(0.1, 0)
UI["37"]["PaddingBottom"] = UDim.new(0.1, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockMode.ChangeToggleMode.UIStroke \\ --
UI["38"] = Instance.new("UIStroke", UI["35"])
UI["38"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockMode.ChangeToggleMode.DropFrame \\ --
UI["39"] = Instance.new("Frame", UI["35"])
UI["39"]["Visible"] = false
UI["39"]["ZIndex"] = 2
UI["39"]["BorderSizePixel"] = 0
UI["39"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["39"]["Size"] = UDim2.new(1.25, 0, 1.25732, 0)
UI["39"]["Position"] = UDim2.new(-0.125, 0, 1.125, 0)
UI["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["39"]["Name"] = [[DropFrame]]
UI["39"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockMode.ChangeToggleMode.DropFrame.TextButton \\ --
UI["3a"] = Instance.new("TextButton", UI["39"])
UI["3a"]["TextWrapped"] = true
UI["3a"]["BorderSizePixel"] = 0
UI["3a"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["3a"]["TextSize"] = 14
UI["3a"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["3a"]["TextScaled"] = true
UI["3a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["3a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["3a"]["Selectable"] = false
UI["3a"]["ZIndex"] = 2
UI["3a"]["Size"] = UDim2.new(1, 0, 1, 0)
UI["3a"]["BackgroundTransparency"] = 0.65
UI["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["3a"]["Text"] = [[Mouse]]

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockMode.ChangeToggleMode.DropFrame.TextButton.UIPadding \\ --
UI["3b"] = Instance.new("UIPadding", UI["3a"])
UI["3b"]["PaddingTop"] = UDim.new(0.1, 0)
UI["3b"]["PaddingRight"] = UDim.new(0.1, 0)
UI["3b"]["PaddingLeft"] = UDim.new(0.1, 0)
UI["3b"]["PaddingBottom"] = UDim.new(0.1, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockMode.ChangeToggleMode.DropFrame.TextButton \\ --
UI["3c"] = Instance.new("TextButton", UI["39"])
UI["3c"]["TextWrapped"] = true
UI["3c"]["BorderSizePixel"] = 0
UI["3c"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["3c"]["TextSize"] = 14
UI["3c"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["3c"]["TextScaled"] = true
UI["3c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["3c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["3c"]["Selectable"] = false
UI["3c"]["ZIndex"] = 2
UI["3c"]["Size"] = UDim2.new(1, 0, 1, 0)
UI["3c"]["BackgroundTransparency"] = 0.65
UI["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["3c"]["Text"] = [[Dynamic]]

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockMode.ChangeToggleMode.DropFrame.TextButton.UIPadding \\ --
UI["3d"] = Instance.new("UIPadding", UI["3c"])
UI["3d"]["PaddingTop"] = UDim.new(0.1, 0)
UI["3d"]["PaddingRight"] = UDim.new(0.1, 0)
UI["3d"]["PaddingLeft"] = UDim.new(0.1, 0)
UI["3d"]["PaddingBottom"] = UDim.new(0.1, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockMode.ChangeToggleMode.DropFrame.UIListLayout \\ --
UI["3e"] = Instance.new("UIListLayout", UI["39"])
UI["3e"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.LockMode.Arrow \\ --
UI["3f"] = Instance.new("TextLabel", UI["33"])
UI["3f"]["TextWrapped"] = true
UI["3f"]["ZIndex"] = 3
UI["3f"]["BorderSizePixel"] = 0
UI["3f"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["3f"]["TextScaled"] = true
UI["3f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["3f"]["TextSize"] = 14
UI["3f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["3f"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["3f"]["BackgroundTransparency"] = 1
UI["3f"]["Size"] = UDim2.new(0.10333, 0, 0.5183, 0)
UI["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["3f"]["Text"] = [[◣]]
UI["3f"]["Rotation"] = -45
UI["3f"]["Name"] = [[Arrow]]
UI["3f"]["Position"] = UDim2.new(0.83863, 0, 0.50099, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Autofire \\ --
UI["40"] = Instance.new("Frame", UI["10"])
UI["40"]["Visible"] = false
UI["40"]["BorderSizePixel"] = 0
UI["40"]["BackgroundColor3"] = Color3.fromRGB(85, 85, 85)
UI["40"]["Size"] = UDim2.new(0.58102, 0, 0.07642, 0)
UI["40"]["Position"] = UDim2.new(-0, 0, -0, 0)
UI["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["40"]["Name"] = [[Autofire]]
UI["40"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Autofire.Autofire \\ --
UI["41"] = Instance.new("TextLabel", UI["40"])
UI["41"]["TextWrapped"] = true
UI["41"]["BorderSizePixel"] = 0
UI["41"]["TextScaled"] = true
UI["41"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["41"]["TextSize"] = 14
UI["41"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["41"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["41"]["BackgroundTransparency"] = 1
UI["41"]["Size"] = UDim2.new(0.82192, 0, 0.70213, 0)
UI["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["41"]["Text"] = [[Autofire]]
UI["41"]["Name"] = [[Autofire]]
UI["41"]["Position"] = UDim2.new(0.2663, 0, 0.08511, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Autofire.Toggle \\ --
UI["42"] = Instance.new("TextButton", UI["40"])
UI["42"]["BorderSizePixel"] = 0
UI["42"]["TextSize"] = 14
UI["42"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["42"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 255)
UI["42"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["42"]["Size"] = UDim2.new(0.20548, 0, 0.42553, 0)
UI["42"]["BackgroundTransparency"] = 1
UI["42"]["Name"] = [[Toggle]]
UI["42"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["42"]["Text"] = [[]]
UI["42"]["Position"] = UDim2.new(0, 0, 0.23404, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Autofire.Toggle.UICorner \\ --
UI["43"] = Instance.new("UICorner", UI["42"])


-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Toggles.Autofire.Toggle.UIStroke \\ --
UI["44"] = Instance.new("UIStroke", UI["42"])
UI["44"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks \\ --
UI["45"] = Instance.new("Frame", UI["d"])
UI["45"]["BorderSizePixel"] = 0
UI["45"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["45"]["Size"] = UDim2.new(0.43333, 0, 0.38506, 0)
UI["45"]["Position"] = UDim2.new(0.54998, 0, 0.10121, 0)
UI["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["45"]["Name"] = [[Checks]]
UI["45"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.UIListLayout \\ --
UI["46"] = Instance.new("UIListLayout", UI["45"])
UI["46"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.HpAmount \\ --
UI["47"] = Instance.new("Frame", UI["45"])
UI["47"]["BorderSizePixel"] = 0
UI["47"]["BackgroundColor3"] = Color3.fromRGB(85, 85, 85)
UI["47"]["Size"] = UDim2.new(0.58274, 0, 0.24039, 0)
UI["47"]["Position"] = UDim2.new(0, 0, 0, 0)
UI["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["47"]["Name"] = [[HpAmount]]
UI["47"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.HpAmount.Text \\ --
UI["48"] = Instance.new("TextLabel", UI["47"])
UI["48"]["TextWrapped"] = true
UI["48"]["BorderSizePixel"] = 0
UI["48"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["48"]["TextScaled"] = true
UI["48"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["48"]["TextSize"] = 14
UI["48"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["48"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["48"]["BackgroundTransparency"] = 1
UI["48"]["Size"] = UDim2.new(0.82192, 0, 0.70213, 0)
UI["48"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["48"]["Text"] = [[HP]]
UI["48"]["Name"] = [[Text]]
UI["48"]["Position"] = UDim2.new(-0.00475, 0, 0.16347, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.HpAmount.TextBox \\ --
UI["49"] = Instance.new("TextBox", UI["47"])
UI["49"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["49"]["BorderSizePixel"] = 0
UI["49"]["TextWrapped"] = true
UI["49"]["TextSize"] = 14
UI["49"]["TextScaled"] = true
UI["49"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["49"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["49"]["PlaceholderText"] = [[Health %]]
UI["49"]["Size"] = UDim2.new(0.64887, 0, 0.78723, 0)
UI["49"]["Position"] = UDim2.new(0.35113, 0, 0.11754, 0)
UI["49"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["49"]["Text"] = [[]]
UI["49"]["BackgroundTransparency"] = 0.55

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.HpAmount.TextBox.UIStroke \\ --
UI["4a"] = Instance.new("UIStroke", UI["49"])
UI["4a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.HpAmount.TextBox.UICorner \\ --
UI["4b"] = Instance.new("UICorner", UI["49"])


-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.HpAmount.TextBox.UIPadding \\ --
UI["4c"] = Instance.new("UIPadding", UI["49"])
UI["4c"]["PaddingTop"] = UDim.new(0.1, 0)
UI["4c"]["PaddingRight"] = UDim.new(0.1, 0)
UI["4c"]["PaddingLeft"] = UDim.new(0.1, 0)
UI["4c"]["PaddingBottom"] = UDim.new(0.1, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.TargetBots \\ --
UI["4d"] = Instance.new("Frame", UI["45"])
UI["4d"]["BorderSizePixel"] = 0
UI["4d"]["BackgroundColor3"] = Color3.fromRGB(85, 85, 85)
UI["4d"]["Size"] = UDim2.new(0.58274, 0, 0.24039, 0)
UI["4d"]["Position"] = UDim2.new(0, 0, 0.24039, 0)
UI["4d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["4d"]["Name"] = [[TargetBots]]
UI["4d"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.TargetBots.Text \\ --
UI["4e"] = Instance.new("TextLabel", UI["4d"])
UI["4e"]["TextWrapped"] = true
UI["4e"]["BorderSizePixel"] = 0
UI["4e"]["TextScaled"] = true
UI["4e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["4e"]["TextSize"] = 14
UI["4e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["4e"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["4e"]["BackgroundTransparency"] = 1
UI["4e"]["Size"] = UDim2.new(0.82192, 0, 0.70213, 0)
UI["4e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["4e"]["Text"] = [[Target Bots]]
UI["4e"]["Name"] = [[Text]]
UI["4e"]["Position"] = UDim2.new(0.2663, 0, 0.08511, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.TargetBots.Toggle \\ --
UI["4f"] = Instance.new("TextButton", UI["4d"])
UI["4f"]["BorderSizePixel"] = 0
UI["4f"]["TextSize"] = 14
UI["4f"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["4f"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 255)
UI["4f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["4f"]["Size"] = UDim2.new(0.20548, 0, 0.42553, 0)
UI["4f"]["BackgroundTransparency"] = 1
UI["4f"]["Name"] = [[Toggle]]
UI["4f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["4f"]["Text"] = [[]]
UI["4f"]["Position"] = UDim2.new(0, 0, 0.23404, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.TargetBots.Toggle.UICorner \\ --
UI["50"] = Instance.new("UICorner", UI["4f"])


-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.TargetBots.Toggle.UIStroke \\ --
UI["51"] = Instance.new("UIStroke", UI["4f"])
UI["51"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.UIStroke \\ --
UI["52"] = Instance.new("UIStroke", UI["45"])
UI["52"]["Thickness"] = 1.7
UI["52"]["Color"] = Color3.fromRGB(86, 86, 255)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.UIPadding \\ --
UI["53"] = Instance.new("UIPadding", UI["45"])
UI["53"]["PaddingTop"] = UDim.new(0.1, 0)
UI["53"]["PaddingLeft"] = UDim.new(0.04, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.TeamCheck \\ --
UI["54"] = Instance.new("Frame", UI["45"])
UI["54"]["BorderSizePixel"] = 0
UI["54"]["BackgroundColor3"] = Color3.fromRGB(85, 85, 85)
UI["54"]["Size"] = UDim2.new(0.58274, 0, 0.24039, 0)
UI["54"]["Position"] = UDim2.new(0, 0, 0.24039, 0)
UI["54"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["54"]["Name"] = [[TeamCheck]]
UI["54"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.TeamCheck.Text \\ --
UI["55"] = Instance.new("TextLabel", UI["54"])
UI["55"]["TextWrapped"] = true
UI["55"]["BorderSizePixel"] = 0
UI["55"]["TextScaled"] = true
UI["55"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["55"]["TextSize"] = 14
UI["55"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["55"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["55"]["BackgroundTransparency"] = 1
UI["55"]["Size"] = UDim2.new(0.82192, 0, 0.70213, 0)
UI["55"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["55"]["Text"] = [[Team Check (not working rn)]]
UI["55"]["Name"] = [[Text]]
UI["55"]["Position"] = UDim2.new(0.2663, 0, 0.08511, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.TeamCheck.Toggle \\ --
UI["56"] = Instance.new("TextButton", UI["54"])
UI["56"]["BorderSizePixel"] = 0
UI["56"]["TextSize"] = 14
UI["56"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["56"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 255)
UI["56"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["56"]["Size"] = UDim2.new(0.20548, 0, 0.42553, 0)
UI["56"]["BackgroundTransparency"] = 1
UI["56"]["Name"] = [[Toggle]]
UI["56"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["56"]["Text"] = [[]]
UI["56"]["Position"] = UDim2.new(0, 0, 0.23404, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.TeamCheck.Toggle.UICorner \\ --
UI["57"] = Instance.new("UICorner", UI["56"])


-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.TeamCheck.Toggle.UIStroke \\ --
UI["58"] = Instance.new("UIStroke", UI["56"])
UI["58"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.Prediction \\ --
UI["59"] = Instance.new("Frame", UI["45"])
UI["59"]["BorderSizePixel"] = 0
UI["59"]["BackgroundColor3"] = Color3.fromRGB(85, 85, 85)
UI["59"]["Size"] = UDim2.new(0.58274, 0, 0.24039, 0)
UI["59"]["Position"] = UDim2.new(0, 0, 0, 0)
UI["59"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["59"]["Name"] = [[Prediction]]
UI["59"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.Prediction.Text \\ --
UI["5a"] = Instance.new("TextLabel", UI["59"])
UI["5a"]["TextWrapped"] = true
UI["5a"]["BorderSizePixel"] = 0
UI["5a"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["5a"]["TextScaled"] = true
UI["5a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["5a"]["TextSize"] = 14
UI["5a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["5a"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["5a"]["BackgroundTransparency"] = 1
UI["5a"]["Size"] = UDim2.new(0.82192, 0, 0.70213, 0)
UI["5a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["5a"]["Text"] = [[Prediction]]
UI["5a"]["Name"] = [[Text]]
UI["5a"]["Position"] = UDim2.new(-0.00475, 0, 0.16347, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.Prediction.TextBox \\ --
UI["5b"] = Instance.new("TextBox", UI["59"])
UI["5b"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["5b"]["BorderSizePixel"] = 0
UI["5b"]["TextWrapped"] = true
UI["5b"]["TextSize"] = 14
UI["5b"]["TextScaled"] = true
UI["5b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["5b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["5b"]["ClearTextOnFocus"] = false
UI["5b"]["PlaceholderText"] = [[0-1]]
UI["5b"]["Size"] = UDim2.new(0.64887, 0, 0.78723, 0)
UI["5b"]["Position"] = UDim2.new(0.88531, 0, 0.11754, 0)
UI["5b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["5b"]["Text"] = [[0]]
UI["5b"]["BackgroundTransparency"] = 0.55

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.Prediction.TextBox.UIStroke \\ --
UI["5c"] = Instance.new("UIStroke", UI["5b"])
UI["5c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.Prediction.TextBox.UICorner \\ --
UI["5d"] = Instance.new("UICorner", UI["5b"])


-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.Checks.Prediction.TextBox.UIPadding \\ --
UI["5e"] = Instance.new("UIPadding", UI["5b"])
UI["5e"]["PaddingTop"] = UDim.new(0.1, 0)
UI["5e"]["PaddingRight"] = UDim.new(0.1, 0)
UI["5e"]["PaddingLeft"] = UDim.new(0.1, 0)
UI["5e"]["PaddingBottom"] = UDim.new(0.1, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.TextLabel \\ --
UI["5f"] = Instance.new("TextLabel", UI["d"])
UI["5f"]["TextWrapped"] = true
UI["5f"]["BorderSizePixel"] = 0
UI["5f"]["TextScaled"] = true
UI["5f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["5f"]["TextSize"] = 14
UI["5f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["5f"]["TextColor3"] = Color3.fromRGB(107, 147, 255)
UI["5f"]["BackgroundTransparency"] = 1
UI["5f"]["Size"] = UDim2.new(0.24225, 0, 0.06852, 0)
UI["5f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["5f"]["Text"] = [[Checks]]
UI["5f"]["Position"] = UDim2.new(0.52354, 0, 0.03814, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.AimbotTotal.AimbotMenu.TextLabel \\ --
UI["60"] = Instance.new("TextLabel", UI["d"])
UI["60"]["TextWrapped"] = true
UI["60"]["BorderSizePixel"] = 0
UI["60"]["TextScaled"] = true
UI["60"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["60"]["TextSize"] = 14
UI["60"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["60"]["TextColor3"] = Color3.fromRGB(107, 147, 255)
UI["60"]["BackgroundTransparency"] = 1
UI["60"]["Size"] = UDim2.new(0.242, 0, 0.069, 0)
UI["60"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["60"]["Text"] = [[Values]]
UI["60"]["Position"] = UDim2.new(0, 0, 0.03814, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal \\ --
UI["61"] = Instance.new("Frame", UI["3"])
UI["61"]["Visible"] = false
UI["61"]["BorderSizePixel"] = 0
UI["61"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["61"]["Size"] = UDim2.new(1, 0, 1, 0)
UI["61"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["61"]["Name"] = [[EspTotal]]
UI["61"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu \\ --
UI["62"] = Instance.new("Frame", UI["61"])
UI["62"]["BorderSizePixel"] = 0
UI["62"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
UI["62"]["Size"] = UDim2.new(0.49883, 0, 0.55437, 0)
UI["62"]["Position"] = UDim2.new(0.01726, 0, 0.17328, 0)
UI["62"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["62"]["Name"] = [[EspMenu]]
UI["62"]["BackgroundTransparency"] = 0.65

-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.UICorner \\ --
UI["63"] = Instance.new("UICorner", UI["62"])


-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.UIStroke \\ --
UI["64"] = Instance.new("UIStroke", UI["62"])
UI["64"]["Thickness"] = 0.6
UI["64"]["Color"] = Color3.fromRGB(255, 255, 255)

-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.Toggles \\ --
UI["65"] = Instance.new("Frame", UI["62"])
UI["65"]["BorderSizePixel"] = 0
UI["65"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["65"]["Size"] = UDim2.new(0.68224, 0, 0.53698, 0)
UI["65"]["Position"] = UDim2.new(0.09346, 0, 0.14791, 0)
UI["65"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["65"]["Name"] = [[Toggles]]
UI["65"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.Toggles.UIListLayout \\ --
UI["66"] = Instance.new("UIListLayout", UI["65"])
UI["66"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.Toggles.EnableEsp \\ --
UI["67"] = Instance.new("Frame", UI["65"])
UI["67"]["BorderSizePixel"] = 0
UI["67"]["BackgroundColor3"] = Color3.fromRGB(85, 85, 85)
UI["67"]["Size"] = UDim2.new(1, 0, 0.28144, 0)
UI["67"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["67"]["Name"] = [[EnableEsp]]
UI["67"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.Toggles.EnableEsp.Text \\ --
UI["68"] = Instance.new("TextLabel", UI["67"])
UI["68"]["TextWrapped"] = true
UI["68"]["BorderSizePixel"] = 0
UI["68"]["TextScaled"] = true
UI["68"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["68"]["TextSize"] = 14
UI["68"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["68"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["68"]["BackgroundTransparency"] = 1
UI["68"]["Size"] = UDim2.new(0.7337, 0, 0.70213, 0)
UI["68"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["68"]["Text"] = [[Enable Esp]]
UI["68"]["Name"] = [[Text]]
UI["68"]["Position"] = UDim2.new(0.2663, 0, 0.08511, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.Toggles.EnableEsp.Toggle \\ --
UI["69"] = Instance.new("TextButton", UI["67"])
UI["69"]["BorderSizePixel"] = 0
UI["69"]["TextSize"] = 14
UI["69"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["69"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 255)
UI["69"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["69"]["Size"] = UDim2.new(0.20548, 0, 0.42553, 0)
UI["69"]["BackgroundTransparency"] = 1
UI["69"]["Name"] = [[Toggle]]
UI["69"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["69"]["Text"] = [[]]
UI["69"]["Position"] = UDim2.new(0, 0, 0.23404, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.Toggles.EnableEsp.Toggle.UICorner \\ --
UI["6a"] = Instance.new("UICorner", UI["69"])


-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.Toggles.EnableEsp.Toggle.UIStroke \\ --
UI["6b"] = Instance.new("UIStroke", UI["69"])
UI["6b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.Toggles.ShowName \\ --
UI["6c"] = Instance.new("Frame", UI["65"])
UI["6c"]["BorderSizePixel"] = 0
UI["6c"]["BackgroundColor3"] = Color3.fromRGB(85, 85, 85)
UI["6c"]["Size"] = UDim2.new(1, 0, 0.28144, 0)
UI["6c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["6c"]["Name"] = [[ShowName]]
UI["6c"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.Toggles.ShowName.Text \\ --
UI["6d"] = Instance.new("TextLabel", UI["6c"])
UI["6d"]["TextWrapped"] = true
UI["6d"]["BorderSizePixel"] = 0
UI["6d"]["TextScaled"] = true
UI["6d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["6d"]["TextSize"] = 14
UI["6d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["6d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["6d"]["BackgroundTransparency"] = 1
UI["6d"]["Size"] = UDim2.new(0.82192, 0, 0.70213, 0)
UI["6d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["6d"]["Text"] = [[Show Names]]
UI["6d"]["Name"] = [[Text]]
UI["6d"]["Position"] = UDim2.new(0.2663, 0, 0.08511, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.Toggles.ShowName.Toggle \\ --
UI["6e"] = Instance.new("TextButton", UI["6c"])
UI["6e"]["BorderSizePixel"] = 0
UI["6e"]["TextSize"] = 14
UI["6e"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["6e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 255)
UI["6e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["6e"]["Size"] = UDim2.new(0.20548, 0, 0.42553, 0)
UI["6e"]["Name"] = [[Toggle]]
UI["6e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["6e"]["Text"] = [[]]
UI["6e"]["Position"] = UDim2.new(0, 0, 0.23404, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.Toggles.ShowName.Toggle.UICorner \\ --
UI["6f"] = Instance.new("UICorner", UI["6e"])


-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.Toggles.ShowName.Toggle.UIStroke \\ --
UI["70"] = Instance.new("UIStroke", UI["6e"])
UI["70"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.Toggles.HpAmount \\ --
UI["71"] = Instance.new("Frame", UI["65"])
UI["71"]["BorderSizePixel"] = 0
UI["71"]["BackgroundColor3"] = Color3.fromRGB(85, 85, 85)
UI["71"]["Size"] = UDim2.new(1, 0, 0.28144, 0)
UI["71"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["71"]["Name"] = [[HpAmount]]
UI["71"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.Toggles.HpAmount.Text \\ --
UI["72"] = Instance.new("TextLabel", UI["71"])
UI["72"]["TextWrapped"] = true
UI["72"]["BorderSizePixel"] = 0
UI["72"]["TextXAlignment"] = Enum.TextXAlignment.Left
UI["72"]["TextScaled"] = true
UI["72"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["72"]["TextSize"] = 14
UI["72"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["72"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
UI["72"]["BackgroundTransparency"] = 1
UI["72"]["Size"] = UDim2.new(0.82192, 0, 0.70213, 0)
UI["72"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["72"]["Text"] = [[HP]]
UI["72"]["Name"] = [[Text]]
UI["72"]["Position"] = UDim2.new(-0.00475, 0, 0.16347, 0)

-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.Toggles.HpAmount.TextBox \\ --
UI["73"] = Instance.new("TextBox", UI["71"])
UI["73"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["73"]["BorderSizePixel"] = 0
UI["73"]["TextWrapped"] = true
UI["73"]["TextSize"] = 14
UI["73"]["TextScaled"] = true
UI["73"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["73"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["73"]["PlaceholderText"] = [[Health %]]
UI["73"]["Size"] = UDim2.new(0.64887, 0, 0.78723, 0)
UI["73"]["Position"] = UDim2.new(0.35113, 0, 0.11754, 0)
UI["73"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["73"]["Text"] = [[]]
UI["73"]["BackgroundTransparency"] = 0.55

-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.Toggles.HpAmount.TextBox.UIStroke \\ --
UI["74"] = Instance.new("UIStroke", UI["73"])
UI["74"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.Toggles.HpAmount.TextBox.UICorner \\ --
UI["75"] = Instance.new("UICorner", UI["73"])


-- // StarterGui.skullissuesifuusethis.HubFrame.EspTotal.EspMenu.Toggles.HpAmount.TextBox.UIPadding \\ --
UI["76"] = Instance.new("UIPadding", UI["73"])
UI["76"]["PaddingTop"] = UDim.new(0.1, 0)
UI["76"]["PaddingRight"] = UDim.new(0.1, 0)
UI["76"]["PaddingLeft"] = UDim.new(0.1, 0)
UI["76"]["PaddingBottom"] = UDim.new(0.1, 0)

-- // StarterGui.skullissuesifuusethis.DraggableObject \\ --
UI["77"] = Instance.new("ModuleScript", UI["1"])
UI["77"]["Name"] = [[DraggableObject]]

-- // StarterGui.skullissuesifuusethis.MouseFrame \\ --
UI["78"] = Instance.new("Frame", UI["1"])
UI["78"]["Visible"] = false
UI["78"]["BorderSizePixel"] = 0
UI["78"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["78"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
UI["78"]["Size"] = UDim2.new(0.05069, 0, 0.09766, 0)
UI["78"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
UI["78"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["78"]["Name"] = [[MouseFrame]]
UI["78"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.MouseFrame.UICorner \\ --
UI["79"] = Instance.new("UICorner", UI["78"])
UI["79"]["CornerRadius"] = UDim.new(1, 0)

-- // StarterGui.skullissuesifuusethis.MouseFrame.UIStroke \\ --
UI["7a"] = Instance.new("UIStroke", UI["78"])
UI["7a"]["Thickness"] = 2.3

-- // StarterGui.skullissuesifuusethis.MouseFrame.Point1 \\ --
UI["7b"] = Instance.new("Frame", UI["78"])
UI["7b"]["BorderSizePixel"] = 0
UI["7b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["7b"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
UI["7b"]["Size"] = UDim2.new(0.1, 0, 0.1018, 0)
UI["7b"]["Position"] = UDim2.new(0.5, 0, 0.01825, 0)
UI["7b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["7b"]["Name"] = [[Point1]]
UI["7b"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.MouseFrame.Point2 \\ --
UI["7c"] = Instance.new("Frame", UI["78"])
UI["7c"]["BorderSizePixel"] = 0
UI["7c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["7c"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
UI["7c"]["Size"] = UDim2.new(0.1, 0, 0.1018, 0)
UI["7c"]["Position"] = UDim2.new(0.5, 0, 0.97135, 0)
UI["7c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["7c"]["Name"] = [[Point2]]
UI["7c"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.MouseFrame.Point3 \\ --
UI["7d"] = Instance.new("Frame", UI["78"])
UI["7d"]["BorderSizePixel"] = 0
UI["7d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["7d"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
UI["7d"]["Size"] = UDim2.new(0.1, 0, 0.1018, 0)
UI["7d"]["Position"] = UDim2.new(0.965, 0, 0.48232, 0)
UI["7d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["7d"]["Name"] = [[Point3]]
UI["7d"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.MouseFrame.Point4 \\ --
UI["7e"] = Instance.new("Frame", UI["78"])
UI["7e"]["BorderSizePixel"] = 0
UI["7e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["7e"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
UI["7e"]["Size"] = UDim2.new(0.1, 0, 0.1018, 0)
UI["7e"]["Position"] = UDim2.new(0.04, 0, 0.48232, 0)
UI["7e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["7e"]["Name"] = [[Point4]]
UI["7e"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.MouseFrame.Point5 \\ --
UI["7f"] = Instance.new("Frame", UI["78"])
UI["7f"]["BorderSizePixel"] = 0
UI["7f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["7f"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
UI["7f"]["Size"] = UDim2.new(0.1, 0, 0.1018, 0)
UI["7f"]["Position"] = UDim2.new(0.3, 0, 0.30064, 0)
UI["7f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["7f"]["Name"] = [[Point5]]
UI["7f"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.MouseFrame.Point6 \\ --
UI["80"] = Instance.new("Frame", UI["78"])
UI["80"]["BorderSizePixel"] = 0
UI["80"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["80"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
UI["80"]["Size"] = UDim2.new(0.1, 0, 0.1018, 0)
UI["80"]["Position"] = UDim2.new(0.3, 0, 0.69101, 0)
UI["80"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["80"]["Name"] = [[Point6]]
UI["80"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.MouseFrame.Point7 \\ --
UI["81"] = Instance.new("Frame", UI["78"])
UI["81"]["BorderSizePixel"] = 0
UI["81"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["81"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
UI["81"]["Size"] = UDim2.new(0.1, 0, 0.1018, 0)
UI["81"]["Position"] = UDim2.new(0.7, 0, 0.69101, 0)
UI["81"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["81"]["Name"] = [[Point7]]
UI["81"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.MouseFrame.Point8 \\ --
UI["82"] = Instance.new("Frame", UI["78"])
UI["82"]["BorderSizePixel"] = 0
UI["82"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["82"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
UI["82"]["Size"] = UDim2.new(0.1, 0, 0.1018, 0)
UI["82"]["Position"] = UDim2.new(0.7, 0, 0.30064, 0)
UI["82"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["82"]["Name"] = [[Point8]]
UI["82"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.MouseFrame.Point9 \\ --
UI["83"] = Instance.new("Frame", UI["78"])
UI["83"]["BorderSizePixel"] = 0
UI["83"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["83"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
UI["83"]["Size"] = UDim2.new(0.1, 0, 0.1018, 0)
UI["83"]["Position"] = UDim2.new(0.82747, 0, 0.16748, 0)
UI["83"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["83"]["Name"] = [[Point9]]
UI["83"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.MouseFrame.Point10 \\ --
UI["84"] = Instance.new("Frame", UI["78"])
UI["84"]["BorderSizePixel"] = 0
UI["84"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["84"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
UI["84"]["Size"] = UDim2.new(0.1, 0, 0.1018, 0)
UI["84"]["Position"] = UDim2.new(0.13877, 0, 0.16748, 0)
UI["84"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["84"]["Name"] = [[Point10]]
UI["84"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.MouseFrame.Point11 \\ --
UI["85"] = Instance.new("Frame", UI["78"])
UI["85"]["BorderSizePixel"] = 0
UI["85"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["85"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
UI["85"]["Size"] = UDim2.new(0.1, 0, 0.1018, 0)
UI["85"]["Position"] = UDim2.new(0.13877, 0, 0.8333, 0)
UI["85"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["85"]["Name"] = [[Point11]]
UI["85"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.MouseFrame.Point12 \\ --
UI["86"] = Instance.new("Frame", UI["78"])
UI["86"]["BorderSizePixel"] = 0
UI["86"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["86"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
UI["86"]["Size"] = UDim2.new(0.1, 0, 0.1018, 0)
UI["86"]["Position"] = UDim2.new(0.82747, 0, 0.8333, 0)
UI["86"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["86"]["Name"] = [[Point12]]
UI["86"]["BackgroundTransparency"] = 1

-- // StarterGui.skullissuesifuusethis.MouseFrame.UIAspectRatioConstraint \\ --
UI["87"] = Instance.new("UIAspectRatioConstraint", UI["78"])


-- Require G2L wrapper
local G2L_REQUIRE = require;
local G2L_MODULES = {};
local function require(Module:ModuleScript)
    local ModuleState = G2L_MODULES[Module];
    if ModuleState then
        if not ModuleState.Required then
            ModuleState.Required = true;
            ModuleState.Value = ModuleState.Closure();
        end
        return ModuleState.Value;
    end;
    return G2L_REQUIRE(Module);
end

G2L_MODULES[UI["77"]] = {
Closure = function()
    local script = UI["77"]
--[[
	@Author: Spynaz
	@Description: Enables dragging on GuiObjects. Supports both mouse and touch.
	
	For instructions on how to use this module, go to this link:
	https://devforum.roblox.com/t/simple-module-for-creating-draggable-gui-elements/230678
--]]

local UDim2_new = UDim2.new

local UserInputService = game:GetService("UserInputService")

local DraggableObject 		= {}
DraggableObject.__index 	= DraggableObject

-- Sets up a new draggable object
function DraggableObject.new(Object)
	local self 			= {}
	self.Object			= Object
	self.DragStarted	= nil
	self.DragEnded		= nil
	self.Dragged		= nil
	self.Dragging		= false
	
	setmetatable(self, DraggableObject)
	
	return self
end

-- Enables dragging
function DraggableObject:Enable()
	local object			= self.Object
	local dragInput			= nil
	local dragStart			= nil
	local startPos			= nil
	local preparingToDrag	= false
	
	-- Updates the element
	local function update(input)
		local delta 		= input.Position - dragStart
		local newPosition	= UDim2_new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		object.Position 	= newPosition
	
		return newPosition
	end
	
	self.InputBegan = object.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			preparingToDrag = true
			--[[if self.DragStarted then
				self.DragStarted()
			end
			
			dragging	 	= true
			dragStart 		= input.Position
			startPos 		= Element.Position
			--]]
			
			local connection 
			connection = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End and (self.Dragging or preparingToDrag) then
					self.Dragging = false
					connection:Disconnect()
					
					if self.DragEnded and not preparingToDrag then
						self.DragEnded()
					end
					
					preparingToDrag = false
				end
			end)
		end
	end)
	
	self.InputChanged = object.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	self.InputChanged2 = UserInputService.InputChanged:Connect(function(input)
		if object.Parent == nil then
			self:Disable()
			return
		end
		
		if preparingToDrag then
			preparingToDrag = false
			
			if self.DragStarted then
				self.DragStarted()
			end
			
			self.Dragging	= true
			dragStart 		= input.Position
			startPos 		= object.Position
		end
		
		if input == dragInput and self.Dragging then
			local newPosition = update(input)
			
			if self.Dragged then
				self.Dragged(newPosition)
			end
		end
	end)
end

-- Disables dragging
function DraggableObject:Disable()
	self.InputBegan:Disconnect()
	self.InputChanged:Disconnect()
	self.InputChanged2:Disconnect()
	
	if self.Dragging then
		self.Dragging = false
		
		if self.DragEnded then
			self.DragEnded()
		end
	end
end

return DraggableObject

end
}
-- // StarterGui.skullissuesifuusethis.MAmamama \\ --
local function SCRIPT_2()
local script = UI["2"]
	--extremely ugly and unreadable code but nvm :skull:
	local player = game:GetService("Players").LocalPlayer
	local cam = workspace.CurrentCamera
	local gui = script.Parent
	local aimbotframe = gui.MouseFrame
	local mainframe = gui.HubFrame
	local aimbottotal = mainframe.AimbotTotal
	local aimbotmenu = aimbottotal.AimbotMenu
	local toggles = aimbotmenu.Toggles
	local checks = aimbotmenu.Checks
	local Mouse = player:GetMouse()
	local runService = game:GetService("RunService")
	local blacklist = {player.Character}
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = blacklist
	local players = game:GetService("Players")
	local locked = false
	local activated = false
	local mode = "Mouse"
	local uis = game:GetService("UserInputService")
	local debugtesting = nil
	local minhp = 0
	local minhpamount = aimbotmenu.Checks.HpAmount.TextBox
	local hasmouse = false
	local focused = false
	local togglemode = "Hold"
	local lockmode = "Camera"
	local autofire = false
	
	local function movemouse(x:number,y:number)
		if mousemoveabs then
			mousemoveabs(x,y)
		elseif mousemoverel then
			
		end
	end
	
	uis.InputBegan:Connect(function(input)
		if focused == true then
			if input.UserInputType == Enum.UserInputType.Keyboard then
				toggles.LockBind.TextBox.Text = input.KeyCode.Name
				focused = false
				mode = "Key"
				toggles.LockBind.TextBox:ReleaseFocus()
			end
			if input.UserInputType == Enum.UserInputType.MouseButton2 then
				if focused == true then
					toggles.LockBind.TextBox.Text = "RMB"
					mode = "Mouse"
					toggles.LockBind.TextBox:ReleaseFocus()
					focused = false
				end
			end
			if input.UserInputType == Enum.UserInputType.MouseButton3 then
				if focused == true then
					toggles.LockBind.TextBox.Text = "MMB"
					mode = "Mouse"
					toggles.LockBind.TextBox:ReleaseFocus()
					focused = false
				end
			end
		end
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			hasmouse = true
			gui.IgnoreGuiInset = false
			if focused == true then
				toggles.LockBind.TextBox.Text = "LMB"
				mode = "Mouse"
				toggles.LockBind.TextBox:ReleaseFocus()
				focused = false
			end
		end
		if input.UserInputType == Enum.UserInputType.Touch then
			hasmouse = false
		end
	end)
	toggles.LockBind.TextBox.Focused:Connect(function()
		task.wait(0.01)
		focused = true
	end)
	toggles.LockBind.TextBox.FocusLost:Connect(function()
		task.wait(0.01)
		focused = false
	end)
	local changetoggle = toggles.Mode.ChangeToggleMode
	changetoggle.Parent.Arrow.Text = "◣"
	changetoggle.MouseButton1Click:Connect(function()
		if changetoggle.DropFrame.Visible == true then
			changetoggle.DropFrame.Visible = false
		else
			changetoggle.DropFrame.Visible = true
		end
	end)
	for _, option in changetoggle.DropFrame:GetChildren() do
		if option:IsA("TextButton") then
			option.MouseButton1Click:Connect(function()
				local oldtext = option.Text
				option.Text = changetoggle.Text
				changetoggle.Text = oldtext
				option.Parent.Visible = false
				togglemode = oldtext
			end)
		end
	end
	local changetarget = toggles.Target.ChangeToggleMode
	changetarget.Parent.Arrow.Text = "◣"
	changetarget.MouseButton1Click:Connect(function()
		if changetarget.DropFrame.Visible == true then
			changetarget.DropFrame.Visible = false
		else
			changetarget.DropFrame.Visible = true
		end
	end)
	for _, option in changetarget.DropFrame:GetChildren() do
		if option:IsA("TextButton") then
			option.MouseButton1Click:Connect(function()
				local oldtext = option.Text
				option.Text = changetarget.Text
				changetarget.Text = oldtext
				option.Parent.Visible = false
				togglemode = oldtext
			end)
		end
	end
	
	local Lockmode = toggles.LockMode.ChangeToggleMode
	Lockmode.Parent.Arrow.Text = "◣"
	Lockmode.MouseButton1Click:Connect(function()
		if Lockmode.DropFrame.Visible == true then
			Lockmode.DropFrame.Visible = false
		else
			Lockmode.DropFrame.Visible = true
		end
	end)
	for _, option in Lockmode.DropFrame:GetChildren() do
		if option:IsA("TextButton") then
			option.MouseButton1Click:Connect(function()
				local oldtext = option.Text
				option.Text = Lockmode.Text
				Lockmode.Text = oldtext
				option.Parent.Visible = false
				lockmode = oldtext
			end)
		end
	end
	
	checks.Prediction.TextBox.FocusLost:Connect(function()
		local amount = tonumber(checks.Prediction.TextBox.Text)
		if not amount then
			checks.Prediction.TextBox.Text = "0"
			end
	end)
	for _, button in mainframe.ModeSelect:GetChildren() do
		if button:IsA("TextButton") then
			button.MouseButton1Click:Connect(function()
				for _, frame in mainframe:GetChildren() do
					if frame.Name:match("Total") then
						frame.Visible = false
					end
				end
				mainframe[button.Name].Visible = true
				for _, badbutton in button.Parent:GetChildren() do
					if badbutton:IsA("TextButton") then
						badbutton.TextTransparency = 0.5
					end
				end
				button.TextTransparency = 0
			end)
		end
	end
	local rangescrolldown = false
	local function toScale(frame:GuiBase2d)
		local Viewport_Size = workspace.CurrentCamera.ViewportSize
		local LB_Size = frame.AbsoluteSize
		frame.Size = UDim2.new(LB_Size.X/Viewport_Size.X,0,LB_Size.Y/Viewport_Size.Y, 0)
	end
	local function toOffset(frame:GuiBase2d)
		local LB_Size = frame.AbsoluteSize
		frame.Size = UDim2.new(0, LB_Size.X, 0, LB_Size.Y)
	end
	local function idkwhatthisis(Frame)
	local Camera = workspace.CurrentCamera
	
		--> removing the offset (x, y) from both the mouse and frame position
		local mousePos = uis:GetMouseLocation() - Frame.AbsolutePosition
	local frameBottomRight = Frame.AbsoluteSize
	
	local convertedMouse = UDim2.fromScale(
		mousePos.X / frameBottomRight.X,
		mousePos.Y / frameBottomRight.Y
		)
		return convertedMouse
	end
	minhpamount.FocusLost:Connect(function()
		local amount = tonumber(minhpamount.Text)
		if amount then
			minhp = amount
		else
			minhpamount.Text = ""
		end
	end)
	local bindtable = {
		["RMB"] = "MouseButton2",
		["LMB"] = "MouseButton1",
		["MMB"] = "MouseButton3",
	}
	function correct()
		local text = toggles.LockBind.TextBox.Text
		for	key, correct in bindtable do
			if text == key then
				return correct
			end
		end
	end
	local framedrag = require(gui.DraggableObject).new(gui.HubFrame):Enable()
	local lockedplayer
	for _, othergui in game:GetService("CoreGui"):GetChildren() do
		if othergui.Name == gui.Name then
			if othergui == gui then continue end
			othergui:Destroy()
		end
	end
	local function togglebutton(button:TextButton,check:BoolValue)
		if check then
			if button.BackgroundTransparency == 0 then
				return true
			else
				return false
			end
		end
		if button.BackgroundTransparency == 0 then
			button.BackgroundTransparency = 1
		else
			button.BackgroundTransparency = 0
		end
	end
	-- AIMBOT--
	local checkthread = nil
	local function unlock(stayactive)
		if stayactive then
			activated = true
		else
			activated = false
		end
		locked = false
		lockedplayer = nil
	end
	local aimbottoggle = toggles.AimbotToggle
	aimbottoggle.Toggle.MouseButton1Click:Connect(function()
		if aimbottoggle.Toggle.BackgroundTransparency == 0 then
			aimbottoggle.Toggle.BackgroundTransparency = 1
			aimbotframe.Visible = false
			activated = false
			locked = false
			lockedplayer = nil
			aimbotframe.UIStroke.Color = Color3.fromRGB(0,0,0)
		else
			aimbottoggle.Toggle.BackgroundTransparency = 0
			aimbotframe.Visible = true
			activated = false
		end
	end)
	checks.TargetBots.Toggle.MouseButton1Click:Connect(function()
		togglebutton(checks.TargetBots.Toggle)
	end)
	toggles.Autofire.Toggle.MouseButton1Click:Connect(function()
		togglebutton(toggles.Autofire.Toggle)
		if 	togglebutton(toggles.Autofire.Toggle,true) then
			autofire = true
		else
			autofire = false
		end
	end)
	checks.TeamCheck.Toggle.MouseButton1Click:Connect(function()
		togglebutton(checks.TeamCheck.Toggle)
		if togglebutton(checks.TeamCheck.Toggle,true) then
			for _, p in players:GetPlayers() do
				if p.Team == player.Team then
					table.insert(blacklist,p.Character)
				end
			end
		else
			blacklist = {player.Character}
		end
	end)
	
	uis.InputBegan:Connect(function(input,bool)
		if mode == "Key" then
			if input.KeyCode.Name == toggles.LockBind.TextBox.Text then
				if aimbottoggle.BackgroundTransparency == 0 then return end
				if activated == true then
					activated = false
					locked = false
					lockedplayer = nil
					aimbotframe.UIStroke.Color = Color3.fromRGB(0,0,0)
				else
					activated = true
					aimbotframe.UIStroke.Color = Color3.fromRGB(255,0,0)
				end
				end
		elseif mode == "Mouse" then
				local mousebutton = correct()
				if not mousebutton then return end
				if input.UserInputType == Enum.UserInputType[correct()] then
					if togglemode == "Toggle" then
						if activated then
							activated = false
							locked = false
							lockedplayer = nil
							aimbotframe.UIStroke.Color = Color3.fromRGB(0,0,0)
							return
						end
					end
					if aimbottoggle.BackgroundTransparency == 0 then return end
					activated = true
					aimbotframe.UIStroke.Color = Color3.fromRGB(255,0,0)
			end
			end
	end)
	uis.InputEnded:Connect(function(input,bool)
		if togglemode == "Toggle" then return end
		if mode == "Mouse" then
		local mousebutton = correct()
			if not mousebutton then return end
		end
		if input.KeyCode.Name == toggles.LockBind.TextBox.Text then
			if aimbottoggle.BackgroundTransparency == 0 then return end
			if activated == true then
				activated = false
				locked = false
				lockedplayer = nil
				aimbotframe.UIStroke.Color = Color3.fromRGB(0,0,0)
				return end
		end
		if correct() then
		if input.UserInputType == Enum.UserInputType[correct()] then
			activated = false
			locked = false
			lockedplayer = nil
			aimbotframe.UIStroke.Color = Color3.fromRGB(0,0,0)
			end
		end
	end)
	
	local function canceldispls(thread:thread)
		task.cancel(thread)
		thread = nil
	end
	local function prediction(target:Part,range:number)
		return target.CFrame.Position + target.AssemblyLinearVelocity * range
	end
	
	local mousemovethread = nil
	local function mousething()
		if hasmouse then
			aimbotframe.Position = UDim2.fromOffset(Mouse.X,Mouse.Y)
			end
		if not  activated then return end
		if aimbottoggle.Toggle.BackgroundTransparency == 1 then return end
		if locked then
			if lockedplayer then
				if lockmode == "Camera" then
					cam.CFrame = CFrame.lookAt(cam.CFrame.Position,prediction(lockedplayer[changetarget.Text],tonumber(checks.Prediction.TextBox.Text)) or lockedplayer[changetarget.Text].CFrame.Position)
					if autofire then
						if mouse1click then
							mouse1click()
						end
					end
				elseif lockmode == "Mouse" then
					local position,screen = cam.WorldToScreenPoint(cam,prediction(lockedplayer[changetarget.Text],tonumber(checks.Prediction.TextBox.Text)) or lockedplayer[changetarget.Text].CFrame.Position)
					if screen then
						movemouse(position.X,position.Y)
						if autofire then
							if mouse1click then
								mouse1click()
							end
						end
						if not checkthread then
							checkthread = task.spawn(function()
								lockedplayer.Humanoid.HealthChanged:Connect(function(hp)
									if hp <= minhp then
										unlock(true)
										canceldispls(checkthread)
									end
								end)
							end)
						end
					end
				elseif lockmode == "Dynamic" then
					if uis.MouseBehavior == Enum.MouseBehavior.LockCenter then
						cam.CFrame = CFrame.lookAt(cam.CFrame.Position,prediction(lockedplayer[changetarget.Text],tonumber(checks.Prediction.TextBox.Text)) or lockedplayer[changetarget.Text].CFrame.Position)
					elseif player.Character.Head.LocalTransparencyModifier == 1 then
						cam.CFrame = CFrame.lookAt(cam.CFrame.Position,prediction(lockedplayer[changetarget.Text],tonumber(checks.Prediction.TextBox.Text)) or lockedplayer[changetarget.Text].CFrame.Position)
					else
						local position,screen = cam.WorldToScreenPoint(cam,prediction(lockedplayer[changetarget.Text],tonumber(checks.Prediction.TextBox.Text)) or lockedplayer[changetarget.Text].CFrame.Position)
						if screen then
							movemouse(position.X,position.Y)
							if autofire then
								if mouse1click then
									mouse1click()
								end
							end
							if not checkthread then
								checkthread = task.spawn(function()
									lockedplayer.Humanoid.HealthChanged:Connect(function(hp)
										if hp <= minhp then
											unlock(true)
											canceldispls(checkthread)
										end
									end)
								end)
							end
						end
					end
				end
			end
			return
		end
		local length = 500
		local unitRay = cam:ScreenPointToRay(aimbotframe.AbsolutePosition.X, aimbotframe.AbsolutePosition.Y)
		local extendedRay = Ray.new(unitRay.Origin, unitRay.Direction * length)
		local raycast = workspace:Raycast(extendedRay.Origin,extendedRay.Direction,params)
		if raycast then
			local hitplayer = players:GetPlayerFromCharacter(raycast.Instance:FindFirstAncestorOfClass("Model")) or debugtesting
			local _,screen = cam.WorldToScreenPoint(cam,raycast.Instance.Position)
			if screen then
			if hitplayer then
				if hitplayer ~= player then
					locked = true
					lockedplayer = hitplayer
					end
				end
				end
		else
		end
		for _, point in aimbotframe:GetChildren() do
			if point.Name:match("Point") then
				local length = 200
				local unitRay = cam:ScreenPointToRay(point.AbsolutePosition.X, point.AbsolutePosition.Y)
	
				local extendedRay = Ray.new(unitRay.Origin, unitRay.Direction * length)
				local raycast = workspace:Raycast(extendedRay.Origin,extendedRay.Direction,params)
				if raycast then
					local hitplayer = players:GetPlayerFromCharacter(raycast.Instance:FindFirstAncestorOfClass("Model")) or debugtesting
					local hum = raycast.Instance.Parent:FindFirstChildOfClass("Humanoid") or raycast.Instance.Parent.Parent:FindFirstChildOfClass("Humanoid")
					local _,screen = cam.WorldToScreenPoint(cam,raycast.Instance.Position)
					if screen then
						if hitplayer then
							if hitplayer.Character.Humanoid.Health <= minhp then return end
							if hitplayer ~= player then
								locked = true
								lockedplayer = hitplayer.Character
							end
						elseif hum and togglebutton(checks.TargetBots.Toggle,true) then
							if hum.Health <= minhp then return end
							if hum.Parent ~= player.Character then
								locked = true
								lockedplayer = hum.Parent
						end
						end
				end
			end
			end
		end
	end
	--[[task.spawn(function()
		while true do
			local rand = math.random(1,10)
			if rand == 1 then
				task.wait()
			end
			mousething()
		end
	end)]]
	
	runService.RenderStepped:Connect(mousething)
	
	
	-- ESP --
	local espinstance = nil
	local esptotal = mainframe.EspTotal
	local espmenu = esptotal.EspMenu
	local esptoggles = espmenu.Toggles
	local highlight
	local deletehighlight = {}
	local function addhighlight(plr:Model)
		if not togglebutton(esptoggles.EnableEsp.Toggle,true) then return end
		if plr == player.Character then return end
		local highlight = Instance.new("Highlight")
		highlight.Parent = plr
		highlight.FillColor = players:GetPlayerFromCharacter(plr).TeamColor.Color
		highlight.FillTransparency = 1
		highlight.OutlineColor = players:GetPlayerFromCharacter(plr).TeamColor.Color
			table.insert(deletehighlight,highlight)
	end
		esptoggles.EnableEsp.Toggle.MouseButton1Click:Connect(function()
			togglebutton(esptoggles.EnableEsp.Toggle)
			if togglebutton(esptoggles.EnableEsp.Toggle,true) then
				espinstance = task.spawn(function()
					for _, addto in players:GetPlayers() do
						if addto.Character then
							addhighlight(addto.Character)
						end
						addto.CharacterAdded:Connect(function()
							addhighlight(addto.Character)
						end)
					end
					players.PlayerAdded:Connect(function(otherplr)
						otherplr.CharacterAdded:Connect(function(otherplrchar)
							addhighlight(otherplrchar)
						end)
					end)
				end)
			else
				task.cancel(espinstance)
				espinstance = nil
				for _, highlight in deletehighlight do
					highlight:Destroy()
				end
	
			end
	end)
	gui.Destroying:Connect(function()
		if espinstance then
			task.cancel(espinstance)
			espinstance = nil
			for _, highlight in deletehighlight do
				highlight:Destroy()
			end
			if mousemovethread then
				task.cancel(mousemovethread)
				mousemovethread = nil
			end
		end
	end)
end
task.spawn(SCRIPT_2)

return UI["1"], require;
