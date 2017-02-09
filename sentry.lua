--- on interrupt from Hall Effect Sensor pin, cal elapsed time since last int
function soundAlert()
print("\r\ninterrupt triggered")
for i=1,5,1
  do
   for j=-5,5,1
   do
      beep(speakerPin,650-(j*17),30+(5*j))
   end
  end
-- now load thingspeak send routines, set up xmit loop
tmr.alarm( 2 , 2500 , 0 ,  function() sendReq() end) 
end 

--enable interrupts
function enInt()     
    gpio.mode(SENSEPIN,gpio.INT)
    gpio.trig(SENSEPIN,'down',soundAlert)
end

--disable interrupts
function disInt()
     gpio.mode(SENSEPIN, gpio.INPUT)
end
function beep(pin, freq, duration)  
    print ("Frequency:" .. freq)  
    pwm.setup(pin, freq, 512)  
    pwm.start(pin)  
    -- delay in uSeconds  
    tmr.delay(duration * 1000)  
    pwm.stop(pin)  
    --20ms pause  
    tmr.wdclr()  
    tmr.delay(20000)  
end 
-- start here ; set up sensor pin interrupts, sound, send data
 --Port index7=GPIO13     
 speakerPin = 7;  
 gpio.mode(speakerPin,gpio.OUTPUT)
SENSEPIN = 1
require("webclient")
enInt()
dofile("ide.lua")

