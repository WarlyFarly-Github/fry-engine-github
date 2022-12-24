function onCreate()

end

function onStepHit()
    if stepHitFuncs[curStep] then 
        stepHitFuncs[curStep]()
    end
end

stepHitFuncs = {
	[128] = function()
		setProperty('defaultCamZoom', 0.6);
	end,
    [352] = function()
		setProperty('defaultCamZoom', 0.57);
	end,
    [356] = function()
		setProperty('defaultCamZoom', 0.6);
	end,
    [640] = function()
		setProperty('defaultCamZoom', 0.9);
	end,
    [768] = function()
		setProperty('defaultCamZoom', 0.6);
	end
}