--Ian Smelser
--11/24/15
--Tests

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)

clockFace = display.newImage("ClockFace2-02.png",w/2,h/2)
clockFace:scale(0.79,0.79)
secondHand = display.newImage("Second Hand-01.png",w/2,h/2)
secondHand.anchorY=0.22
secondHand:scale(0.20,0.20)
minuteHand = display.newImage("Second Hand-02.png",w/2,h/2)
minuteHand.anchorY=0.9
minuteHand:scale(0.2,0.2)
hourHand = display.newImage("Second Hand-03.png",w/2,h/2)
hourHand.anchorY=1
hourHand:scale(0.2,0.2)

--dot = display.newCircle(w/2,h/2,20)
dot = display.newImage("CenterDot2.png",w/2,h/2)
dot:scale(0.03,0.03)

local function tick( event )
	secondHand.rotation=(os.date("%S")*6)
	minuteHand.rotation=((os.date("%M")+os.date("%S")/60)*6)
	hourHand.rotation=((os.date("%I")+(os.date("%M")/60))*30)
	timer.performWithDelay(1000,tick)
end

tick()