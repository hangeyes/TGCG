--- COPYRIGHT ---
-- bla bla bla --



------------------------------
-- Sekcja ladujaca podklasy --

require ("src.gui.gui")



-------------
-- Zmienne --




-------------
-- Funkcje --

function InterfaceCreateScreens ()
	-- MainMenu
	Gui.screen["MainMenu"] = GuiScreen("1")
	screenMainMenuInit()
	
	-- Test
	Gui.screen["Test"] = GuiScreen("1")
	screenTestInit()
end

function InterfaceCreateSkins ()
	-- "1"
	local x = "1"
	Gui.skins[x] = Skin (x)
	Gui.skins[x]:makeButtonQuads (5, 5, 9, 21, gui_stdHeight)
	Gui.skins[x]:makeTextBoxQuads (5, 5, 9, 21, gui_stdHeight)
	
end



----------------------------------
-- MainMenu Screen ---------------

function screenMainMenuInit()
	local x = "MainMenu"
	Gui.screen[x]:newLabel ("FPS", 10, 10, "0 FPS", clWhite)	-- FPS
	
	Gui.screen[x]:newButton ("btnConnect", 100, 100, "Polacz", 100, screen_MainMenu_btnConnect)
	Gui.screen[x]:newButton ("btnHost", 250, 100, "Hostuj", 100, screen_MainMenu_btnHost)
	Gui.screen[x]:newLabel ("lblIP", 100, 140, "Tutaj bedzie TextBox na nr IP", clWhite)
	Gui.screen[x]:newLabel ("lblDane1", 100, 200, "Tekst z danymi 1", clWhite)
	Gui.screen[x]:newLabel ("lblDane2", 100, 232, "Tekst z danumi 2", clWhite)
	Gui.screen[x]:newLabel ("lblDane3", 100, 264, "Tekst z danumi 3", clWhite)
	
	Gui.screen[x]:newButton ("btnTest", 100, 500, "Ekrany testowe", 110, screen_MainMenu_btnTest)
end

function screen_MainMenu_btnConnect ()
	-- Kod po kliknieciu Polacz
end

function screen_MainMenu_btnHost ()
	-- Kod po kliknieciu Hostuj
end

function screen_MainMenu_btnTest ()	-- Przelacza na ekran testowania GUI
	Gui:switch("Test")
end

----------------------------------
-- Test Screen -------------------

function screenTestInit()
	local x = "Test"
	Gui.screen[x]:newLabel ("FPS", 10, 10, "0 FPS", clWhite)	-- FPS
	
	Gui.screen[x]:newButton ("btnTestEnabled", 35, 35, "Jestem aktywnym przyciskiem!", 200)
	Gui.screen[x]:newButton ("btnTestDisabled", 35, 70, "Jestem nieaktywny...", 140)
	Gui.screen[x].elements["btnTestDisabled"]:setEnabled(false)
	Gui.screen[x]:newCheckBox ("testCheckBox", 35, 105, "Jestem CheckBoxem!", false)
	Gui.screen[x]:newProgressBar ("testPBar", 35, 140, 300, 0, 100)
	Gui.screen[x]:newButton ("btnPBPlus", 35, 175, "+1", 50, screenTest_btnPBPlus)
	Gui.screen[x]:newButton ("btnPBPlus2", 35, 210, "+1", 50, screenTest_btnPBPlus)
	Gui.screen[x]:newButton ("btnMainMenu", 35, 500, "Wróć do menu głównego", 200, screen_Test_btnMainMenu)
	Gui.screen[x]:newTextBox ("tbxSimple", 35, 245, "TextBox", 200, 20)
end

function screenTest_btnPBPlus ()
	gui.elements["testPBar"]:addProgress(1)
end

function screen_Test_btnMainMenu ()
	Gui:switch("MainMenu")
end