--- COPYRIGHT ---
-- bla bla bla --



Button = Class
{	__includes = GuiElement

	--------------
	-- Atrybuty --

		-- click		-- Funkcja wywo³ywana podczas klikniêcia
		-- clicked		-- Czy przycisk jest w danej chwili wciœniety
		-- enabled		-- Czy przycisk jest aktywny
		-- text			-- Tekst wyœwietany przez przycisk
		-- width		-- Szerokoœæ przycisku

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
		
		-- onClick (x, y)
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

function Button:onClick (x, y)
	if ( (x >= self.x) and (self.x + self.width >= x) and (y >= self.y) and (self.y + gui_stdHeight >= y) ) then
		if self.enabled == true then
			self.clicked = true
			if (self.click ~= nil) then self:click() end
			return true
		else return false end
	else return false end
end

function Button:onRelease () self.clicked = false end

function Button:draw ()		-- TYMCZASOWO
	if self.visible == true then
		if self.enabled == true then
			if self.clicked == false then
				love.graphics.setColor (clGrey)
				love.graphics.rectangle("fill", self.x, self.y, self.width, gui_stdHeight)
				love.graphics.setColor (clLGrey)
				love.graphics.rectangle("line", self.x, self.y, self.width, gui_stdHeight)
				love.graphics.setColor (clWhite)
				love.graphics.print (self.text, self.x+5, self.y+10)
			else
				love.graphics.setColor (clLGrey)
				love.graphics.rectangle("fill", self.x, self.y, self.width, gui_stdHeight)
				love.graphics.setColor (clWhite)
				love.graphics.rectangle("line", self.x, self.y, self.width, gui_stdHeight)
				love.graphics.setColor (clWhite)
				love.graphics.print (self.text, self.x+5, self.y+10)
			end
		else
			love.graphics.setColor (clDGrey)
			love.graphics.rectangle("fill", self.x, self.y, self.width, gui_stdHeight)
			love.graphics.setColor (clGrey)
			love.graphics.rectangle("line", self.x, self.y, self.width, gui_stdHeight)
			love.graphics.setColor (clLGrey)
			love.graphics.print (self.text, self.x+5, self.y+10)
		end
	end
end