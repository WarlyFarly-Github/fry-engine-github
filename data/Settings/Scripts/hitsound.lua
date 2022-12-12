function onCreate()

	initSaveData('FunkinLuaSettings', 'psychenginemods/BombasticTom')
	local hitsound = getDataFromSave('FunkinLuaSettings', 'hitsound')

	precacheSound('hitsounds/'..hitsound)

end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if not isSustainNote then
		playSound('hitsounds/'..hitsound, 3)
	end
end

-- WIP TRYNA MAKE HITSOUNDS IMPORTABLE (USE PSYCH'S HITSOUNDS FOR NOW)