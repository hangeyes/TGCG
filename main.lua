function love.load()

	Class = require("src.libs.humpClass")
	require ("src.paths")
	require ("src.helpers.debugger")
	require ("src.colors")
	require ("src.interface")

	Gui:init("MainMenu")
	
	degree = 0
end

function love.update (dt)

	-- Mouse Hover
	gui:onHover( love.mouse.getPosition() )

	-- FPS
	gui.elements["FPS"]:setText (love.timer.getFPS( ) .. " FPS")

end

function love.draw ()

	gui:draw()		-- Rysuje wszystkie elementy GUI

end
 
function love.mousepressed (x, y, button)
	
	if button == "l" then gui:onClick(x, y) end	-- Przekazuje kliknięcia do GUI
	
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
