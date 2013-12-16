Server = Class
{
}

function Server:init()
	self.connected = nil
	self.handshake = net_handshake
	self.port = net_port
	self.callbacks = {
		recv = nil
		--connect = nil
		--disconnect - nil
	}
	self.socket = nil
	self.client = nil
end

function Server:listen()
	self:createSocket
	self.socket:bind("*", self.port)
	self.socket:listen(1)
end

function Server:createSocket()
	self.socket = socket.tcp
	self.socket:settimeout(0)
	self.socket:setoption("reuseaddr", true)
end

function Server:accept()
	self.client = self.socket:accept()
end

function Server:send(data)
	client:send(data)
end

function Server:connect()
	local data = self:receive()
	if data == self.handshake then
		self.connected = true
	end
end

function Server:disconnect()
	if self.connected == true then
		local data = self:receive()
		if data == self.handshake then
			self.connected = false
			self.client:close()
			self.client = nil
		end
	end
end

function Server:receive()
	local packet = ""
	local data, _, partial = client:receive("*l")
	while data do
		packet = packet .. data .. "\n"
		data, _, partial = client:receive("*l")
	end
	if not data and partial then
		packet = packet .. partial
	end
	if packet ~= "" then
		return packet
	end
	return nil
end
	