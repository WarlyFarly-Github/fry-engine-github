function onCreatePost()
	local underlay = getDataFromSave('FunkinLuaSettings', 'lt')
	if underlay == 0 then return end
	local noteS = getDataFromSave('FunkinLuaSettings', 'noteS')

	makeLuaSprite('sheet1', '', getPropertyFromGroup('playerStrums', 0, 'x') - (10 + 10 * (noteS*10-7)), 0)
	setObjectCamera('sheet1', 'camHUD')
	makeGraphic('sheet1', 20 + ((160*noteS)*4), screenHeight, '000000')
	setProperty('sheet1.alpha', underlay)
	addLuaSprite('sheet1')

	makeLuaSprite('sheet2', '', getPropertyFromGroup('opponentStrums', 0, 'x') - (10 + 10 * (noteS*10-7)), 0)
	setObjectCamera('sheet2', 'camHUD')
	makeGraphic('sheet2', 20 + ((160*noteS)*4), screenHeight, '000000')
	setProperty('sheet2.alpha', underlay)
	addLuaSprite('sheet2')
end