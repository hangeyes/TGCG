--- COPYRIGHT ---
-- bla bla bla --



TextBox = Class
{	__includes = GuiElement

	--------------
	-- Atrybuty --

		-- cursorPos
		-- cursorText
		-- enabled
		-- keyEquals {}
		-- maxLength
		-- selected
		-- text
		-- width

	------------
	-- Metody --
	
		-- init (name, x, y, text, width)	-- Konstruktor
		
		-- addText (text)
		-- genCursor ()
		
		-- getEnabled ()	: bool
		-- getText ()		: string
		-- getSize ()		: int
		
		-- moveCursor (characters)
		
		-- setCursor (place)
		-- setEnabled (bool)
		-- setSize (width)
		-- setText (text)
		
		-- isOver (x, y)
		
		-- onClick (x, y)
		-- onKeypress ( key )
		
		-- draw ()
		-- drawOne ()
}

function TextBox:init (name, x, y, text, width, maxLength)
	GuiElement.init(self, name, x, y)
	self.cursorPos	= string.len(text)
	self.enabled	= true
	self.maxLength	= maxLength
	self.selected	= false
	self.text		= text
	self.width		= width
	self:genCursor ()
	
	self.keyEquals = {}
	self.keyEquals["kp0"] = "0"
	self.keyEquals["kp1"] = "1"
	self.keyEquals["kp2"] = "2"
	self.keyEquals["kp3"] = "3"
	self.keyEquals["kp4"] = "4"
	self.keyEquals["kp5"] = "5"
	self.keyEquals["kp6"] = "6"
	self.keyEquals["kp7"] = "7"
	self.keyEquals["kp8"] = "8"
	self.keyEquals["kp9"] = "9"
	self.keyEquals["kp."] = "."
	self.keyEquals["kp,"] = ","
	self.keyEquals["kp/"] = "/"
	self.keyEquals["kp*"] = "*"
	self.keyEquals["kp-"] = "-"
	self.keyEquals["kp+"] = "+"
	self.keyEquals["kp="] = "="
end

function TextBox:addText ( text )
	if string.len( self.text ) + string.len(text) <= self.maxLength then
		self.text = textInsert( self.text, text, self.cursorPos )
		self:moveCursor( string.len( text ) )
	end
end

function TextBox:genCursor () self.cursorText = textInsert (self.text, gui_stdCursor, self.cursorPos) end

function TextBox:getEnabled () 				return self.enabled end
function TextBox:getSelected () 			return self.selected end
function TextBox:getText () 				return self.text end
function TextBox:getSize () 				return self.width end

function TextBox:moveCursor ( characters )
	local length = string.len( self.text )
	if 		characters == "home" then self.cursorPos = 0
	elseif	characters == "end" then self.cursorPos = length
	else
		self.cursorPos = self.cursorPos + characters
	end
	
	if self.cursorPos < 0 then self.cursorPos = 0
	elseif self.cursorPos > length then self.cursorPos = length end
	
	self:genCursor()
end

function TextBox:setCursor (place)			self.cursor = place end
function TextBox:setEnabled (bool) 			self.enabled = bool end
function TextBox:setSize (width) 			self.width = width end
function TextBox:setText (text) 			self.text = text end

function TextBox:isOver (x, y)
	if (x >= self.x) and (y >= self.y) and (self.x + self.width >= x) and (self.y + gui_stdHeight >= y) then
		return true
	else return false end
end

function TextBox:onClick (x, y)
	if self:isOver (x, y) == true and self.enabled == true then
		self.selected = true
		return true
	else
		self.selected = false
		return false
	end
end

function TextBox:onKeypress ( key )
	if string.len( key ) == 1 then
		if love.keyboard.isDown("lshift") == false then self:addText( key )
		else self:addText( string.upper(key) ) end
		
	elseif key == "return" or key == "kpenter" or key == "escape" then
		self.selected = false
		gui.selected = nil
		
	elseif key == "backspace" then
		self.text = textBackspace( self.text, self.cursorPos )
		self:moveCursor( -1 )
		
	elseif key == "delete" then
		self.text = textDelete( self.text, self.cursorPos )
		self:genCursor()
		
	elseif key == "left" then self:moveCursor( -1 )
	elseif key == "right" then self:moveCursor( 1 )
	elseif key == "home" then self:moveCursor("home")
	elseif key == "end" then self:moveCursor("end")
	elseif self.keyEquals[key] ~= nil then self:addText( self.keyEquals[key] )
	end
end

function TextBox:draw ()
	if self.visible == true then
		if self.enabled == true then
			if self.selected == true then
				self:drawOne ( clWhite, Gui.skins[gui.skin].images.tbx_sel )
			else
				self:drawOne ( clWhite, Gui.skins[gui.skin].images.tbx_idle )
			end
		else
			self:drawOne ( clLGrey, Gui.skins[gui.skin].images.tbx_dis )
		end
	end
end

function TextBox:drawOne (text, img)	-- TEMPORARY -- Później zmienić na dane odnośnie textBox a nie btn
	
	local quads = Gui.skins[gui.skin].quads
	local sizes = Gui.skins[gui.skin].sizes
	love.graphics.drawq(img, quads.tbx_left, self.x, self.y)
	
	local x = self.x + sizes.tbx_left			-- Iterator pozycji
	local r = self.x+self.width-sizes.tbx_right	-- położenie prawej grafiki
	while x <= r do
		love.graphics.drawq(img, quads.tbx_center, x, self.y)
		x = x + sizes.tbx_center
	end
	
	love.graphics.drawq(img, quads.tbx_right, r, self.y)
	
	love.graphics.setColor (text)
	
	if self.selected == false then
		love.graphics.print (self.text, self.x+5, self.y+10)
	else
		love.graphics.print (self.cursorText, self.x+5, self.y+10)
	end
end