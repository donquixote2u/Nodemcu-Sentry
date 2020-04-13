function wifi_send()
DATA["field3"]=t.readNumber(6) -- read io12 but first always rubbish
DATA["field3"]=t.readNumber(6) -- read io12 again
print("the temperature is  "..DATA["field3"])
t = nil 
ds18b20 = nil 
package.loaded["ds18b20"]=nil
sendData()                      -- send to Thingspeak
initTimeout=5000       -- // timer in ms before restart
initTimer:alarm(initTimeout,tmr.ALARM_SINGLE,function() node.restart() end) 
end

initTimeout=INTERVAL       -- // timer in ms
initTimer:alarm(initTimeout,tmr.ALARM_SINGLE,function() checkConnection(wifi_send) end) 
t=require("ds18b20") 
dofile("TSClient.lua")
