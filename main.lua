function love.load()

	Class = require("libs.humpClass")
	require ("colors")
	require ("debugger")
	require ("gui")

	gui = GuiManager()
	gui:newLabel ("FPS", 10, 10, "0 FPS", clWhite)	-- FPS
	gui:newButton ("btnTest", 50, 40, "Kliknij mnie", 90, test)
	
end

function test ()
	gui:newButton ("btnTest2", 50 + (math.random() * 10), 80, "Disabler", 70, test2)
end

function test2 ()
	gui.elements["btnTest"]:setEnabled(false)
end

function love.update (dt)

	-- FPS
	gui.elements["FPS"]:setText (string.format("%.0f", 1 / dt) .. " FPS")

end

function love.draw ()

	gui:draw()		-- Rysuje wszystkie elementy GUI

end
 
function love.mousepressed (x, y, button)
	
	gui:onClick(x, y)	-- Przekazuje kliknięcia do GUI
	
end
 
function love.mousereleased (x, y, button)

	gui:onRelease()		-- Przekazuje odklikniecia do GUI
	
end
 
function love.keypressed (key, unicode)

	-- your code
	
end
 
function love.keyreleased (key)

	-- your code
	
end
