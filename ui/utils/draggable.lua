const UserInputService = game:GetService("UserInputService")

local function makeDraggable(handle: GuiObject, target: GuiObject?)
	local targetGui: GuiObject = target or handle
	local dragging = false
	local dragStart = Vector3.zero
	local startPos = targetGui.Position

	local conn1 = handle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = targetGui.Position

			local connEnd: RBXScriptConnection?
			connEnd = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
					if connEnd then
						connEnd:Disconnect()
						connEnd = nil
					end
				end
			end)
		end
	end)

	local conn2 = UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			targetGui.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)

	return function()
		dragging = false
		if conn1 then
			conn1:Disconnect()
			conn1 = nil
		end
		if conn2 then
			conn2:Disconnect()
			conn2 = nil
		end
	end
end

return makeDraggable
