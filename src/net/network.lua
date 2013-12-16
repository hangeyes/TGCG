require ("src.net.client")
require ("src.net.server")
socket = require ("socket")

local network = {}
-------------
-- Zmienne --

--net_socketType = "tcp"
net_port = 3661
net_handshake = "huehue such doge"
net_serverMessage = "Jestem serwerem \n odebralem dane"
net_clientMessage = "Jestem klientem \n odebralem dane"
--net_node = nil -- stwierdza, czy program powinien zachowywać się jak klient (net_node = "client") czy serwer (net_node = "server")
net_object = nil -- to samo, co wyżej, tylko przechowuje obiekt będący serwerem lub klientem

function createNetworkNode(node,ip)
	if node then
		if node == "server" then
			net_object = Server()
		elseif node == "client" then
			assert(ip, "If you want to connect, you need an IP adress")
			net_object = Client(ip)
		end
	end
end

function updateNetwork(dt)
	if net_object then
		net_object:update(dt)
	end
end

function send()
	if node == "server" then
		net_object:send(net_serverMessage)
	elseif node == "client"
		net_object:send(net_clientMessage)
	end
end