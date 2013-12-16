love.filesystem.require("LUBE.lua")

server = LUBE.server

function connCallback(ip, port)
	
end

function rcvCallback(data, ip, port)
end

function disconnectCallback(ip, port)

end

function load(handshake,ip,port)
	
	server:Init(port)
	server.setCallback(rcvCallback,connCallback,disconnectCallback)
	server.setHandshake(handshake)
		
end

function update(dt)

	server.update()
	
end