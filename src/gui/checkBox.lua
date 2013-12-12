--- COPYRIGHT ---
-- bla bla bla --



-------------
-- Zmienne --

	gui_cbMargin 	= 6			-- Margines CheckBoxa (margines?!?)
	
	
	
-------------
-- Klasa ----

CheckBox = Class
{	__includes = GuiElement

	--------------
	-- Atrybuty --
	
		-- checked
		-- enabled
		-- text

	------------
	-- Metody --
	
		-- init (text, x, y, checked)

		-- getChecked ()	: bool
		-- getEnabled ()	: bool
		-- getText ()		: string
		
		-- setChecked (bool)
		-- setEnabled (bool)
		-- setText (text)
		
		-- onClick (x, y)
		
		-- toggle ()
		
		-- draw ()
}

function CheckBox:init (name, x, y, text, checked)
	GuiElement.init(self, name, x, y)
	self.checked= checked
	self.enabled= true
	self.text	= text
end

function CheckBox:getChecked ()		return self.checked end
function CheckBox:getEnabled ()		return self.enabled end
function CheckBox:getText ()		return self.text end

function CheckBox:setChecked (bool)	self.checked = bool end
function CheckBox:setEnabled (bool)	self.enabled = bool end
function CheckBox:setText (text)	self.text = text end

function CheckBox:onClick (x, y)
	if ( (x >= self.x) and (self.x+gui_stdHeight >= x) and (y >= self.y) and (self.y + gui_stdHeight >= y) ) then
		if self.enabled == true then
			self:toggle()
			return true
		else return false end
	else return false end
end

function CheckBox:toggle ()
	if self.checked == true then self:setChecked (false)
	else self:setChecked (true) end
end

function CheckBox:draw ()		-- TYMCZASOWO
	if self.visible == true then
		if self.enabled == true then
			love.graphics.setColor (clGrey)
			love.graphics.rectangle("fill", self.x+gui_cbMargin, self.y+gui_cbMargin, gui_stdHeight-(2*gui_cbMargin), gui_stdHeight-(2*gui_cbMargin))
			love.graphics.setColor (clLGrey)
			love.graphics.rectangle("line", self.x+gui_cbMargin, self.y+gui_cbMargin, gui_stdHeight-(2*gui_cbMargin), gui_stdHeight-(2*gui_cbMargin))
			if self.checked == true then
				love.graphics.setColor (clWhite)
				love.graphics.rectangle("fill", self.x+gui_cbMargin +4, self.y+gui_cbMargin +4, gui_stdHeight-(2*gui_cbMargin) -8, gui_stdHeight-(2*gui_cbMargin) -8)
			end
			love.graphics.setColor (clWhite)
			love.graphics.print (self.text, self.x+gui_stdHeight, self.y+10)
		else
			love.graphics.setColor (clDGrey)
			love.graphics.rectangle("fill", self.x, self.y, gui_stdHeight, gui_stdHeight)
			love.graphics.setColor (clGrey)
			love.graphics.rectangle("line", self.x, self.y, gui_stdHeight, gui_stdHeight)
			if self.checked == true then
				love.graphics.setColor (clLGrey)
				love.graphics.rectangle("fill", self.x+4, self.y+4, gui_stdHeight-8, gui_stdHeight-8)
			end
			love.graphics.setColor (clLGrey)
			love.graphics.print (self.text, self.x+gui_stdHeight+5, self.y+10)
		end
	end
end