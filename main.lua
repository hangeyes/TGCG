function love.load()

	Class = require("libs.humpClass")
	require ("gui")
	
	local FPS = 0			-- Liczba klatek na sekundę
	
	local gui = GuiManager ()
	gui.CreateLabel ("FPS", "0 FPS", 10, 10, nil, nil, {255, 255, 255, 0})
	
end

function love.update(dt)

	FPS = 1000 / dt		-- Obliczanie klatek na sekundę
	gui.elements["FPS"].SetText (FPS .. " FPS")

end

function love.draw()

	gui.Draw()		-- Rysuje wszystkie elementy gui

end
 
function love.mousepressed(x, y, button)
	
end
 
function love.mousereleased(x, y, button)

	-- your code
	
end
 
function love.keypressed(key, unicode)

	-- your code
	
end
 
function love.keyreleased(key)

	-- your code
	
end
