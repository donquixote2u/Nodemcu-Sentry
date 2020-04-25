function send()
DATA["field3"]=t.readNumber(6) -- read io12 again
print("the temperature is  "..DATA["field3"])
-- t = nil 
-- ds18b20 = nil 
-- package.loaded["ds18b20"]=nil
-- sendData()                      -- send to Thingspeak
initTimer:alarm(initTimeout,tmr.ALARM_SINGLE,function() send() end) 
Scrxpos=2 -- current position on screen - x coordinate
Scrypos=2 -- current position on screen - y coordinate
dprint(2,DATA["field3"].."°")
end

initTimeout=INTERVAL       -- // timer in ms
-- initTimer:alarm(initTimeout,tmr.ALARM_SINGLE,function() checkConnection(wifi_send) end) 
initTimer:alarm(initTimeout,tmr.ALARM_SINGLE,send) 
t=require("ds18b20") 
-- dofile("TSClient.lua")
DATA["field3"]=t.readNumber(6) -- read io12 but first always rubbish
