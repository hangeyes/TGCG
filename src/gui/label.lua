--- COPYRIGHT ---
-- bla bla bla --



Label = Class
{	__includes = GuiElement
	
	--------------
	-- Atrybuty --
	
		-- color
		-- font
		-- text
	
	------------
	-- Metody --
	
		-- init (name, x, y, text, color, font)
		-- delete ()
		
		-- getColor ()	: color
		-- getText ()	: string

		-- setFormat (color, font)
		-- setText (text)

		-- draw()
}

function Label:init (name, x, y, text, color, font)
	GuiElement.init(self, name, x, y)
	self.text	= text
	self.color	= color
	self.font	= font
end

function Label:delete () end;

function Label:getColor ()		return self.color end
function Label:getText ()		return self.text end

function Label:setFormat (color, font)
	if color ~= nil then self.color = color end
	if font ~= nil then self.font = font end
end

function Label:setText (text) self.text = text end

function Label:draw()
	if self.visible == true then
		love.graphics.setColor(self.color)
		love.graphics.print(self.text, self.x, self.y)
	end
end
