local socket = require "socket"

Client = Class
{
	--------------
	--Atrybuty--
	
		-- host
		-- ip
		-- port
		-- data		-- brak settera, dane pobierane z serwera
		-- handshake	-- brak settera, handshake stały, ustawiany przy tworzeniu klienta
		-- socket	-- brak settera, bo po co
		-- callbacks	-- nie wiem, czy będzie setter. Chyba nie.
		-- ping		-- brak settera. Muszę tłumaczyć dlaczego?
		-- connected	-- brak settera
		
	--------------
	--Metody--
	
	-- Comming soon
	
}

function Client:init(port,handshake)
--ZEROWANIE ATRYBUTÓW--
	self.connected = false
	self.host = nil
	self.socket = false
	self.callbacks = {
		receive = nil
	}
	self.ping = nil
	self.ip = nil
	self.data = nil
	
--PRZYPISYWANIE WARTOŚCI--
	self.handshake = handshake
	self.port = port
end

--GETTERY--

function Client:getHost() return self.host end
function Client:getIp() return self.ip end
function Client:getPort() return self.port end
function Client:getData() return self.data end
function Client:getHandshake() return self.handshake end
function Client:getSocket() return self.socket end
function Client:getCallbacks() return self.callbacks end
function Client:getPing() return self.ping end
function Client:getConnected() return self.connected end

--SETTERY--

function Client:setHost(host)
	self.host = host
end

function Client:setIp(ip)
	self.ip = ip
end

function Client:setPort(port)
	self.port = port
end

--PRAWDZIWE METODY--

function Client:createSocket()
	self.socket = socket.tcp()
	self.socket:settimeout(0)
end

function Client:connect(host,dns)
	if not host or not port then
		return false, "Invalid arguments"
	end
	
	if dns ~= false then
		local ip = socket.dns.toip(host)
		if not ip then
			return false, "DNS failure"
		end
		host = ip
	end
	self:createSocket()
	self.host = host
	
	--TCP specific--
	self.socket:settimeout(5)
	local success, err = self.socket:connect(self.host,self.port)
	self.socket:settimeout(0)
	--END--
	
	if not success then
		return success, err
	end
	
	self.connected = true
	if self.handshake then
		self:send(self.handshake .. "+\n")
	end
	
	return true
	
end

function Client:disconnect()
	if self.connected = true then
		self:send(self.handshake .. "-\n")
		
		--TCP specific--
		self.socket:shutdown()
		--END--
		
		self.host = nil
		self.port = nil
	end
end

function Client:send(data)
	if not self.connected then
		return false, "Not connected"
	end
	return self.socket:send(data)
end

function Client:receive() -- zwraca odebrane dane lub false i treść błędu
	if not self.connected then
		return false, "Not connected"
	end
	
	--TCP specific--
	local packet = ""
	local data, err, partial = self.socket:receive(8192)
	while data do
		packet = packet .. data
		data, err, partial = self.socket:receive(8192)
	end
	if not data and partial then
		packet = packet .. partial
	end
	if packet ~= "" then
		return packet
	end
	return false, "No message received"
	--END--
	
end

function Client:update(dt)
	if not self.connected then return end
	assert(dt, "Update needs a dt")
	
	if self.callbacks.recv then
		local data, err = self:receive()
		while data do
			self.callbacks.recv(data)
			data, err = self:receive()
		end
	end
end