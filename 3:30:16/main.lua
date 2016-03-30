--Ian Smelser
--3/30/16
--Array 5 circles
--FLASHY LIGHTS

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)


circles={}
number=50
timeS=2000
local function start( event )
	if (circles[1]~=nil) then
		for i=1,table.maxn(circles) do
			circles[i]:removeSelf()
		end
	end
	for i=1,number do
		print(i)
		circles[i]=display.newCircle(math.random(20,w-20),math.random(20,h-20),math.random(10,50))
		circles[i]:setFillColor(math.random(),math.random(),math.random())
		transition.to(circles[i],{time=timeS-50,alpha=0})
	end
	timer.performWithDelay(timeS,start)
end
start()