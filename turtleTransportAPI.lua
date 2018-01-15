-- os.loadAPI or require, both should work


local api = shell and {} or (_ENV or getfenv())

api.PROTOCOL_NAME = "turtleTransportationFramework"

-- Transport Station API
-- This is the API for computers which run the stations where turtles 'board' the transports.
api.transportStationAPI = {}
local transportStationAPI = api.transportStationAPI -- cache for internal use




-- Turtle API
-- This is the API for the turtles which will be transported using the system.
api.turtleAPI = {}
local turtleAPI = api.turtleAPI -- cache for internal use





return api