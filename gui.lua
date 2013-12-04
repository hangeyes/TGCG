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
-- Zmienne globalne ---------------------------

local gui_stdHeight	= 32		-- Standardowa wysokość elementów GUI

-----------------------------------------------
-- Metody -------------------------------------



-----------------------------------------------
-- Klasy --------------------------------------

-- GUIMANAGER----------------
local GuiManager = Class
{
	----- Atrybuty
	-- elements = {}		-- zawiera wszystkie elementy GUI
	-- clicked				-- zawiera nazwę elementu który został "naciśnięty"
	
	----- Metody
	-- Init ()
	
	-- CreateButton (name, text, x, y, width)
	-- CreateProgressBar (name, x, y, width, maxProgress, currentProgress)
	-- CreateCheckBox (name, text, x, y, checked)
	-- CreateLabel (name, text, x, y, textFont, textSize, textColor)
	
	-- OnClick (x, y)
	-- OnRelease ()
	
	-- Delete (name)
}

function GuiManager:Init ()
	self.elements = {}
end

function GuiManager:CreateButton (name, ...)
	elements[name] = Button:Init (unpack(arg))
end

function GuiManager:CreateProgressBar (name, ...)
	elements[name] = ProgressBar:Init (unpack(arg))
end

function GuiManager:CreateCheckBox (name, ...)
	elements[name] = CheckBox:Init (unpack(arg))
end

function GuiManager:CreateLabel (name, ...)
	elements[name] = Label:Init (unpack(arg))
end

function OnClick (x, y)
	for name, element in pairs(self.elements) do
		if element.OnClick(x, y) == true then
			if element.OnRelease != nil then self.clicked = name end	-- dodaje kliknięty element do "naciśniętych"
			break
		end
	end
end

function OnRelease ()
	if self.clicked != nil then
		self.elements[self.clicked].OnRelease()
		self.clicked = nil
	end
end

function GuiManager:Delete (name)
	if elements[name].Delete != nil then elements[name].Delete() end	-- Wywołanie destruktora jeśli takowy istnieje
	elements[name] = nil
end

-- BUTTON -------------------
local Button = Class
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
	
	-- GetPos ()
	
	-- OnClick (x, y)
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
	if self.x != nil then self.x = x end
	if self.y != nil then self.y = y end
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

function Button:GetPos ()
	return self.x, self.y
end

function Button:OnClick (x, y)
	if ( x >= self.x ) then
		if ( self.x + self.width >= x ) then
			if ( y >= self.y ) then
				if ( self.y + gui_stdHeight >= y ) then
					if enabled == true then
						self.clicked = true
						self.click()
						return true
					end else return false
				end else return false
			end else return false
		end else return false
	end else return false
end

function Button:OnRelease ()
	self.clicked = false
end

function Button:Draw ()
	
end



-- PROGRESSBAR --------------
local ProgressBar = Class
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

function ProgressBar:Init (x, y, width, maxProgress, currentProgress)
	self.maxProgress = maxProgress
	self.currentProgress = currentProgress
	self.x, self.y = x, y
	self.width = width
	self.visible = true
	self.enabled = true
end

function ProgressBar:SetPos (x, y)
	if self.x != nil then self.x = x end
	if self.y != nil then self.y = y end
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



-- CHECKBOX -----------------
local CheckBox = Class
{
	----- Atrybuty
	-- text
	-- x
	-- y
	-- visible
	-- enabled
	-- checked

	----- Metody
	-- Init (text, x, y, checked)

	-- SetPos (x, y)
	-- SetText (text)
	-- SetVisible (bool)
	-- SetEnabled (bool)
	-- SetChecked (bool)
}

function CheckBox:Init(text, x, y, checked)
	self.text = text
	self.x, self.y = x, y
	self.checked = checked
end

function CheckBox:SetPos(x, y)
	if self.x != nil then self.x = x end
	if self.y != nil then self.y = y end
end

function CheckBox:SetText (text)
	self.text = text
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



--LABEL------------------------
local Label = Class
{
	----- Atrybuty
	-- text
	-- x
	-- y
	
	-- visible
	
	-- textFont		-- krój tekstu
	-- textSize		-- rozmiar czcionki
	-- textColor	-- kolor czcionki
	
	----- Metody
	-- Init(text, x, y, textFont, textSize, textColor)
	
	-- SetPos (x, y)
	-- SetVisible (bool)
	-- SetText (text)
	-- SetFormat (textFont, textSize, textColor)	-- ustawia właściwości tekstu
	
	-- Draw()
}

function Label:Init (text, x, y, textFont, textSize, textColor)
	self.text = text
	self.x, self.y = x, y
	self.textFont, self.textSize, self.textColor = textFont, textSize, textColor
end

function Label:SetPos (x, y)
	if self.x != nil then self.x = x end
	if self.y != nil then self.y = y end
end

function Label:SetVisible (bool)
	self.visible = bool
end

function Label:SetText (text)
	self.text = text
end

function Label:SetFormat (textFont, textSize, textColor)
	if textFont != nil then self.textFont = textFont end
	if textSize != nil then self.textSize = textSize end
	if textColor != nil then self.textColor = textColor end
end

function Label:Draw()

end