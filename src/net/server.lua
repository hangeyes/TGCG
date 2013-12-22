Server = Class
{
	--------------
	-- Atrybuty --
	
	-- connected	-- bool
	-- handshake	-- string
	-- port			-- int
	-- callbacks {
		-- recv		-- function
		
	-- socket		-- master/server socket
	-- client		-- master/client socket
	
	--------------
	--- Metody ---
	
	-- Server:init()
	-- Server:listen()
	-- Server:accept()
	-- Server:createSocket()
	-- Server:send(data)
	-- Server:connect()	-- bool, string	-- zwraca parę (true, nil) jeśli nawiązano połączenie z klientem, w przeciwnym wypadku (false, błąd)
	-- Server:disconnect()
	-- Server:receive()	-- string	-- zwraca odebrane dane lub nil, gdy nic nie zostało odebrane
	-- Server:update(dt)
	-- Server:setCallback(recv)	-- recv oznacza to samo co dla klienta.
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
	self:createSocket()
	self.socket:bind("*", self.port)
	self.socket:listen(1)
end

function Server:createSocket()
	self.socket = socket.tcp()
	self.socket:settimeout(0)
	self.socket:setoption("reuseaddr", true)
end

function Server:accept()
	self.client = self.socket:accept()
	if self.client then
		self.client:settimeout(0)
		Gui.screen["MainMenu"].elements["lblDane4"]:setText("po accept, true")
		return true
	else
		Gui.screen["MainMenu"].elements["lblDane4"]:setText("po accept, false")
		return false
	end
end

function Server:send(data)
	client:send(data)
end

function Server:connect()
	self:accept()
	
	if self.client then
		local data = self:receive()
		Gui.screen["MainMenu"].elements["lblDane2"]:setText(data)
		if data == self.handshake .. "\n" .. "\n" then
			self.connected = true
			
		end
		return self.connected, "no message"
	end
	return self.connected, "Brak połączeń"
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
	local data, _, partial = self.client:receive("*l")
	if data == self.handshake then
		self. connected = true
	end
	while data do
		packet = packet .. data .. "\n"
		data, _, partial = self.client:receive("*l")
	end
	if not data and partial then
		packet = packet .. partial
	end
	if packet ~= "" then
		Gui.screen["MainMenu"].elements["lblDane2"]:setText(packet)
		return packet
	end
	return nil
end

function Server:update(dt)
	if self.client then
		assert(dt, "Update needs a dt")

		local data = self:receive()
		while data do
			if self.callbacks.recv then
				self.callbacks.recv(data)
			end
			data = self.receive()
		end
		
	else
		self:connect()
	end
end

function Server:setCallback(recv)
	self.callbacks.recv = recv
end

function Server:getConnected()
	return self.connected
end