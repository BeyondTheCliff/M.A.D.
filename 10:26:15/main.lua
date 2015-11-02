--testing
--10/29/15

local options = {
   text = "Hello World",
   x = 30,
   y = display.contentCenterY,
   fontSize = 60,
   width = 200,
   height = 50,
   align = "right"
}

local textBox = display.newText( options )
textBox:setFillColor( 1, 0.5, 0.2 )