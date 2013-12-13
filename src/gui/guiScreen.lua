--- COPYRIGHT ---
-- bla bla bla --



-------------
-- Zmienne --




-------------
-- Funkcje --




-------------
-- Klasa ----

GuiScreen = Class
{
	--------------
	-- Atrybuty --
	
		-- clicked
		-- elements {}
		-- hovered
		-- skin

	------------
	-- Metody --
	
		-- init ()
		-- delete ()
		
		-- deleteElement (name)
		-- newButton (name, x, y, text, width, clickAction)
		-- newCheckBox (name, x, y, text, checked)
		-- newLabel (name, x, y, text, color, font)
		-- newProgressBar (name, x, y, width, currentProgress, maxProgress)
		
		-- onClick (x, y)
		-- onHover (x, y)
		-- onRelease ()
		
		-- draw ()
}

function GuiScreen:init (skin)
	self.clicked = nil
	self.elements = {}
	self.skin = skin
end

function GuiScreen:delete ()
	-- Usuwanie wszystkich instancji
	for name, element in pairs(self.elements) do
		element.delete ()
		element = nil
	end
	self.clicked = nil
end

function GuiScreen:deleteElement (name)
	elements[name].delete()
	elements[name] = nil
end

function GuiScreen:newButton (name, ...)
	self.elements[name] = Button(name, unpack(arg))
	--self.elements[name]:Init (unpack(arg))
end

function GuiScreen:newCheckBox (name, ...)
	self.elements[name] = CheckBox(name, unpack(arg))
	--self.elements[name]:Init (unpack(arg))
end

function GuiScreen:newLabel (name, ...)
	self.elements[name] = Label(name, unpack(arg))
	--self.elements[name]:Init (unpack(arg))
end

function GuiScreen:newProgressBar (name, ...)
	self.elements[name] = ProgressBar(name, unpack(arg))
	--self.elements[name]:Init (unpack(arg))
end

function GuiScreen:onClick (x, y)
	for name, element in pairs(self.elements) do
		if (element.onClick ~= nil) then
			local temp = element:onClick(x, y)
			if temp == true then
				if element.onRelease ~= nil then self.clicked = name end	-- dodaje klikniêty element do "naciœniêtych"
				break
			end
		end
	end
end

function GuiScreen:onHover (x, y)
	if self.hovered == nil or self.elements[self.hovered]:onHover(x, y) == false then
		self.hovered = nil
		for name, element in pairs(self.elements) do
			if (element.onHover ~= nil) then
				local temp = element:onHover(x, y)
				if temp == true then
					if element.onHover ~= nil then self.hovered = name end	-- dodaje element do "najechanych"
					break
				end
			end
		end
	end
end

function GuiScreen:onRelease ()
	if self.clicked ~= nil then
		self.elements[self.clicked]:onRelease()
		self.clicked = nil
	end
end

function GuiScreen:draw ()
	for name, element in pairs(self.elements) do
			element:draw ()
	end
end