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
		-- delete ()									-- Destruktor
		
		-- getClicked ()	: bool
		-- getEnabled ()	: bool
		-- getSize ()		: int
		-- getText ()		: string
		
		-- setClick (clickAction)
		-- setEnabled (bool)
		-- setSize (width)
		-- setText (text)
		
		-- isOver (x, y)	: bool
		
		-- onClick (x, y)	: bool
		-- onHover (x, y)	: bool
		-- onRelease ()
		
		-- draw ()
		-- drawOne (color, img)
}

function Button:init (name, x, y, text, width, clickAction)
	GuiElement.init(self, name, x, y)
	self.click	= clickAction
	self.clicked= false
	self.enabled= true
	self.text	= text
	self.width	= width
end

function Button:delete () end

function Button:getClicked () 			return self.clicked end
function Button:getEnabled () 			return self.enabled end
function Button:getText () 				return self.text end
function Button:getSize () 				return self.width end

function Button:setClick (clickAction) 	self.click = clickAction end
function Button:setEnabled (bool) 		self.enabled = bool end
function Button:setSize (width) 		self.width = width end
function Button:setText (text) 			self.text = text end

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

function Button:draw ()
	if self.visible == true then
		if self.enabled == true then
			if self.clicked == true then
				self:drawOne ( clWhite, Gui.skins[gui.skin].images.btn_click )
			elseif self.hovered == true then
				self:drawOne ( clWhite, Gui.skins[gui.skin].images.btn_hover )
			else
				self:drawOne ( clWhite, Gui.skins[gui.skin].images.btn_idle )
			end
		else
			self:drawOne ( clLGrey, Gui.skins[gui.skin].images.btn_dis )
		end
	end
end

function Button:drawOne (color, img)
	
	local quads = Gui.skins[gui.skin].quads
	local sizes = Gui.skins[gui.skin].sizes
	love.graphics.drawq(img, quads.btn_left, self.x, self.y)
	
	local x = self.x + sizes.btn_left			-- Iterator pozycji
	local r = self.x+self.width-sizes.btn_right	-- po�o�enie prawej grafiki
	while x <= r do
		love.graphics.drawq(img, quads.btn_center, x, self.y)
		x = x + sizes.btn_center
	end
	
	love.graphics.drawq(img, quads.btn_right, r, self.y)
	
	love.graphics.setColor (color)
	love.graphics.print (self.text, self.x+5, self.y+10)
end
