local animation = true
function onStartCountdown()
	if animation then
		runTimer('lolwait', 0.3)
		return Function_Stop;
	else
		return Function_Continue;
	end
end

function onTimerCompleted(tag)
	if tag == 'lolwait' then
		characterPlayAnim('boyfriend', 'startUp', true);
		runTimer('coolanim', 1);
	end
	if tag == 'coolanim' then
		animation = false
		startCountdown()
	end
end