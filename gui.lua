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
	-- clicked		-- Czy przycisk jest w danej chwili wciśniety
	
	-- click		-- Funkcja wywoływana podczas kliknięcia
	
	----- Funkcje
	
	-- Init (text, x, y, width)	-- Konstruktor
	
	-- SetPos (x, y)
	-- SetVisible (bool)
	-- SetEnabled (bool)
	-- SetText (text)
	-- SetClick (clickAction)
	
	-- OnClick ()
	-- OnRelease ()
	
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
	self.clicked	= false
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

function Button:SetClick (clickAction)
	self.click = clickAction
end

function Button:OnClick ()
	if enabled == true then
		self.clicked = true
		self.click()
	end
end

function Button:OnRelease ()
	self.clicked = false
end

function Button:Draw ()
	
end


--------------------------------------------
----ProgressBar-----------------------------
--------------------------------------------

ProgressBar = Class
{
	-- x
	-- y
	-- width
	-- height
  
	-- visible
	-- enabled
  
	-- progress   -- jak bardzo "wypełniony" jest pasek postępu
  
	----- Funkcje
  
	-- Init(x,y,width,progress)
  
	-- SetPos(x,y)
	-- SetSize(width,height)
	-- SetVisible(bool)
	-- SetEnabled(bool)
	-- SetProgress(progress)
  
	-- Draw()
}

function ProgressBar:Init (x,y,width,progress)
	self.progress = progress
	self.x, self.y - x, y
	self.width, self.height = width, 32
	self.visible = true
	self.enabled = true
end

function ProgressBar:SetPos (x,y)
	self.x, self.y = x, y
end

function ProgressBar:SetSize (width,height)
	self.width, self.height = width, height
end

function ProgressBar:SetVisible (bool)
	self.visible = bool
end

function ProgressBar:SetEnabled (bool)
	self.enabled = bool
end

function ProgressBar:SetProgress (progress)
	self.progress = progress
end

function ProgressBar:Draw()
	
end
