--9/17/15
--
--Ian Smelser

local but1 = display.newImage("Ch3Square.png",display.contentCenterX,display.contentCenterY)
local but2 = display.newImage("Ch3ShowButton.png",display.contentCenterX,display.contentCenterY+300)

transition.to( square, { time=2000, x = center.x, y = center.y+400 } )