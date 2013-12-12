require ("src.gui.gui")

function InterfaceCreateScreens ()
	-- Test
	Gui.screen["Test"] = GuiManager()
	screenTestInit()

	-- Test 2
	Gui.screen["Test 2"] = GuiManager()
	screenTest2Init()
end

----------------------------------
-- Test Screen -------------------

function screenTestInit()
	Gui.screen["Test"]:newLabel ("FPS", 10, 10, "0 FPS", clWhite)	-- FPS
	Gui.screen["Test"]:newButton ("btnTestEnabled", 50, 40, "Jestem aktywnym przyciskiem!", 200)
	Gui.screen["Test"]:newCheckBox ("testCheckBox", 50, 80, "Jestem CheckBoxem!", false)
	Gui.screen["Test"]:newProgressBar ("testPBar", 50, 120, 200, 15, 100)
	Gui.screen["Test"]:newButton ("btnPBPlus", 50, 160, "+1", 50, screenTestPPlus)
	Gui.screen["Test"]:newButton ("btnTestDisabled", 50, 200, "Jestem nieaktywny...", 140)
	Gui.screen["Test"].elements["btnTestDisabled"]:setEnabled(false)
	Gui.screen["Test"]:newButton ("btnSwitchTo2", 50, 240, "Zmien na Test 2", 140, screenTestSwitchTo2)
end

function screenTestPPlus ()
	gui.elements["testPBar"]:addProgress(1)
end

function screenTestSwitchTo2 ()
	Gui:switch ("Test 2")
end

----------------------------------
-- Test 2 Screen -----------------

function screenTest2Init()
	Gui.screen["Test 2"]:newLabel ("FPS", 10, 10, "0 FPS", clWhite)	-- FPS
	Gui.screen["Test 2"]:newCheckBox ("testCheckBox", 100, 300, "Taka tam opcja", false)
	Gui.screen["Test 2"]:newCheckBox ("testCheckBox", 110, 335, "Taka tam druga opcja", false)
	Gui.screen["Test 2"]:newButton ("btnSwitchTo2", 120, 370, "Zmien na Test 1", 140, screenTest2SwitchTo1)
end

function screenTest2SwitchTo1 ()
	Gui:switch ("Test")
end