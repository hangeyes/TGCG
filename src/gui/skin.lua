--- COPYRIGHT ---
-- bla bla bla --



-------------
-- Zmienne --




-------------
-- Funkcje --




-------------
-- Klasa ----

Skin = Class
{
	--------------
	-- Atrybuty --
	
		-- images {}
		-- name
		-- quads {}
		-- sizes {}

	------------
	-- Metody --
	
		-- init (skinName)
		
		-- makeButtonQuads (btn_left, btn_center, btn_right, btnWidth, btnHeight)
}

function Skin:init (skinName)
	self.name = skinName
	local folder = pathGraphics .. "/gui/" .. skinName .. "/"
	self.images = {}
	self.images.btn_click	= love.graphics.newImage(folder .. "btn_click.png")
	self.images.btn_dis		= love.graphics.newImage(folder .. "btn_dis.png")
	self.images.btn_hover	= love.graphics.newImage(folder .. "btn_hover.png")
	self.images.btn_idle	= love.graphics.newImage(folder .. "btn_idle.png")
	self.images.tbx_dis		= love.graphics.newImage(folder .. "tbx_dis.png")
	self.images.tbx_idle	= love.graphics.newImage(folder .. "tbx_idle.png")
	self.images.tbx_sel		= love.graphics.newImage(folder .. "tbx_sel.png")
	
	self.quads = {}
	self.sizes = {}
end

function Skin:makeButtonQuads (left, center, right, width, height)
	self.sizes.btn_left		= left
	self.sizes.btn_center	= center
	self.sizes.btn_right	= right
	self.quads.btn_left		= love.graphics.newQuad (0, 0, left, height, width, height)
	self.quads.btn_center	= love.graphics.newQuad (left+1, 0, center, height, width, height)
	self.quads.btn_right	= love.graphics.newQuad (left+center+2, 0, right, height, width, height)
end

function Skin:makeTextBoxQuads (left, center, right, width, height)
	self.sizes.tbx_left		= left
	self.sizes.tbx_center	= center
	self.sizes.tbx_right	= right
	self.quads.tbx_left		= love.graphics.newQuad (0, 0, left, height, width, height)
	self.quads.tbx_center	= love.graphics.newQuad (left+1, 0, center, height, width, height)
	self.quads.tbx_right	= love.graphics.newQuad (left+center+2, 0, right, height, width, height)
end