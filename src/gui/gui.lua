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
require("src.gui.skin")
require("src.gui.textBox")



-------------
-- Zmienne --

gui_blinkState	= 0			-- Stan mrugnięcia kursora
gui_stdCursor	= "_"		-- Standardowy wygląd kursora
gui_blinkDelay	= 0.5		-- Standardowa częstotliwość mrugania kursora (s)
gui_stdHeight	= 32		-- Standardowa wysokość elementów GUI



-------------
-- Funkcje --




-------------
-- Klasa ----

Gui = Class
{
	--------------
	-- Atrybuty --
	
		-- screen {}
		-- skins {}

	------------
	-- Metody --
	
		-- init (firstScreen)
		-- delete ()
		
		-- blink ()
		-- switch ( screen)
		-- update ()
}

function Gui:init (firstScreen)
	gui = GuiScreen()
	self.screen = {}
	self.skins = {}
	
	InterfaceCreateScreens ()
	InterfaceCreateSkins ()
	
	if self.screen[firstScreen] ~= nil then
		gui = self.screen[firstScreen]
	end
	
	self.blink()
end

function Gui:delete ()
	for name, screen in pairs(self.screen) do
		screen.delete ()
		screen = nil
	end
end

function Gui.blink ()
	if gui_blinkState == 0 then gui_blinkState = 1
	else gui_blinkState = 0 end
	Timer.add( gui_blinkDelay, Gui.blink )
end

function Gui:switch ( screen )
	gui = self.screen[screen]
end

function Gui:update (dt)
	
end