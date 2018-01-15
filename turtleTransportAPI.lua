-- os.loadAPI or require, both should work


local api = shell and {} or (_ENV or getfenv())

if not rednet.host then
  error("turtleTransportAPI can't find a required function. It's possible that your CC version is too old.")
end

api.PROTOCOL_NAME = "turtleTransportationFramework"

api.bindModem = rednet.open

-- Transport Station API
-- This is the API for computers which run the stations where turtles 'board' the transports.
api.transportStationAPI = {}
local transportStationAPI = api.transportStationAPI -- cache for internal use

local STATION_NAME
local routes = {}

function transportStationAPI.registerStation(stationName)
  if type(stationName) ~= "string" then
    return false, "Station name must be a string."
  end
  
  STATION_NAME = stationName
  
  local success, errorString = pcall(rednet.host, api.PROTOCOL_NAME, STATION_NAME)
  if not success then
    if type(errorString) == "string" and errorString == "pcall: Hostname in use" then
      return false, "Station name already registered, on multiplayer servers it's recommended to prepend destinations with your username."
    elseif type(errorString) == "string" and errorString == "Reserved hostname" then
      return false, "Invalid station name"
    else
      error("unknown error from pcall rednet.host: "..tostring(errorString))
    end
  end
  return true 
end

function transportStationAPI.unregisterStation()
  rednet.unhost(PROTOCOL_NAME)
end

function transportStationAPI.registerRoute(remoteStationNameOrID) -- TODO: decide how this works
  if type(remoteStationNameOrID) == "string" then
end



-- Turtle API
-- This is the API for the turtles which will be transported using the system.
api.turtleAPI = {}
local turtleAPI = api.turtleAPI -- cache for internal use





return api