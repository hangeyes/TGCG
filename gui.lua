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
	
	----- Metody
	-- Init ()
	
	-- CreateButton (name, text, x, y, width)
	-- CreateProgressBar (name, text, x, y, width)
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

function Button:GetPos ()
	return self.x, self.y
end

function Button:OnClick ()
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
	self.x, self.y - x, y
	self.width = width
	self.visible = true
	self.enabled = true
end

function ProgressBar:SetPos (x, y)
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
	self.x, self.y = x, y
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
	-- Init(text,x,y,textFont,textSize,textColor)
	
	-- SetPos(x,y)
	-- SetVisible(bool)
	-- SetText(text)
	-- SetTextType(textFont, textSize, textColor)	-- ustawia wszystkie właściwości tekstu, potrzebna nowa nazwa, bo obecna jest do kitu
	
	-- Draw()
}

function Label:Init(text,x,y,textFont,textSize,textColor)
	self.text = text
	self.x, self.y = x, y
	self.textFont, self.textSize, self.textColor = textFont, textSize, textColor
end

function Label:SetPos(x,y)
	self.x, self.y = x, y
end

function Label:SetVisible(bool)
	self.visible = bool
end

function Label:SetText(text)
	self.text = text
end

function Label:SetTextType(textFont, textSize, textColor)
	self.textFont, self.textSize, self.textColor = textFont, textSize, textColor
end

function Label:Draw()

end