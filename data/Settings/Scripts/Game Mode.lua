gamemodes = {
	['None'] = function()
		return
	end,
	['Vintage Mode'] = function()
		setPropertyFromClass('lime.app.Application', 'current.window.title', "Friday Night Funkin': Old Engine")

		makeAnimatedLuaSprite('vintage', 'FunkinLUAOptions/CUpheqdshid', 0, 0)
		addAnimationByPrefix('vintage', 'cool', 'Cupheadshit_gif instance 1', 24, true)

		setObjectCamera('vintage', 'camHUD')
		addLuaSprite('vintage', true)

		objectPlayAnimation('vintage', 'cool', true)
	end,
	['Blammed Lights Mode'] = function()
		setPropertyFromClass('lime.app.Application', 'current.window.title', "Friday Night Funkin': Blammed Engine")
		addLuaScript('data/Settings/Scripts/GameModes/BlamLite')
	end,
	['Swag Mode'] = function()
		triggerEvent('Change Character', 0, 'Pico-player')
		triggerEvent('Change Character', 1, 'gangstamario')
		setPropertyFromClass('lime.app.Application', 'current.window.title', "Friday Night Funkin': Swag Engine")
	end,
	['Peace Mode'] = function()
		setProperty('scoreTxt.alpha', 0)
		setProperty('healthBar.alpha', 0)

		triggerEvent('Camera Follow Pos', getProperty('boyfriend.x')-150, getProperty('boyfriend.y')+150)

		triggerEvent('Change Character', 0, 'blank')
		triggerEvent('Change Character', 1, 'blank')
		triggerEvent('Change Character', 2, 'blank')
	end
}

function onCreatePost()
	gamemodes[getDataFromSave('FunkinLuaSettings', 'gmode')]()
end

function onDestroy()
	setPropertyFromClass('lime.app.Application', 'current.window.title', "Friday Night Funkin': Psych Engine")
end