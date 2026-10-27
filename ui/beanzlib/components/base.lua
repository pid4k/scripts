const BaseElement = {}
BaseElement.__index = BaseElement

function BaseElement.new(options, elementType)
	options = options or {}

	const self = setmetatable({
		Type = elementType,
		Name = options.Name or options.Text or elementType,
		Flag = options.Flag or options.Name or options.Text,
		Save = options.Save ~= false,
		Instance = nil,
		Label = nil,
		Tab = nil,
		Window = nil,
		Destroyed = false,
	}, BaseElement)

	self._connections = {}
	self._cleanups = {}

	return self
end

function BaseElement:AddConnection(connection: RBXScriptConnection): RBXScriptConnection
	table.insert(self._connections, connection)
	return connection
end

function BaseElement:AddCleanup(cleanup: () -> ())
	table.insert(self._cleanups, cleanup)
end

function BaseElement:GetFlag(): string?
	return self.Flag
end

function BaseElement:SetFlag(flag: string?)
	if self.Flag == flag then
		return
	end
	if self.Window and self.Flag and self.Window.Elements[self.Flag] == self then
		self.Window.Elements[self.Flag] = nil
	end
	self.Flag = flag
	if self.Window and flag then
		self.Window.Elements[flag] = self
	end
end

function BaseElement:SetSave(save: boolean)
	self.Save = save == true
end

function BaseElement:CanSave(): boolean
	return self.Save == true and self.Flag ~= nil
end

function BaseElement:GetValue(): any
	return nil
end

function BaseElement:SetValue(_value: any)
	-- Implemented by elements that store a value.
end

function BaseElement:Export(): any
	if not self:CanSave() then
		return nil
	end
	return self:GetValue()
end

function BaseElement:Import(value: any)
	if value ~= nil then
		self:SetValue(value)
	end
end

function BaseElement:SetText(text: string)
	self.Label.Text = text
end

function BaseElement:SetVisible(visible: boolean)
	self.Instance.Visible = visible
end

function BaseElement:IsVisible(): boolean
	return self.Instance.Visible
end

function BaseElement:ToggleVisible()
	self:SetVisible(not self:IsVisible())
end

function BaseElement:Destroy()
	if self.Destroyed then
		return
	end
	self.Destroyed = true

	for _, connection in self._connections do
		connection:Disconnect()
	end
	table.clear(self._connections)

	for _, cleanup in self._cleanups do
		cleanup()
	end
	table.clear(self._cleanups)

	if self.Window and self.Flag and self.Window.Elements[self.Flag] == self then
		self.Window.Elements[self.Flag] = nil
	end

	if self.Instance then
		self.Instance:Destroy()
		self.Instance = nil
	end
end

return BaseElement
