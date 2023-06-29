local lib = LibStub("CustomNames")
local Translit = LibStub("LibTranslit-1.0")
local translitMark = "!"


local function RaidCooldowns_Bar_TextName(eventName,bar,gsub_data,barData)
    --actual name is barData.fullName or barData.name [w/o server]
	local customName = Translit:Transliterate(lib.Get(barData.fullName), translitMark) 
	--local realm = barData.fullName:match("^.-%-(.-)$")
	if customName ~= gsub_data.name then 
		gsub_data.name = customName
	end
end
GMRT.F:RegisterCallback("RaidCooldowns_Bar_TextName", RaidCooldowns_Bar_TextName)


local function Note_UpdateText(eventName,noteFrame)
    local text = noteFrame.text:GetText()
	if not text then return end
	local words = {}
	for  colorCode, word in text:gmatch("|c(%x%x%x%x%x%x%x%x)(.-)|r") do -- match all color coded phrases
		if not words[word] then
			words[word] = { 
				colorCode = colorCode,
				translatedWord = lib.Get(word)
			}
		end
		if words[word].translatedWord ~= word then
			text = text:gsub("|c%x%x%x%x%x%x%x%x"..word.."|r", "|c"..words[word].colorCode..words[word].translatedWord.."|r")
		end
	end
	if text ~= noteFrame.text:GetText() then
   		noteFrame.text:SetText(text)
	end
end
GMRT.F:RegisterCallback("Note_UpdateText", Note_UpdateText)
