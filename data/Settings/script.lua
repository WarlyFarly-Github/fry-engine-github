local countdownstarted = false
local selection = 1
local chosenterm = 1
local curPage = 1

function tableslice(tbl, first, last, step)
  local sliced = {}

  for i = first or 1, last or #tbl, step or 1 do
    sliced[#sliced+1] = tbl[i]
  end

  return sliced
end

function imagePath(image, dir)
	return 'FunkinLUAOptions/'..dir..'/'..image
end

function returnNum(list, item)

    local index={}

    for k,v in pairs(list) do
           index[v]=k
    end

    return index[item]

end

function tostrfb(bool)

    if bool then
        return 'true'
    else
        return 'false'
    end

end

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

function onCreate()

    initSaveData('FunkinLuaSettings', 'psychenginemods/BombasticTom')

    if getDataFromSave('FunkinLuaSettings', 'pnoteskin') == '' then -- ignore this bucko! saving it for later plans :evil:
        setDataFromSave('FunkinLuaSettings', 'pnoteskin', 'Vanilla')
        setDataFromSave('FunkinLuaSettings', 'onoteskin', 'Vanilla')
        setDataFromSave('FunkinLuaSettings', 'bfchar', 'BF')
        setDataFromSave('FunkinLuaSettings', 'oppPlay', false)
        setDataFromSave('FunkinLuaSettings', 'eduardo', false)

	flushSaveData('FunkinLuaSettings')
    end


    noteskins = setUpList('skins')
    hitsounds = setUpList('hitsounds')

    options = {
        {'Player Noteskin', 'pnoteskin', 'string', noteskins[1], noteskins},
        {'Opponent Noteskin', 'onoteskin', 'string', noteskins[1], noteskins},
	{'Note Size', 'noteS', 'number', 0.7, 0.4, 0.9, 0.01},
        {'Choose your Character', 'bfchar', 'string', 'BF', {'BF', 'Pico-Player', 'Eduardo'}},
	{'Game Mode', 'gmode', 'string', 'None', {'None', 'Blammed Lights Mode', 'Swag Mode', 'Vintage Mode', 'Peace Mode'}},
	{'Lane Underlay Transparency', 'lt', 'number', 0, 0, 1, 0.1},
        {'Play as Opponent (BETA)', 'oppPlay', 'bool'},
        -- {'Select your Hitsound', 'hitsound', 'string', hitsounds[1], hitsounds}, still doesn't work :P
        {'well well well', 'eduardo', 'bool'}
    }

	softcodes = setUpList('optionsSC')
	for i=1, #softcodes do
		local crapVar = mysplit(softcodes[i], '::')
		table.remove(crapVar, 1)
		if crapVar[3] == 'string' then
			if crapVar[5] ~= nil then
				crapVar[5] = mysplit(crapVar[5], ',')
			else
				crapVar[3] = 'bool'
			end
		end
        if crapVar[3] == 'number' then
            for value=4, #crapVar do
                crapVar[value] = tonumber(crapVar[value])
            end
        end
		table.insert(options, crapVar)
	end
	
    for i, optionsdata in pairs(options) do
        if optionsdata[4] == nil then
            if optionsdata[3] == 'bool' then
                options[i][4] = false
            elseif optionsdata[3] == 'string' then
                optionsdata[4] = ''
                if table.getn(optionsdata[5]) > 0 then
                    optionsdata[4] = optionsdata[5][1]
                end
            end
        end
        if optionsdata[5] == nil then
            if optionsdata[3] == 'number' then
                optionsdata[5] = 10
            end
        end
        if optionsdata[4] == nil then
            if optionsdata[3] == 'number' then
                optionsdata[4] = 0
            end
        end
    end

	shownoptions = tableslice(options, 1, 7)

    setProperty('healthBarBG.visible', false)
    makeLuaSprite('bg', imagePath('bg', 'Settings'), 0, 0)
    setObjectCamera('bg', 'hud')
    addLuaSprite('bg', true)
        
    makeLuaText('selectyostuff', 'Before you start, select some of these cool options because swag!', 700, 310, 10)
    setTextSize('selectyostuff', 30)
    setObjectCamera('selectyostuff', 'hud')
    addLuaText('selectyostuff')

    for i, optionsdata in pairs(shownoptions) do
        makeLuaText('option'..i, 'placeholder', 700, 100, 150 + 50*i)
        setTextSize('option'..i, 30)
        setTextAlignment('option'..i, 'left')
        addLuaText('option'..i)

        changeOptionType(0)
        selection = selection + 1

    end        

    selection = 1

    makeLuaText('optiondot', '.', 550, 50, 190)
    setTextSize('optiondot', 30)
    setTextAlignment('optiondot', 'left')
    addLuaText('optiondot')

    makeLuaText('optiondummy', '>', 550, 50, 550)
    setTextSize('optiondummy', 30)
    setProperty('optiondummy.angle', 90)
    addLuaText('optiondummy')

    makeLuaText('page', 'placeholder', 300, 15, screenHeight-45)
    setTextAlignment('page', 'left')
    setTextSize('page', 30)
    addLuaText('page')

    setTextString('page', 'Page '..curPage)

end

function onStartCountdown()
    return Function_Stop;
end

function onUpdate()

    if countdownstarted == false then
        if keyJustPressed('accept') then
            
            initSaveData('FunkinLuaSettings', 'psychenginemods/BombasticTom')

	        for num, option in pairs(options) do
                setDataFromSave('FunkinLuaSettings', option[2], option[4])
            end

	        flushSaveData('FunkinLuaSettings')

            endSong()
        end

        if keyJustPressed('right') then
            changeOptionType(1)
        end
        if keyJustPressed('left') then
            changeOptionType(-1)
        end
        if keyJustPressed('down') then
            changeSelection(1)
        end
        if keyJustPressed('up') then
            changeSelection(-1)
        end

    end
end

function changeOptionType(num)
    if options[selection] == nil then
	    shownoptions[((selection-1)%7)+1] = nil
        return setTextString('option'..((selection-1)%7)+1, '')
    end
    if options[selection][3] == 'string' then

            chosenterm = (returnNum(options[selection][5], options[selection][4])) + num

            if chosenterm > table.getn(options[selection][5]) then
                chosenterm = 1
            elseif chosenterm < 1 then
                chosenterm = table.getn(options[selection][5])
            end

            options[selection][4] = options[selection][5][chosenterm]
            setTextString('option'..((selection-1)%7)+1, options[selection][1]..' <'..options[selection][4]..'>')

    elseif options[selection][3] == 'bool' then
            if num ~= 0 then
                options[selection][4] = not options[selection][4]
            end
            setTextString('option'..((selection-1)%7)+1, options[selection][1]..' <'..tostrfb(options[selection][4])..'>')
    else
            if num ~= 0 then
                options[selection][4] = options[selection][4] + options[selection][7] * num
                if options[selection][4] > options[selection][6] then
                    options[selection][4] = options[selection][6]
                end

                if options[selection][4] < options[selection][5] then
                    options[selection][4] = options[selection][5]
                end
            end
            setTextString('option'..((selection-1)%7)+1, options[selection][1]..' <'..options[selection][4]..'>')
    end
end

function changeSelection(num)

    selection = selection + num
    
    if (selection) > curPage*7 or selection > table.getn(options) then
        if selection > table.getn(options) then
            curPage = 1
        else
            curPage = curPage + 1
        end

        shownoptions = tableslice(options, 7*(curPage-1), 7*curPage)
        while table.getn(shownoptions) < 7 do
            table.insert(shownoptions, {})
        end
        selection = curPage*7-6

        for i, optionsdata in pairs(shownoptions) do
            setTextString('option'..i, 'placeholder', 700, 100, 150 + 50*i)
            changeOptionType(0)
            selection = selection + 1
        end

        selection = curPage*7-6

    elseif (selection) < curPage*7-6 then
        if selection < 1 then
            selection = selection + math.abs(num)
            return
        else
            curPage = curPage - 1
        end

        shownoptions = tableslice(options, 7*(curPage-1), 7*curPage)
        while table.getn(shownoptions) < 7 do
            table.insert(shownoptions, {})
        end

        selection = curPage*7-6

        for i, optionsdata in pairs(shownoptions) do
            setTextString('option'..i, 'placeholder', 700, 100, 150 + 50*i)
            changeOptionType(0)
            selection = selection + 1
        end

        selection = curPage*7
    end

    setProperty('optiondot.y', 150 + 50 * (((selection-1)%7)+1) - 8)
    setTextString('page', 'Page '..curPage)
end

-- It's midnite I am too lazy to explain this