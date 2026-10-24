local BaseElement = {}
BaseElement.__index = BaseElement
const vide = require("../../vide")
const defaultTheme = require("../../utils/themes/default")
function BaseElement.new(options, elementType: string)
	options = options or {}
	local flag = options.Flag or options.Name or options.Text

	local self = {
		Type = elementType,
		Name = options.Name or options.Text or elementType,
		Flag = flag,
		Save = if options.Save ~= nil then (options.Save == true) else true,
		Instance = nil,
		Tab = nil,
		Window = nil,
	}

	return setmetatable(self, BaseElement)
end

function BaseElement:GetFlag(): string?
	return self.Flag
end

function BaseElement:SetFlag(flag: string)
	self.Flag = flag
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

function BaseElement:SetValue(value: any)
	-- To be implemented by subclasses
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

return BaseElement
