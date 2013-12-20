function love.load()

	Class = require"src.libs.humpClass"
	Timer = require "src.libs.humpTimer"
	require "src.paths"
	require "src.helpers.debugger"
	require "src.helpers.text"
	require "src.colors"
	require "src.interface"

	Gui:init("MainMenu")
	
	love.graphics.setBackgroundColor ( clBackground )
	snd_soundDecoder = SoundDecoder()
end

function love.update (dt)

	Timer.update(dt)
	Gui:update(dt)
	-- Mouse Hover
	gui:onHover( love.mouse.getPosition() )

	-- FPS
	gui.elements["FPS"]:setText (love.timer.getFPS( ) .. " FPS")
	
	-- Network
	updateNetwork(dt)

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

	gui:onKeyPress(key)
	
end
 
function love.keyreleased (key)

	-- your code
	
end
