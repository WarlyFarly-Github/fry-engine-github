function onCreate()
    
end

function onStepHit()
    if stepHitFuncs[curStep] then 
        stepHitFuncs[curStep]()
    end
end

stepHitFuncs = {
    [64] = function()
        setProperty('defaultCamZoom', 0.65);
    end,
    [120] = function()
        setProperty('defaultCamZoom', 0.58);
    end,
    [128] = function()
        setProperty('defaultCamZoom', 0.7);
    end,
    [186] = function()
        setProperty('defaultCamZoom', 0.58);
    end,
    [192] = function()
        setProperty('defaultCamZoom', 0.7);
    end,
    [384] = function() --buildup
        setProperty('defaultCamZoom', 0.62);
    end,
    [511] = function()
        setProperty('defaultCamZoom', 0.61);
    end,
    [527] = function()
        setProperty('defaultCamZoom', 0.60);
    end,
    [543] = function()
        setProperty('defaultCamZoom', 0.59);
    end,
    [559] = function()
        setProperty('defaultCamZoom', 0.58);
    end,
    [639] = function()
        setProperty('defaultCamZoom', 0.6);
    end,
    [671] = function() --drop #1
        setProperty('defaultCamZoom', 0.8);
    end,
    [799] = function() --break
        setProperty('defaultCamZoom', 0.6);
    end,
    [927] = function() --resume drop #1
        setProperty('defaultCamZoom', 0.8);
    end,
    [1056] = function() --break
        setProperty('defaultCamZoom', 0.6);
    end
}