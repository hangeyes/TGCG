--- COPYRIGHT ---
-- bla bla bla --



GuiElement = Class
{
	--------------
	-- Atrybuty --
	
		-- name
		-- x
		-- y
		-- visible

	------------
	-- Metody --
	
		-- init (name, x, y)
		-- delete ()

		-- getName ()		: string
		-- getPos ()		: int, int
		-- getVisible ()	: bool
		
		-- setPos (x, y)
		-- setVisible (bool)
		
		-- move (x, y)
		
		-- draw ()
}

function GuiElement:init (name, x, y)
	self.name		= name
	self.x, self.y	= x, y
	self.visible	= true
	self.delete		= GuiElement.delete
	self.getName	= GuiElement.getName
	self.getPos		= GuiElement.getPos
	self.getVisible	= GuiElement.getVisible
	self.setPos		= GuiElement.setPos
	self.setVisible	= GuiElement.setVisible
	self.move		= GuiElement.move
end

function GuiElement:delete ()
	-- standardowo pusty destruktor
end

function GuiElement:getName () return self.name end
function GuiElement:getPos () return self.x, self.y end
function GuiElement:getVisible () return self.visible end

function GuiElement:setPos (x, y)
	if self.x ~= nil then self.x = x end
	if self.y ~= nil then self.y = y end
end

function GuiElement:setVisible (bool) self.visible = bool end

function GuiElement:move (x, y) self.x, self.y = self.x+x, self.y+y end

function GuiElement:draw ()
	love.graphics.print (self.name, self.x, self.y)
end