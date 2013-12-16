love.filesystem.require("libs.LUBE")

local client = LUBE.client

function rcvCallback(data)

end

function load(handshake,ip,port)

	client:Init("tcp")
	client:setHandshake(handshake)
	client:setCallback(rcvCallback)
	client:connect(ip,port)
	
end

function update(dt)

	client.update()

end
