--- COPYRIGHT ---
-- bla bla bla --



ProgressBar = Class
{	__includes = GuiElement
	
	--------------
	-- Atrybuty --
		
		-- currentProgress
		-- enabled
		-- maxProgress
		-- width

	------------
	-- Metody --
	
		-- init (name, x, y, width, currentProgress, maxProgress)

		-- getEnabled ()		: bool
		-- getMaxProgress ()	: int
		-- getProgress ()		: int, int
		-- getSize ()			: int
		
		-- setEnabled (bool)
		-- setProgress (currentProgress, maxProgress)
		-- setSize (width)

		-- draw()
}

function ProgressBar:init (name, x, y, width, currentProgress, maxProgress)
	GuiElement.init(self, name, x, y)
	self.enabled = true
	if currentProgress ~= nil then self.currentProgress = currentProgress
	else self.currentProgress = 0 end
	if maxProgress ~= nil then self.maxProgress = maxProgress
	else self.maxProgress = 100 end
	self.width = width
end

function ProgressBar:getEnabled ()		return self.enabled end
function ProgressBar:getMaxProgress ()	return self.maxProgress end
function ProgressBar:getProgress ()		return self.currentProgress, self.maxProgress end
function ProgressBar:getSize ()			return self.width end

function ProgressBar:setEnabled (bool)	self.enabled = bool end

function ProgressBar:setProgress (currentProgress, maxProgress)
	if currentProgress ~= nil then self.currentProgress = currentProgress
	else self.currentProgress = 0 end
	if maxProgress ~= nil then self.maxProgress = maxProgress
	else self.maxProgress = 100 end
end

function ProgressBar:setSize (width) self.width = width end

function ProgressBar:draw()
	GuiElement:draw ()	-- TYMCZASOWO
end