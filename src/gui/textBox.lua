--- COPYRIGHT ---
-- bla bla bla --



TextBox = Class
{	__includes = GuiElement

	--------------
	-- Atrybuty --

		-- enabled
		-- selected
		-- text
		-- width

	------------
	-- Metody --
	
		-- init (name, x, y, text, width)	-- Konstruktor
		
		-- getEnabled ()	: bool
		-- getText ()		: string
		-- getSize ()		: int
		
		-- setEnabled (bool)
		-- setSize (width)
		-- setText (text)
		
		-- isOver (x, y)
		
		-- onClick (x, y)
		
		-- draw ()
}

function TextBox:init (name, x, y, text, width)
	GuiElement.init(self, name, x, y)
	self.enabled	= true
	self.selected	= false
	self.text		= text
	self.width		= width
end

function TextBox:getEnabled () 				return self.enabled end
function TextBox:getSelected () 			return self.selected end
function TextBox:getText () 				return self.text end
function TextBox:getSize () 				return self.width end

function TextBox:setEnabled (bool) 		self.enabled = bool end
function TextBox:setSize (width) 		self.width = width end
function TextBox:setText (text) 			self.text = boot end

function TextBox:isOver (x, y)
	if (x >= self.x) and (y >= self.y) and (self.x + self.width >= x) and (self.y + gui_stdHeight >= y) then
		return true
	else return false end
end

function TextBox:onClick (x, y)
	if self:isOver (x, y) == true and self.enabled == true then
		self.selected = true
		return true
	else return false end
end