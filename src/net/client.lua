Client = Class
{
--------------
---Atrybuty---

	-- ip	-- adres serwera z którym klient będzie się łączył
	-- port
	-- connected	-- czy klient jest połączony
	-- socket
	-- callbacks	-- tablica z jednym elementem, którym jest funkcja wywoływana po odebraniu danych
	-- handshake

--------------
----Metody----
	-- Client:init(ip)	-- ip jest łańcuchem znaków, który reprezentuje adres IPv4 serwera, z którym ma zostać nawiązane połączenie
	-- Client:setCallback(recv)	-- recv jest funkcją wywoływaną za każdym razem, gdy klient odbierze dane od serwera
	-- Client:createSocket()
	-- Client:connect()	-- bool, err -- zwraca parę (true, nil) jeśli udało się połączyć z serwerem. W przeciwnym wypadku zwraca (false, błąd)
	-- Client:disconnect()
	-- Client:send(data)	-- int	-- zwraca liczbę wysłanych bajtów lub false jeśli wysyłanie się nie powiodło.
	-- Client:receive()	-- string	-- zwraca odebrane dane
	-- Client:update(dt)

}

function Client:init(ip)	-- konstruktor
	self.port = net_port
	self.handshake = net_handshake
	self.ip = ip
	
	self.connected = false
	self.socket = nil
	self.callbacks = {
		recv = nil
	}
end

function Client:setCallback(recv)
	self.callbacks.recv = recv
end

function Client:createSocket()
	self.socket = socket.tcp()
	self.socket:settimeout(0)
end

function Client:connect()
	self:createSocket()
	self.socket:settimeout(5)
	local success, err = self.socket:connect(self.ip, self.port)
	self.socket:settimeout(0)
	if not success then
		self.ip = nil
		self.port = nil
		return false, err
	end
	self.connected = true
	if self.handshake then
		self:send(self.handshake .. "\n")
	end
	return true
end

function Client:disconnect()
	if self.connected then
		self:send(self.handshake .. "\n")
		self.socket:shutdown()
		self.ip = nil
		self.port = nil
	end
end

function Client:send(data)
	if not self.connected then
		return false, "Not connected"
	end
	
	return self.socket:send(data)
end

function Client:receive()
	if not self.connected then
		return false, "Not connected"
	end
	
	local packet = ""
	local data, _, partial = self.socket:receive("*l")
	while data do
		packet = packet .. data .. "\n"
		data, _, partial = self.socket:receive("*l")
	end
	if not data and partial then
		packet = packet .. partial
	end
	if packet ~= "" then
		return packet
	end
	return nil, "No messages"
end

function Client:update(dt)
	if not self.connected then return end
	assert(dt, "update needs a dt")
	
	if self.callbacks.recv then
		local data, err = self:receive()
		while data do
			self.callbacks.recv(data)
			data, err = self:receive()
		end
	end
end