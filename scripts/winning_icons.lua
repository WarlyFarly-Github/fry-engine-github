--Script by _Boxed!
--Script fixed by Shokora! Big thanks to them!
function onCreate()
	makeLuaSprite('winningIcon', 'icons/win-'..getProperty('boyfriend.healthicon'), getProperty('iconP1.x'), getProperty('iconP1.y'))
	setObjectCamera('winningIcon', 'hud')
	addLuaSprite('winningIcon', true)
	setObjectOrder('winningIcon', getObjectOrder('iconP1') + 1)
	setProperty('winningIcon.flipX', true)
	setProperty('winningIcon.visible', false)
	
	bf = getProperty('boyfriend.healthicon')
	
	makeLuaSprite('winningIconDad', 'icons/win-'..getProperty('boyfriend.healthicon'), getProperty('iconP2.x'), getProperty('iconP2.y'))
	setObjectCamera('winningIconDad', 'hud')
	addLuaSprite('winningIconDad', true)
	setObjectOrder('winningIconDad', getObjectOrder('iconP2') + 1)
	setProperty('winningIconDad.flipX', false)
	setProperty('winningIconDad.visible', false)
	
	dad = getProperty('boyfriend.healthicon')
end

function onUpdate(elapsed)
		
		bf = getProperty('iconP1.animation.curAnim.name')
		
		--debugPrint(getProperty('iconP1.animation.curAnim.name')) --debug
		
		--WHITELIST add more characters if you wish
		--if bf == 'bf' or bf =='bf' or bf =='bf' or bf =='bf' --WHITELIST - comment '--' to disable, uncomment to enable
		--BLACKLIST add more characters if you wish
		--if not bf =='bf' or bf =='bf' or bf =='bf' or bf =='bf' --BLACKLIST - comment '--' to disable, uncomment to enable
		--then --uncomment if using WHITELIST or BLACKLIST
			makeLuaSprite('winningIcon', 'icons/win-'..getProperty('iconP1.animation.curAnim.name'), getProperty('iconP1.x'), getProperty('iconP1.y'))
			setObjectCamera('winningIcon', 'hud')
			addLuaSprite('winningIcon', true)
			setObjectOrder('winningIcon', getObjectOrder('iconP1') + 1)
			setProperty('winningIcon.flipX', true)
			setProperty('winningIcon.visible', false)
		
			setProperty('winningIcon.x', getProperty('iconP1.x'))
			setProperty('winningIcon.angle', getProperty('iconP1.angle'))
			setProperty('winningIcon.y', getProperty('iconP1.y'))
			setProperty('winningIcon.scale.x', getProperty('iconP1.scale.x'))
			setProperty('winningIcon.scale.y', getProperty('iconP1.scale.y'))
			
			if getProperty('health') >= 1.625 then
				setProperty('iconP1.visible', false)
				setProperty('winningIcon.visible', true)
			else
				setProperty('iconP1.visible', true)
				setProperty('winningIcon.visible', false)
			end
		--end --uncomment if using WHITELIST or BLACKLIST
			
		dad = getProperty('dad.healthicon')
		--WHITELIST add more characters if you wish
		--if dad == 'dad' or dad =='dad' or dad =='dad' or dad =='dad' --WHITELIST - comment '--' to disable, uncomment to enable
		--BLACKLIST add more characters if you wish
		--if not dad =='dad' or dad =='dad' or dad =='dad' or dad =='dad' --BLACKLIST - comment '--' to disable, uncomment to enable
		--then --uncomment if using WHITELIST or BLACKLIST
			makeLuaSprite('winningIconDad', 'icons/win-'..getProperty('iconP2.animation.curAnim.name'), getProperty('iconP2.x'), getProperty('iconP2.y'))
			setObjectCamera('winningIconDad', 'hud')
			addLuaSprite('winningIconDad', true)
			setObjectOrder('winningIconDad', getObjectOrder('iconP2') + 1)
			setProperty('winningIconDad.flipX', false)
			setProperty('winningIconDad.visible', false)
		
			setProperty('winningIconDad.x', getProperty('iconP2.x'))
			setProperty('winningIconDad.angle', getProperty('iconP2.angle'))
			setProperty('winningIconDad.y', getProperty('iconP2.y'))
			setProperty('winningIconDad.scale.x', getProperty('iconP2.scale.x'))
			setProperty('winningIconDad.scale.y', getProperty('iconP2.scale.y'))
			
			if getProperty('health') <= .375 then
				setProperty('iconP2.visible', false)
				setProperty('winningIconDad.visible', true)
			else
				setProperty('iconP2.visible', true)
				setProperty('winningIconDad.visible', false)
			end
		--end --uncomment if using WHITELIST or BLACKLIST
end