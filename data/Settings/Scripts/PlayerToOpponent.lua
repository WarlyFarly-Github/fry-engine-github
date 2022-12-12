-- Code made by BombasticTom (Please credit)
-- 1/5 of the code based on "Play with your Mouse instead of Arrow Keys" script by ShadowMario (aka. Main Programmer of Psych Engine)
-- https://cdn.discordapp.com/attachments/840678333602857040/888568120728502272/script.lua <-- The mouse code.

function onCreatePost()

	if not middlescroll then -- Checks if it isn't middlescroll
		for i=0, getProperty('playerStrums.length')-1 do -- Moves Player Strums to The place where oppponent strums were
			setPropertyFromGroup('playerStrums', i, 'x', getPropertyFromGroup('opponentStrums', i, 'x'))
		end
		for i=0, getProperty('opponentStrums.length')-1 do -- Since I am stupid and bad at symmetry, I made this bad convert from opponent to player positions
			setPropertyFromGroup('opponentStrums', i, 'x', 732 + i*112)
		end
	end

	for i=0, getProperty('unspawnNotes.length') do -- Switches notes (from opponent to player or from player to opponent) and makes normal ones play no animaton
		setPropertyFromGroup('unspawnNotes', i, 'mustPress', not getPropertyFromGroup('unspawnNotes', i, 'mustPress'))
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' then
			setPropertyFromGroup('unspawnNotes', i, 'noteType', 'No Animation')
		end
	end

end

local stopAnimTimer = 0; -- copied this from the official wiki (https://cdn.discordapp.com/attachments/840678333602857040/888568120728502272/script.lua)
local targetTime = 0; -- also copied from official wiki
local directions = {'LEFT', 'DOWN', 'UP', 'RIGHT'} -- directions so I don't have to make 8 if statements

function goodNoteHit(id, direction, noteType, isSustainNote) -- basically plays them notes on a note hit
	characterPlayAnim('dad', 'sing'..directions[direction + 1], false)
	stopAnimTimer = 0;
	targetTime = stepCrochet * 0.001 * getProperty('boyfriend.singDuration');
end

function opponentNoteHit(id, direction, noteType, isSustainNote) -- opponent (antagonist perspective) notes version
	characterPlayAnim('boyfriend', 'sing'..directions[direction + 1], false)
end

function onUpdatePost(elapsed) -- also code that I stole from the same script! (tell me if this changes anything and if you have a better solution notify me)

	stopAnimTimer = stopAnimTimer + elapsed;
	if targetTime > 0 and stopAnimTimer > targetTime then
		characterPlayAnim('dad', 'danceLeft');
		characterPlayAnim('dad', 'idle');
		targetTime = 0;
		stopAnimTimer = 0;
	end
end