const vide = require("../../vide")
const Animation = require("../animation")
const scope = require("../scope")
const frame = require("../primitives/frame")
const textbutton = require("../primitives/textbutton")
const textlabel = require("../primitives/textlabel")
const uipadding = require("../primitives/uipadding")
const uistroke = require("../primitives/uistroke")

const FADE_IN = {
	duration = 0.15,
	easing = "quadOut",
}
const FADE_OUT = {
	duration = 0.12,
	easing = "quadOut",
}

return function(window)
	const holder = frame {
		Parent = window.ScreenGui,
		Name = "Notifications",
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, -16, 1, -16),
		Size = UDim2.new(0, 300, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 200,
	}

	vide.create "UIListLayout" {
		Parent = holder,
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
	}

	const Notifier = {}
	local nextOrder = 0
	local records = {}

	local function disconnectRecord(record)
		for _, connection in record.Connections do
			connection:Disconnect()
		end
		table.clear(record.Connections)
	end

	local function destroyRecord(record)
		disconnectRecord(record)
		if record.DestroyScope then
			record.DestroyScope()
			record.DestroyScope = nil
		end
		record.Group:Destroy()
	end

	function Notifier:Notify(text, duration)
		local options
		if typeof(text) == "table" then
			options = text
		else
			options = {
				Text = text,
				Duration = duration,
			}
		end

		const message = tostring(options.Text or "")
		const life = if options.Duration ~= nil then options.Duration else 4
		const closeHovered = vide.source(false)

		const destroyScope, ui = scope(function()
			const group = vide.create "CanvasGroup" {
				Parent = holder,
				Name = "Notification",
				Size = UDim2.new(0, 300, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				GroupTransparency = 1,
				LayoutOrder = nextOrder,
			}

			const card = frame {
				Parent = group,
				Name = "Card",
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = function()
					const theme = window:GetTheme()
					return theme.FrameBackground or theme.WindowBackground
				end,
				BorderSizePixel = 0,
				ZIndex = 1,
			}

			vide.create "UICorner" {
				Parent = card,
				CornerRadius = UDim.new(0, 8),
			}
			uistroke {
				Parent = card,
				Color = function()
					return window:GetTheme().ElementStroke
				end,
				Thickness = 1,
				StrokeSizingMode = Enum.StrokeSizingMode.FixedSize,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			}

			const accent = frame {
				Parent = card,
				Name = "Accent",
				Size = UDim2.new(0, 3, 1, 0),
				BackgroundColor3 = function()
					return options.Color or window:GetTheme().AccentColor
				end,
				BorderSizePixel = 0,
				ZIndex = 2,
			}
			vide.create "UICorner" {
				Parent = accent,
				CornerRadius = UDim.new(1, 0),
			}

			const content = frame {
				Parent = card,
				Name = "Content",
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
			}

			uipadding {
				Parent = content,
				PaddingTop = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 12),
				PaddingLeft = UDim.new(0, 16),
				PaddingRight = UDim.new(0, 36),
			}
			vide.create "UIListLayout" {
				Parent = content,
				Padding = UDim.new(0, 4),
				SortOrder = Enum.SortOrder.LayoutOrder,
			}

			local titleLabel = nil
			if options.Title then
				titleLabel = textlabel {
					Parent = content,
					BackgroundTransparency = 1,
					Name = "Title",
					Text = tostring(options.Title),
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextWrapped = true,
					TextSize = 14,
					TextScaled = false,
					FontFace = function()
						return window:GetTheme().BoldFont
					end,
					TextColor3 = function()
						return window:GetTheme().TextPrimaryColor
					end,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					ZIndex = 3,
				}
			end

			const messageLabel = textlabel {
				Parent = content,
				BackgroundTransparency = 1,
				Name = "Message",
				Text = message,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				TextWrapped = true,
				TextSize = 13,
				TextScaled = false,
				FontFace = function()
					return window:GetTheme().MainFont
				end,
				TextColor3 = function()
					const theme = window:GetTheme()
					return theme.TextSecondaryColor or theme.TextPrimaryColor
				end,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				ZIndex = 3,
			}

			const closeButton = textbutton {
				Parent = card,
				AutoButtonColor = false,
				Name = "Close",
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -8, 0, 8),
				Size = UDim2.fromOffset(24, 24),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "X",
				TextSize = 12,
				TextScaled = false,
				FontFace = function()
					return window:GetTheme().MainFont
				end,
				TextColor3 = function()
					const theme = window:GetTheme()
					return if closeHovered()
						then theme.TextPrimaryColor
						else (theme.TextSecondaryColor or theme.TextPrimaryColor)
				end,
				ZIndex = 4,
			}

			return {
				Group = group,
				Title = titleLabel,
				Message = messageLabel,
				CloseButton = closeButton,
			}
		end)

		nextOrder += 1

		const record = {
			Group = ui.Group,
			Title = ui.Title,
			Message = ui.Message,
			CloseButton = ui.CloseButton,
			DestroyScope = destroyScope,
			Connections = {},
			Timeout = nil,
			FadeCleanup = nil,
			Dismissed = false,
		}

		local function dismiss()
			if record.Dismissed then
				return
			end
			record.Dismissed = true

			if record.Timeout then
				task.cancel(record.Timeout)
				record.Timeout = nil
			end
			disconnectRecord(record)
			if record.FadeCleanup then
				record.FadeCleanup()
				record.FadeCleanup = nil
			end

			record.FadeCleanup = Animation.Tween(ui.Group, { GroupTransparency = 1 }, FADE_OUT, function()
				record.FadeCleanup = nil
				destroyRecord(record)
				const index = table.find(records, record)
				if index then
					table.remove(records, index)
				end
			end)
		end

		record.Dismiss = dismiss
		table.insert(records, record)

		table.insert(record.Connections, ui.CloseButton.Activated:Connect(dismiss))
		table.insert(record.Connections, ui.CloseButton.MouseEnter:Connect(function()
			closeHovered(true)
		end))
		table.insert(record.Connections, ui.CloseButton.MouseLeave:Connect(function()
			closeHovered(false)
		end))

		record.FadeCleanup = Animation.Tween(ui.Group, { GroupTransparency = 0 }, FADE_IN, function()
			record.FadeCleanup = nil
		end)

		if life > 0 then
			record.Timeout = task.delay(life, function()
				record.Timeout = nil
				dismiss()
			end)
		end

		return record
	end

	function Notifier:Clear()
		for _, record in table.clone(records) do
			record.Dismiss()
		end
	end

	function Notifier:Destroy()
		for _, record in table.clone(records) do
			record.Dismissed = true
			if record.Timeout then
				task.cancel(record.Timeout)
				record.Timeout = nil
			end
			if record.FadeCleanup then
				record.FadeCleanup()
			end
			destroyRecord(record)
		end
		table.clear(records)
		holder:Destroy()
	end

	return Notifier
end
