-- Panel
-- Button
-- Label
-- Image
-- TextEdit
-- CheckBox
-- ProgressBar
-- List
-- OptionCheck
-----------------------------------------------

-----------------------------------------------
-- BUTTON -------------------------------------
-----------------------------------------------

-- Deklaracja klasy
Button = Class
{
	----- Atrybuty
	
	-- text			-- Tekst wyświetany przez przycisk
	-- x			-- Pozycja X
	-- y			-- Pozycja Y
	-- width		-- Szerokość przycisku
	-- height		-- Wysokość przycisku
	
	-- visible		-- Czy przycisk jest widoczny
	-- enabled		-- Czy przycisk jest aktywny
	
	----- Funkcje
	
	-- Init (text, x, y, width)	-- Konstruktor
	
	-- SetPos (x, y)
	-- SetVisible (bool)
	-- SetEnabled (bool)
	-- SetText (text)
	
	-- Draw ()
}

function Button:Init (text, x, y, width)
	self.text	= text
	self.x		= x
	self.y		= y
	self.width	= width
	self.height	= 32
	self.visible= true
	self.enabled= true
end

function Button:SetPos (x, y)
	self.x = x
	self.y = y
end

function Button:SetVisible (bool)
	self.visible = bool;
end

function Button:SetEnabled (bool)
	self.enabled = bool
end

function Button:SetText (text)
	self.text = boot
end

function Button:Draw ()
	
end
