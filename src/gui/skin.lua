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
	
	self.quads = {}
	self.sizes = {}
end

function Skin:makeButtonQuads (btn_left, btn_center, btn_right, btnWidth, btnHeight)
	self.sizes.btn_left		= btn_left
	self.sizes.btn_center	= btn_center
	self.sizes.btn_right	= btn_right
	self.quads.btn_left		= love.graphics.newQuad (0, 0, btn_left, btnHeight, btnWidth, btnHeight)
	self.quads.btn_center	= love.graphics.newQuad (btn_left+1, 0, btn_center, btnHeight, btnWidth, btnHeight)
	self.quads.btn_right	= love.graphics.newQuad (btn_left+btn_center+2, 0, btn_right, btnHeight, btnWidth, btnHeight)
end