local caniplsstart = false
function onCreate()
	precacheSound('wellwellwell')
end

function onCreatePost()
	setProperty('introSoundsSuffix', 'well')
	cameraSetTarget('dad')
end

--[[ function onStartCountdown()
	if not caniplsstart then
		runTimer('waitfordastuff', 0.7)
		return Function_Stop
	end
	return Function_Continue
end --]]

function onCountdownTick(count)
	if count < 3 then
		characterPlayAnim('dad', 'hey', true)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'waitfordastuff' then
		cameraSetTarget('dad')
		playSound('wellwellwell')
		runTimer('wellone', 0.1)
	end
	if tag == 'wellone' then
		characterPlayAnim('dad', 'hey', true)
		runTimer('well', 0.25, 2)
	end
	if tag == 'well' then
		characterPlayAnim('dad', 'hey', true)
		if loopsLeft == 0 then
			runTimer('pause', 0.2)
		end
	end
	if tag == 'pause' then
		caniplsstart = true
		startCountdown()
	end
end