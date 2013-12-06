--- COPYRIGHT ---
-- bla bla bla --



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

function CheckBox:draw ()
	GuiElement:draw ()	-- TYMCZASOWO
end