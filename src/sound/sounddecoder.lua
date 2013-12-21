snd_soundDecoder = nil

SoundDecoder = Class
{
}

function SoundDecoder:init()
	self.source = nil
	self.files = {}
	self:initFiles()
	--self.soundData = nil
end

function SoundDecoder:initFiles()
	-- files["name"] = "ścieżka"
	self.files["test"] = "sound/lol.wav"
end

function SoundDecoder:play(filename)
	assert (self.files[filename],"No file " .. filename .. " found.")
	
	self.source = love.audio.newSource(self.files[filename], "static")
	self.source:play()
end