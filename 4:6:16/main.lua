display.setStatusBar(display.HiddenStatusBar)
local background = display.newImage("backround.png", 0, 0)

local physics = require("physics")
physics.start()
physics.setGravity(0)

local xLocation = display.contentWidth*0.05
local yLocation = display.contentHeight*0.2
local Squares = {}


local function killThemAllOneByOne(event)
	--local identification = event.target.identification
	transition.to(Squares[identification], {alpha = 0, time = 3000})
	Squares[identification].bodyType="dynamic"
	Squares[identification].isSensor=true
	
end



for i=1,30 do
	yLocation=(math.ceil(i/10)*50)+(display.contentHeight*0.2)
	if (xLocation>display.contentWidth) then
		xLocation=display.contentWidth*0.05
	end
	Squares[i] = display.newRect(xLocation,yLocation,80,50)
	xLocation=xLocation+(display.contentWidth*0.1)
	Squares[i]:setFillColor(math.random(), math.random(), math.random())
	Squares[i].identification=i 
	physics.addBody(Squares[i], "static")
	Squares[i]:addEventListener("collision", killThemAllOneByOne)
end