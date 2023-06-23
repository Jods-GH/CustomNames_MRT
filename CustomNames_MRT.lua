local lib = LibStub("CustomNames")
local Translit = LibStub("LibTranslit-1.0")
local translitMark = "!"


local function RaidCooldowns_Bar_TextName(eventName,bar,gsub_data,barData)
    --actual name is barData.fullName or barData.name [w/o server]
    gsub_data.name = lib.Get(barData.fullName)
	print(barData.fullName)
end
GMRT.F:RegisterCallback("RaidCooldowns_Bar_TextName", RaidCooldowns_Bar_TextName)


local function Note_UpdateText(eventName,noteFrame)
    local text = noteFrame.text:GetText()
    --do something
	print(text)
	print(GMRT.note)
    noteFrame.text:SetText(text)
end
GMRT.F:RegisterCallback("Note_UpdateText", Note_UpdateText)
