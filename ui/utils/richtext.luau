-- i did not use ai ok yes gud pls z
local markdown = {}

-- Type definition for IntelliSense/Type Checking
export type RichTextFont = {
	color: Color3?,
	size: number?,
	face: string?, -- Font name (e.g. "GothamBold")
	family: string?, -- Asset ID string
	weight: number?, -- 100 to 900
	transparency: number?, -- 0 to 1
}

export type RichTextStroke = {
	color: Color3?,
	thickness: number?,
	transparency: number?,
	joins: Enum.LineJoinMode?,
	--cap: Enum.LineCapMode?, -- Note: Roblox supports 'cap' in UIStroke, mapped here for consistency
}

export type RichTextProps = {
	font: RichTextFont?,
	stroke: RichTextStroke?,

	bold: boolean?,
	italic: boolean?,
	underline: boolean?,
	strikethrough: boolean?,
	uppercase: boolean?,
	smallcaps: boolean?,
	comment: string?, -- For <!-- -->
}

-- Helper to convert Enum or other types to string attributes
local function getAttributeString(key: string, value: any): string
	if typeof(value) == "Color3" then
		return string.format(' %s="#%s"', key, value:ToHex())
	elseif typeof(value) == "EnumItem" then
		return string.format(' %s="%s"', key, value.Name)
	elseif value ~= nil then
		return string.format(' %s="%s"', key, tostring(value))
	end
	return ""
end

-- Main function to apply a table of tags to a string
function markdown:Apply(text: string, props: RichTextProps) : string
	local open = ""
	local close = ""

	-- 1. Handle Complex Tags (Stroke)
	-- Stroke usually wraps everything else to ensure the outline covers the text style
	if props.stroke then
		local attrs = ""
		attrs ..= getAttributeString("color", props.stroke.color)
		attrs ..= getAttributeString("thickness", props.stroke.thickness)
		attrs ..= getAttributeString("transparency", props.stroke.transparency)
		attrs ..= getAttributeString("joins", props.stroke.joins)
		attrs ..= getAttributeString("cap", props.stroke.cap)

		open ..= `<stroke{attrs}>`
		close = `</stroke>` .. close
	end

	-- 2. Handle Complex Tags (Font)
	if props.font then
		local attrs = ""
		attrs ..= getAttributeString("color", props.font.color)
		attrs ..= getAttributeString("size", props.font.size)
		attrs ..= getAttributeString("face", props.font.face)
		attrs ..= getAttributeString("family", props.font.family)
		attrs ..= getAttributeString("weight", props.font.weight)
		attrs ..= getAttributeString("transparency", props.font.transparency)

		open ..= `<font{attrs}>`
		close = `</font>` .. close
	end

	-- 3. Handle Boolean Wrappers
	-- Map property names to their specific tags
	local booleanTags = {
		bold = "b",
		italic = "i",
		underline = "u",
		strikethrough = "s",
		uppercase = "uc",
		smallcaps = "sc"
	}

	for propName, tagName in pairs(booleanTags) do
		if props[propName] == true then
			open ..= `<{tagName}>`
			close = `</{tagName}>` .. close
		end
	end

	-- 4. Handle Comments (Hidden text)
	if props.comment then
		open = `<!-- {props.comment} -->` .. open
	end

	return open .. text .. close
end

-- Legacy/Direct helpers if you still want them
function markdown:Color(text: string, color: Color3)
	return self:Apply(text, { font = { color = color } })
end

function markdown:Size(text: string, size: number)
	return self:Apply(text, { font = { size = size } })
end

function markdown:Underline(text: string)
	return self:Apply(text, { underline = true })
end

-- Utility: Remove all tags
function markdown:Clean(str: string)
	return (str:gsub("<[^<>]->", ""))
end
local RichTextStr = {}
type RichTextString = setmetatable<{
	props: RichTextProps
},typeof(RichTextStr)>

RichTextStr.__index = RichTextStr

function markdown:newString(text: string, props: RichTextProps) : RichTextString
	assert(props,"missing argument #2 'props'")
	local self = setmetatable({},RichTextStr)
	self.props = props
	self.text = text
	return self
end

RichTextStr.__tostring = function(self)
	return markdown:Apply(self.text,self.props)
end

return markdown