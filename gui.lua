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
	
	-- text		-- Tekst wyświetany przez przycisk
	-- x			-- Pozycja X
	-- y			-- Pozycja Y
	-- width	-- Szerokość przycisku
	-- height	-- Wysokość przycisku
	
	-- visible	-- Czy przycisk jest widoczny
	-- enabled	-- Czy przycisk jest aktywny
	
	----- Funkcje
	
	-- Init (text, x, y, width, height)	-- Konstruktor
	
	-- SetPos (x, y)
	-- SetVisible (bool)
	-- SetEnabled (bool)
}

function Button:Init (text, x, y, width, height)
	self.text		= text
	self.x			= x
	self.y			= y
	self.width	= width
	self.height	= height
	self.visible= true
	self.enabled= true
end
