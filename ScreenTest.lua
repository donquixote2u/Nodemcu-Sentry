function init_test()
init_display() -- set up display screen ready to show data
initTimeout=1000
initTimer:alarm(initTimeout,tmr.ALARM_SINGLE,display_data) 
end
--   UPDATE SCREEN WITH DATA
function display_data()
print("starting screen test ... \r\n")
Scrxpos=10 -- current position on screen - x coordinate
Scrypos=20 -- current position on screen - y coordinate
--disp:setColor(255, 168, 0)
-- disp:setColor(0, 255, 0)
dprintl(2,"BIG/HEADING")
dprintl(2,"")
-- disp:setColor(20, 240, 240)
dprint(2,"This is another line")
dprintl(2,"")
dprint(1,"This is a small line")
dprint(1,".. as is this")
print("ending screen test ... \r\n")
initTimeout=5000
initTimer:alarm(initTimeout,tmr.ALARM_SINGLE,init_test)
end
-- start here
dofile("screen2.lua")
initTimeout=5000       -- // timer in ms
initTimer=tmr.create()  -- // start timer
initTimer:alarm(initTimeout,tmr.ALARM_SINGLE,init_test) 
