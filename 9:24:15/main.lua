--9/24/15
--Ian Smelser
--Assignment 3

--Images
local center = display.newImage("Ch3Center.png")
local square = display.newImage("Ch3Square.png")

--Centering
center.x = display.contentWidth/2
center.y = display.contentHeight/2
--Random start location for the square
square.x = math.random(display.contentWidth)
square.y = math.random(display.contentHeight)

--Animation module
transition.to( square, { time=2000, x = center.x, y = center.y } )
