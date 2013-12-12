require ("src.gui.gui")

function InterfaceCreateScreens ()
	-- MainMenu
	Gui.screen["MainMenu"] = GuiScreen()
	screenMainMenuInit()
	
	-- Test
	Gui.screen["Test"] = GuiScreen()
	screenTestInit()
end



----------------------------------
-- MainMenu Screen ---------------

function screenMainMenuInit()
	Gui.screen["MainMenu"]:newLabel ("FPS", 10, 10, "0 FPS", clWhite)	-- FPS
	
	Gui.screen["MainMenu"]:newButton ("btnConnect", 100, 100, "Polacz", 100, screen_MainMenu_btnConnect)
	Gui.screen["MainMenu"]:newButton ("btnHost", 250, 100, "Hostuj", 100, screen_MainMenu_btnHost)
	Gui.screen["MainMenu"]:newLabel ("lblIP", 100, 140, "Tutaj bedzie TextBox na nr IP", clWhite)
	Gui.screen["MainMenu"]:newLabel ("lblDane1", 100, 200, "Tekst z danymi 1", clWhite)
	Gui.screen["MainMenu"]:newLabel ("lblDane2", 100, 232, "Tekst z danumi 2", clWhite)
	Gui.screen["MainMenu"]:newLabel ("lblDane3", 100, 264, "Tekst z danumi 3", clWhite)
	
	Gui.screen["MainMenu"]:newButton ("btnTest", 100, 500, "Ekrany testowe", 110, screen_MainMenu_btnTest)
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
	Gui.screen["Test"]:newLabel ("FPS", 10, 10, "0 FPS", clWhite)	-- FPS
	
	Gui.screen["Test"]:newButton ("btnTestEnabled", 35, 35, "Jestem aktywnym przyciskiem!", 200)
	Gui.screen["Test"]:newButton ("btnTestDisabled", 35, 70, "Jestem nieaktywny...", 140)
	Gui.screen["Test"].elements["btnTestDisabled"]:setEnabled(false)
	Gui.screen["Test"]:newCheckBox ("testCheckBox", 35, 105, "Jestem CheckBoxem!", false)
	Gui.screen["Test"]:newProgressBar ("testPBar", 35, 140, 300, 0, 100)
	Gui.screen["Test"]:newButton ("btnPBPlus", 35, 175, "+1", 50, screenTest_btnPBPlus)
	Gui.screen["Test"]:newButton ("btnMainMenu", 35, 500, "Wróć do menu głównego", 200, screen_Test_btnMainMenu)
end

function screenTest_btnPBPlus ()
	gui.elements["testPBar"]:addProgress(1)
end

function screen_Test_btnMainMenu ()
	Gui:switch("MainMenu")
end