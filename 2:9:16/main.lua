--Ian Smelser
--2/9/16
--Physics

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)

local physics = require("physics")
physics.start(true)
physics.setGravity(0,0.2)
local gx, gy = 0.0, 0.1
local x, y = 0, 0

local gravityX = display.newText("X="..gx, display.contentWidth*.1, display.contentHeight*.1, nil, 20)
local gravityY = display.newText("Y="..gy, display.contentWidth*.1, display.contentHeight*.15, nil, 20)

local ground = display.newRect(display.contentCenterX, display.contentHeight, display.contentWidth,10)
local leftSide = display.newRect(1,display.contentCenterY,10,display.contentHeight)
local rightSide = display.newRect(display.contentWidth, display.contentCenterY, 10, display.contentHeight)
local top = display.newRect(display.contentCenterX, 1, display.contentWidth, 10)
physics.addBody(ground,"static")
physics.addBody(leftSide,"static")
physics.addBody(rightSide,"static")
physics.addBody(top,"static")

local crate = display.newImage("crateB.png")
crate.x = display.contentCenterX
crate.y = display.contentCenterY
physics.addBody(crate,"dynamic",{density=1.0, friction =0.3, bounce =
0.2})

local upButton = display.newImage("arrowButton.png", display.contentCenterX, display.contentHeight*.75)
upButton.rotation = -90
upButton.name="up"
local downButton = display.newImage("arrowButton.png", display.contentCenterX, display.contentHeight*.85)
downButton.rotation = 90
downButton.name="down"
local leftButton = display.newImage("arrowButton.png", display.contentWidth*.4, display.contentHeight*.8)
leftButton.rotation = 180
leftButton.name="left"
local rightButton = display.newImage("arrowButton.png", display.contentWidth*.6, display.contentHeight*.8)
rightButton.rotation = 0
rightButton.name="right"

function gChange( event )
	local target = event.target.name
	if (event.phase=="began" or event.phase=="moved") then
		gx, gy = physics.getGravity()
		if (target=="up") then
			x=gx
			y=gy-0.1
			physics.setGravity(x,y)
		elseif (target=="down") then
			x=gx
			y=gy+0.1
			physics.setGravity(x,y)
		elseif (target=="left") then
			x=gx-0.1
			y=gy
			physics.setGravity(x,y)
		elseif (target=="right") then
			x=gx+0.1
			y=gy
			physics.setGravity(x,y)
		end
		print(physics.getGravity())
		gravityX.text="X="..math.round(gx*10)*0.1
		gravityY.text="Y="..math.round(gy*10)*0.1
	else
	end
end	
function newBall( event )
	local ball = display.newCircle(w/2,h/2,25)
	physics.addBody(crate,"dynamic",{density=1.0, friction =0.3, bounce = 0.2})
	physics.start()
end
upButton:addEventListener("touch",gChange)
downButton:addEventListener("touch",gChange)
leftButton:addEventListener("touch",gChange)
rightButton:addEventListener("touch",gChange)
crate:addEventListener("tap",newBall)