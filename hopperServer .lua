local transportRequestAPI = dofile("transportRequestAPI.lua")




while true do
  -- listen for transport requests and watch for arrivals
  local event = table.pack(os.pullEvent())
  if event[1] == "turtle_inventory" then
  
  elseif event[1] == "modem_message" then
    local frequency = event[2]
    local returnFrequency = event[3]
    local message = event[4]
    local distance = event[5]
  
    if event[4] and type(event[4]) == "table"
  
  end
  
end