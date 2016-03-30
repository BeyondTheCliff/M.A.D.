--Ian Smelser
--3/22/16
--Random stuff

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)

circles={}
for i=1,10000 do
	xloc=math.random(1,w)
	yloc=math.random(1,h)
	circles[i]=display.newCircle(xloc,yloc,math.random(2,5))
	circles[i]:setFillColor(math.random(0,1),math.random(0,1),math.random(0,1))
end
x=1
local function clearing( event )
	if (x<10001) then
		circles[x].alpha=0
		circles[x+1].alpha=0
		circles[x+2].alpha=0
		circles[x+3].alpha=0
		circles[x+4].alpha=0
		timer.performWithDelay(0.0001,clearing)
		x=x+5
	end
end
timer.performWithDelay(0.0001,clearing)