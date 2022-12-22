function onCreate()
	-- background shit
	makeLuaSprite('city2back', 'city2back', -600, -300);
	setScrollFactor('city2back', 0.9, 0.9);
	
	makeLuaSprite('front', 'front', -650, 600);
	setScrollFactor('front', 0.9, 0.9);
	scaleObject('front', 1.1, 1.1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('light_left', 'light', -125, -100);
		setScrollFactor('light_left', 0.9, 0.9);
		scaleObject('light_left', 1.1, 1.1);
		
		makeLuaSprite('light_right', 'light', 1225, -100);
		setScrollFactor('light_right', 0.9, 0.9);
		scaleObject('light_right', 1.1, 1.1);
		setProperty('light_right.flipX', true); --mirror sprite horizontally

		makeLuaSprite('curtains', 'curtains', -500, -300);
		setScrollFactor('curtains', 1.3, 1.3);
		scaleObject('curtains', 0.9, 0.9);
	end

	addLuaSprite('city2back', false);
	addLuaSprite('front', false);
	addLuaSprite('light_left', false);
	addLuaSprite('light_right', false);
	addLuaSprite('curtains', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end