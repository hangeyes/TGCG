function love.load()

	Class = require("libs.humpClass")
	tempDegree = 0
	
end

function love.update(dt)

	tempDegree = tempDegree + ( math.pi / 5 * dt )
	
end

function love.draw()

	love.graphics.print("Many cards, very game.", 500,300, tempDegree + 1)
	love.graphics.print("So fun. Wow xD", 600,500, -tempDegree*2.3)
	
end
 
function love.mousepressed(x, y, button)

	-- your code
	
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