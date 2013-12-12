--- COPYRIGHT ---
-- bla bla bla --



------------------------------
-- Sekcja ladujaca podklasy --

require("src.gui.button")
require("src.gui.checkBox")
require("src.gui.guiElement")
require("src.gui.guiScreen")
-- require("src.gui.image")		Klasa jeszcze nie istnieje
require("src.gui.label")
-- require("src.gui.guiList")		Klasa jeszcze nie istnieje
require("src.gui.progressBar")
-- require("src.gui.radioBox")	Klasa jeszcze nie istnieje
-- require("src.gui.textEdit")	Klasa jeszcze nie istnieje



-------------
-- Zmienne --

gui_stdHeight	= 32		-- Standardowa wysokość elementów GUI



-------------
-- Klasa ----

Gui = Class
{
	--------------
	-- Atrybuty --
	
		-- screen {}

	------------
	-- Metody --
	
		-- init (firstScreen)
		-- delete ()
		
		-- switch ( screen)
}

function Gui:init (firstScreen)
	gui = GuiScreen()
	self.screen = {}
	
	InterfaceCreateScreens ()
	
	if self.screen[firstScreen] ~= nil then
		gui = self.screen[firstScreen]
	end
end

function Gui:delete ()
	for name, screen in pairs(self.screen) do
		screen.delete ()
		screen = nil
	end
end

function Gui:switch ( screen )
	gui = self.screen[screen]
end