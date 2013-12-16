local socket = require "socket"

Server = Class {
-- dokumentacja klasy
}

function Server:init(port, handshake)
	self.callbacks = {
	recv = nil
	connect = nil
	disconnect = nil
	}
	self.ping = nil
	self.connected = false
	
	self.port = port
	self.handshake = handshake
end

function Server:listen()
	self:createSocket()
	self.socket:bind("*", self.port)
	self.socket:listen(5)
end