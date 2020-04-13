-- temperture sensing via ESP8266 
--manifest: ds, ds118b2, ide, WifiConnect, wificredentials
-- Constants
INTERVAL = 1200000      -- interval between data sends usec 
wifiTrys     = 0      -- reset counter of trys to connect to wifi
NUMWIFITRYS  = 20    -- Maximum number of WIFI Testings while waiting for connection
function init_sentry()
dofile("sentry.lua")
end
initTimeout=5000       -- // timer in ms
initTimer=tmr.create()  -- // start timer
initTimer:alarm(initTimeout,tmr.ALARM_SINGLE,init_sentry) 
require("wificredentials")
require("WifiConnect")
