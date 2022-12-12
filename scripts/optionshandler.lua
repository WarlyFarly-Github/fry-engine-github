local scripts = {}

function mysplit(inputstr, sep)

    if sep == nil then
            sep = "%s"
    end

    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end

    return t

end

function setUpList(file)

    local data = mysplit(getTextFromFile('./data/Settings/Saves/'..file..'.txt'), '\n')

    for i = 1, #data do
        if not (i == table.getn(data)) then
            data[i] = data[i]:sub(1, -2)
        end
    end

    return data

end

function loadScript(script, canremove)
	addLuaScript('data/Settings/Scripts/'..script)
	table.insert(scripts, {script, canremove})
end

function onCreate()

	if songName == 'Settings' then
		close(true)
	end

	initSaveData('FunkinLuaSettings', 'psychenginemods/BombasticTom')
	
	if not getDataFromSave('FunkinLuaSettings', 'pnoteskin') then

            setDataFromSave('FunkinLuaSettings', 'pnoteskin', 'Vanilla')
            setDataFromSave('FunkinLuaSettings', 'onoteskin', 'Vanilla')
            setDataFromSave('FunkinLuaSettings', 'bfchar', 'BF')
            setDataFromSave('FunkinLuaSettings', 'oppPlay', false)
            setDataFromSave('FunkinLuaSettings', 'eduardo', false)

	    flushSaveData('FunkinLuaSettings')

        end

	initSaveData('FunkinLuaSettings', 'psychenginemods/BombasticTom')
	
	--[[ if not (getDataFromSave('FunkinLuaSettings', 'hitsound') == 'None') then
		--myHitSound = getDataFromSave('FunkinLuaSettings', 'hitsound')
		addLuaScript('optionsdata/hitsound')
	end --]]

	if getDataFromSave('FunkinLuaSettings', 'oppPlay') then
		loadScript('PlayerToOpponent', false)
	end

	if getDataFromSave('FunkinLuaSettings', 'eduardo') then
		loadScript('eduardo', true)
	end

	if getDataFromSave('FunkinLuaSettings', 'gmode') ~= 'None' then
		loadScript('Game Mode', true)
	end
	
	if getDataFromSave('FunkinLuaSettings', 'LowQFORL') then
		loadScript('opt', true)
	end

	loadScript('notesize', true)
	loadScript('underlay', true)
	
	for i, option in pairs(setUpList('optionsSC')) do
		loadScript(mysplit(option, '::')[2], mysplit(option, '::')[1])
	end
end

function onCreatePost()

	changeNoteSkin(getDataFromSave('FunkinLuaSettings', 'pnoteskin'), 'player')
	changeNoteSkin(getDataFromSave('FunkinLuaSettings', 'onoteskin'), 'opponent')
	
	if not getDataFromSave('FunkinLuaSettings', 'bfchar') == 'bf' then
		triggerEvent('Change Character', 0, getDataFromSave('FunkinLuaSettings', 'bfchar'))
	end
		
	for script, i in pairs(scripts) do
		if script[2] then
			removeLuaScript(script[1])
		end

		scripts[i] = nil
	end
end

local allowedNoteTypes = {
	['No Animation'] = true,
	[''] = true
}

function changeNoteSkin(skin, player)
    if (skin == 'Vanilla') then
	return;
    end

	for i = 0, getProperty(player..'Strums.length')-1 do
		setPropertyFromGroup(player..'Strums', i, 'texture', 'FunkinLUAOptions/noteskins/Normal/'..skin)
	end

	for i = 0, getProperty('unspawnNotes.length')-1 do
		if allowedNoteTypes[getPropertyFromGroup('unspawnNotes', i, 'noteType')] then
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') and player == 'player' then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'FunkinLUAOptions/noteskins/Normal/'..skin) -- Currently Pixel notes do not work as I didn't code them to do.
				--setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteskins/dokisplash') soon mb?
			elseif not getPropertyFromGroup('unspawnNotes', i, 'mustPress') and player == 'opponent' then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'FunkinLUAOptions/noteskins/Normal/'..skin)
			end
		end
	end
end

-- It's midnite I am too lazy to explain this