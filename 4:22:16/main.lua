--Ian Smelser
--4/22/16
--Tree

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)

local physics = require("physics")

x=w/2
y=h*0.49
Branches={}
Branches[1]=display.newLine(w/2,h*0.51,x,y)
Branches[1]:setStrokeColor(1,0,0)
Branches[1].strokeWidth=1

color=0.2

for i=2,10000 do
	local xStart = x
	local yStart = y
	x=xStart+math.random(-15,15)
	y=yStart+math.random(-15,15)
	if (x<0) then
		x=x+(w*0.1)
	elseif (x>w) then
		x=x-(w*0.1)
	end
	if (y<0) then
		y=y+(h*0.1)
	elseif (y>h) then 
		y=y-(h*0.1)
	end
	Branches[i] = display.newLine(xStart,yStart,x,y)
	--Branches[i]:setStrokeColor(0,color,0)
	Branches[i]:setStrokeColor(math.random(10,100)/100,math.random(10,100)/100,math.random(10,100)/100)
	Branches[i].strokeWidth=3
	--color=color+0.005
end

local function captureWithDelay()
	--display.save()
    local capture = display.captureScreen(true)
    capture:scale( 0.5, 0.5 )
    capture.alpha=0.01
    print("done")

end

timer.performWithDelay( 1000, captureWithDelay )
