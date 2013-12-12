function love.load()

	Class = require("libs.humpClass")
	require ("colors")
	require ("debugger")
	require ("gui")

	gui = GuiManager()
	gui:newLabel ("FPS", 10, 10, "0 FPS", clWhite)	-- FPS
	gui:newButton ("btnTest", 50, 40, "Kliknij mnie", 90, test)
	gui:newCheckBox ("testCheckBox", 50, 100, "Jestem CheckBoxem!", false)
	gui:newProgressBar ("testPBar", 50, 140, 200, 15, 100)
	gui:newButton ("btnPBPlus", 50, 180, "+1", 50, pbPlus)
	
	degree = 0
end

function test ()
	gui:newButton ("btnTest2", 50 + (math.random() * 10), 80, "Disabler", 70, test2)
end

function test2 ()
	gui.elements["btnTest"]:setEnabled(false)
end

function pbPlus ()
	gui.elements["testPBar"]:addProgress(1)
end

function love.update (dt)

	-- Mouse Hover
	gui:onHover( love.mouse.getPosition() )

	-- FPS
	gui.elements["FPS"]:setText (love.timer.getFPS( ) .. " FPS")
	
	degree = degree + dt
	if gui.elements["btnTest"]:getEnabled() == false then
		gui.elements["btnTest"]:setPos(love.mouse.getX(), love.mouse.getY())
	end

end

function love.draw ()

	gui:draw()		-- Rysuje wszystkie elementy GUI

	love.graphics.setColor(clWhite)
	love.graphics.print(" <-- DEBIL", love.mouse.getX(), love.mouse.getY(), degree)

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
