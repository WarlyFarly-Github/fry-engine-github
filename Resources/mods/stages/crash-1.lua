function onCreate()
	-- this is the error screen stage. Please do not edit.
	makeLuaSprite('errorscreen-1', 'errorscreen-1', -600, -300);
	setScrollFactor('errorscreen-1', 0.9, 0.9);

	addLuaSprite('errorscreen-1', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end