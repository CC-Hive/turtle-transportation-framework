-- os.loadAPI or require, both should work


local api = shell and {} or (_ENV or getfenv())

api.modemChannel = 65270 -- I just picked a random number above 65000 but below the max, hopefully this is unique.

api.modem = false -- If you want to override the communication method (redstone perhaps?) then set this to a table which mimics a wireless modem, don't forget to open the modem channel (or make a stub function which mimics this).

function api.setUpModem()
  if not api.modem then
    api.modem = peripheral.find("modem", function(name, object) return object.isWireless() end )
  end
  api.modem.open(api.modemChannel)
end

local function checkForModem()
  if not api.modem  then
    error("API not assigned a modem, use api.setUpModem()")
  end
end


function api.getListOfDestinations()
  checkForModem()
end

function api.setDestination(destinationName)
  checkForModem()
end

function api.requestBoarding()
  checkForModem()
end

function api.filterEvent(...)
  local args = table.pack(...)
  if event[1] == "modem_message" then
    local frequency = event[2]
    local returnFrequency = event[3]
    local message = event[4]
    local distance = event[5]
    
end




return api