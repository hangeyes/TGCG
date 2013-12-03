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
-- Zmienne globalne ---------------------------
-----------------------------------------------

gui_stdHeight	= 32		-- Standardowa wysokość elementów GUI


-----------------------------------------------
-- BUTTON -------------------------------------
-----------------------------------------------

Button = Class
{
	----- Atrybuty
	-- text			-- Tekst wyświetany przez przycisk
	-- x			-- Pozycja X
	-- y			-- Pozycja Y
	-- width		-- Szerokość przycisku
	
	-- visible		-- Czy przycisk jest widoczny
	-- enabled		-- Czy przycisk jest aktywny
	-- clicked		-- Czy przycisk jest w danej chwili wciśniety
	
	-- click		-- Funkcja wywoływana podczas kliknięcia
	
	----- Metody
	-- Init (text, x, y, width)	-- Konstruktor
	
	-- SetPos (x, y)
	-- SetSize (width)
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
	self.visible= true
	self.enabled= true
	self.clicked= false
end

function Button:SetPos (x, y)
	self.x = x
	self.y = y
end

function Button:SetSize (width)
	self.width = width
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
	----- Atrybuty
	-- x
	-- y
	-- width
	-- maxProgress
	-- currentProgress
  
	-- visible
	-- enabled

  
	----- Metody
	-- Init(x,y,width, maxProgress, currentProgress)

	-- SetPos(x,y)
	-- SetSize(width)
	-- SetVisible(bool)
	-- SetEnabled(bool)
	-- SetProgress(progress)
  
	-- Draw()
}

function ProgressBar:Init (x,y,width, maxProgress, currentProgress)
	self.maxProgress = maxProgress
	self.currentProgress = currentProgress
	self.x, self.y - x, y
	self.width = width
	self.visible = true
	self.enabled = true
end

function ProgressBar:SetPos (x,y)
	self.x, self.y = x, y
end

function ProgressBar:SetSize (width)
	self.width = width
end

function ProgressBar:SetVisible (bool)
	self.visible = bool
end

function ProgressBar:SetEnabled (bool)
	self.enabled = bool
end

function ProgressBar:SetProgress (progress)
	self.currentProgress = progress
end

function ProgressBar:Draw()
	
end

-------------------------------------------
----CheckBox-------------------------------
-------------------------------------------

CheckBox = Class
{
  ---Atrybuty
  
  -- x
  -- y
  -- visible
  -- enabled
  -- checked
  
  --- Metody
  
  -- Init(x,y,checked)
  
  -- SetPos(x,y)
  -- SetVisible(bool)
  -- SetEnabled(bool)
  -- SetChecked(bool)
}

function CheckBox:Init(x,y,checked)
  self.x, self.y = x, y
  self.checked = checked
end

function CheckBox:SetPos(x,y)
  self.x, self.y = x, y
end

function CheckBox:SetVisible(bool)
  self.visible = bool
end

function CheckBox:SetEnabled(bool)
  self.enabled = bool
end

function CheckBox:SetChecked(bool)
  if self.enabled == true then
    self.checked = bool
  end
end