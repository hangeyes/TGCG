--- COPYRIGHT ---
-- bla bla bla --



Button = Class
{	__includes = GuiElement

	--------------
	-- Atrybuty --

		-- click		-- Funkcja wywo�ywana podczas klikni�cia
		-- clicked		-- Czy przycisk jest w danej chwili wci�niety
		-- enabled		-- Czy przycisk jest aktywny
		-- hovered		-- Czy nad przyciskiem jest wska�nik myszy?
		-- text			-- Tekst wy�wietany przez przycisk
		-- width		-- Szeroko�� przycisku

	------------
	-- Metody --
	
		-- init (name, x, y, text, width, clickAction)	-- Konstruktor
		
		-- getClicked ()	: bool
		-- getEnabled ()	: bool
		-- getText ()		: string
		-- getSize ()		: int
		
		-- setClick (clickAction)
		-- setEnabled (bool)
		-- setSize (width)
		-- setText (text)
		
		-- isOver (x, y)
		
		-- onClick (x, y)
		-- onHover (x, y)
		-- onRelease ()
		
		-- draw ()
}

function Button:init (name, x, y, text, width, clickAction)
	GuiElement.init(self, name, x, y)
	self.click	= clickAction
	self.clicked= false
	self.enabled= true
	self.text	= text
	self.width	= width
end

function Button:getClicked () 			return self.clicked end
function Button:getEnabled () 			return self.enabled end
function Button:getText () 				return self.text end
function Button:getSize () 				return self.width end

function Button:setClick (clickAction) 	self.click = clickAction end
function Button:setEnabled (bool) 		self.enabled = bool end
function Button:setSize (width) 		self.width = width end
function Button:setText (text) 			self.text = boot end

function Button:isOver (x, y)
	if (x >= self.x) and (y >= self.y) and (self.x + self.width >= x) and (self.y + gui_stdHeight >= y) then
		return true
	else return false end
end

function Button:onClick (x, y)
	if self:isOver (x, y) == true and self.enabled == true then
		self.clicked = true
		if (self.click ~= nil) then self:click() end
		return true
	else return false end
end

function Button:onHover (x, y)
	if self:isOver (x, y) == true and self.enabled == true then
		self.hovered = true
		return true
	else
		self.hovered = false
		return false
	end
end

function Button:onRelease () self.clicked = false end

function Button:helpDraw (fill, line, text)
	love.graphics.setColor (fill)
	love.graphics.rectangle("fill", self.x, self.y, self.width, gui_stdHeight)
	love.graphics.setColor (line)
	love.graphics.rectangle("line", self.x, self.y, self.width, gui_stdHeight)
	love.graphics.setColor (text)
	love.graphics.print (self.text, self.x+5, self.y+10)
end

function Button:draw ()		-- TYMCZASOWO
	if self.visible == true then
		if self.enabled == true then
			if self.clicked == true then
				self:helpDraw ( clLGrey, clWhite, clWhite )
			elseif self.hovered == true then
				self:helpDraw ( clGrey, clWhite, clWhite )
			else
				self:helpDraw ( clGrey, clLGrey, clWhite )
			end
		else
			self:helpDraw ( clDGrey, clGrey, clLGrey )
		end
	end
end