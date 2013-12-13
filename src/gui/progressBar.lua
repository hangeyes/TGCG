--- COPYRIGHT ---
-- bla bla bla --



-------------
-- Zmienne --

	gui_pbMargin	= 4			-- Margines ProgressBara (margines?!?)

	

-------------
-- Funkcje --




-------------
-- Klasa ----

ProgressBar = Class
{	__includes = GuiElement
	
	--------------
	-- Atrybuty --
		
		-- currentProgress
		-- maxProgress
		-- width

	------------
	-- Metody --
	
		-- init (name, x, y, width, currentProgress, maxProgress)

		-- getMaxProgress ()	: int
		-- getProgress ()		: int, int
		-- getSize ()			: int
		
		-- setProgress (currentProgress, maxProgress)
		-- setSize (width)
		
		-- addProgress ()

		-- draw()
}

function ProgressBar:init (name, x, y, width, currentProgress, maxProgress)
	GuiElement.init(self, name, x, y)
	if currentProgress ~= nil then self.currentProgress = currentProgress
	else self.currentProgress = 0 end
	if maxProgress ~= nil then self.maxProgress = maxProgress
	else self.maxProgress = 100 end
	self.width = width
end

function ProgressBar:getMaxProgress ()	return self.maxProgress end
function ProgressBar:getProgress ()		return self.currentProgress, self.maxProgress end
function ProgressBar:getSize ()			return self.width end

function ProgressBar:setProgress (currentProgress, maxProgress)
	if currentProgress ~= nil then self.currentProgress = currentProgress
	else self.currentProgress = 0 end
	if maxProgress ~= nil then self.maxProgress = maxProgress
	else self.maxProgress = 100 end
end

function ProgressBar:setSize (width) self.width = width end

function ProgressBar:addProgress (x)
	self.currentProgress = self.currentProgress + x
	if self.currentProgress > self.maxProgress then self.currentProgress = self.maxProgress end
end

function ProgressBar:draw()
	if self.visible == true then
		love.graphics.setColor (clGrey)
		love.graphics.rectangle("fill", self.x, self.y+gui_pbMargin, self.width, gui_stdHeight-(2*gui_pbMargin))
		love.graphics.setColor (clLGrey)
		love.graphics.rectangle("line", self.x, self.y+gui_pbMargin, self.width, gui_stdHeight-(2*gui_pbMargin))
		
		love.graphics.setColor (clDGrey)
		love.graphics.rectangle("fill", self.x+gui_pbMargin, self.y+(2*gui_pbMargin), self.width-(2*gui_pbMargin), gui_stdHeight-(4*gui_pbMargin))
		love.graphics.setColor (clPBProgress)
		love.graphics.rectangle("fill", self.x+gui_pbMargin, self.y+(2*gui_pbMargin), (self.width-(2*gui_pbMargin))*(self.currentProgress/self.maxProgress), gui_stdHeight-(4*gui_pbMargin))
	end
end