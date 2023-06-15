local socket = require("socket")
local security = require("security")

local host = "localhost"
local port = 80


local server = assert(socket.bind(host, port))

print("Lua Server started on " .. host .. ":" .. port)

while true do
  local client = server:accept()
  print("Client connected: " .. client:getpeername())

  while true do
    local data, err = client:receive()

    if data then
      print("Received data from client: " .. data)

      local response = "Server received: " .. data .. "\n"

      client:send(response)
    elseif err == "closed" then
      print("Client disconnected: " .. client:getpeername())
      break
    else
      print("Error receiving data: " .. err)
      break
    end
  end

  client:close()
end

server:close()