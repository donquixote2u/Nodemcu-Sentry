-- U8G2 SCREEN HANDLING FOR SSD1306
function init_display()
   -- Hardware SPI CLK=GPIO14 MOSI=GPIO13 MISO=GPIO12 (not used)
   -- CS, D/C, and RES can be assigned freely to available GPIOs
    local cs  = 8 -- GPIO15, pull-down 10k to GND
    local dc  = 4 -- GPIO2
    local res = 0 -- GPIO16
    spi.setup(1, spi.MASTER, spi.CPOL_LOW, spi.CPHA_LOW, 8, 8)
    -- we won't be using the HSPI /CS line, so disable it again
    gpio.mode(8, gpio.INPUT, gpio.PULLUP)
    disp = u8g2.ssd1306_128x64_noname(1, cs, dc, res)
    disp:clearBuffer()
    disp:setFontMode(0)          -- SOLID
    -- disp:setDisplayRotation(U8G2_R1) -- disp:setRotate90()
    disp:setFontRefHeightExtendedText()
    disp:setDrawColor(1)
    disp:setFontPosTop()
    disp:setFontDirection(0)
end
-- ------ SCREEN DISPLAY HANDLER -----------
function dprint(font_index,content)
-- compiled fonts; helvB08_hr,helvB10_hr,helvB12_hr,helvB18_hr
-- (tr=transparent) ncenB24_tr,ncenR12_tr,ncenR14_hr,7x13B_tr
   if      (font_index==2) then
    -- disp:setFont(u8g2.font_ncenB24_tr)
    disp:setFont(u8g2.font_helvB18_tr)
   else -- default 
    font_index=1  
    disp:setFont(u8g2.font_helvB10_tr)
   end
  -- disp:setPrintPos(Scrxpos,Scrypos)
  disp:drawStr(Scrxpos,Scrypos,content) -- disp:print(content)
  disp:sendBuffer()  -- display it!
  Scrxpos=Scrxpos+(string.len(content)*((font_index+1)*6))
  if(Scrxpos>128) then Scrxpos=2 end
end
--    ==================================================
function dprintl(font_index,content)
dprint(font_index,content)
local spacer=(6*(font_index+2))+10 -- calc y spacing to next line
Scrypos=Scrypos+spacer
Scrxpos=2
if(Scrypos>64) then Scrypos=2 end
end
