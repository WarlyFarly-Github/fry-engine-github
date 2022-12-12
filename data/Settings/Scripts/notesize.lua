function resize(val)

	local swagWidth = 160 * val

	for i=0, getProperty('strumLineNotes.length')-1 do

		local x = 42 - swagWidth + 112
		x = x + swagWidth * (i%4)
		x = x + 50
		x = x + (screenWidth / 2) * getPropertyFromGroup('strumLineNotes', i, 'player')

		setPropertyFromGroup('strumLineNotes', i, 'scale.x', val)
		setPropertyFromGroup('strumLineNotes', i, 'scale.y', val)
		setPropertyFromGroup('strumLineNotes', i, 'x', x)
	end


	for i=0, getProperty('unspawnNotes.length')-1 do
		setPropertyFromGroup('unspawnNotes', i, 'scale.x', val)

		setPropertyFromGroup('grpNoteSplashes', i, 'scale.x', val)
		setPropertyFromGroup('grpNoteSplashes', i, 'scale.y', val)

		setPropertyFromGroup('grpNoteSplashes', i, 'x', getPropertyFromGroup('strumLineNotes', getPropertyFromGroup('unspawnNotes', i, 'noteData'), 'x'))
		setPropertyFromGroup('grpNoteSplashes', i, 'y', getPropertyFromGroup('strumLineNotes', getPropertyFromGroup('unspawnNotes', i, 'noteData'), 'y'))	

		if not getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
			setPropertyFromGroup('unspawnNotes', i, 'scale.y', val)
		end
	end
end

function onCreatePost()
	local resizeVal = getDataFromSave('FunkinLuaSettings', 'noteS')
	if resizeVal ~= 0.7 then
		resize(resizeVal)
	end
end