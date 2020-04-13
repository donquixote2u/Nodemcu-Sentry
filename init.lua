<<<<<<< HEAD
-- temperture sensing via ESP8266 
--manifest: ds, ds118b2, ide, WifiConnect, wificredentials
-- Constants
INTERVAL = 1200000      -- interval between data sends usec 
wifiTrys     = 0      -- reset counter of trys to connect to wifi
NUMWIFITRYS  = 20    -- Maximum number of WIFI Testings while waiting for connection
function init_sentry()
dofile("sentry.lua")
=======
-- telnet console 
--manifest: connectIP.lua, ide.lua
-- todo: convert timers to locally defined (general timers deprecated)
 -- Constants
SSID    = "SSID"
APPWD   = "password"
-- Some control variables
wifiTrys     = 0      -- Counter of trys to connect to wifi
NUMWIFITRYS  = 200    -- Maximum number of WIFI Testings while waiting for connection
function checkConn()    -- wait for internet
 if(CONNECTED) then
    tmr.stop(2)
    dofile("sentry.lua") -- once connected, start server
 else
    tmr.alarm( 2, 2000, 0, checkConn)
 end
>>>>>>> b0b837ba7003fa05d78f1cc941794bb737b58a82
end
initTimeout=5000       -- // timer in ms
initTimer=tmr.create()  -- // start timer
initTimer:alarm(initTimeout,tmr.ALARM_SINGLE,init_sentry) 
require("wificredentials")
require("WifiConnect")
