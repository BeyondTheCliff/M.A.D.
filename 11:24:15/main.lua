--Ian Smelser
--11/24/15
--Clock: part 3

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)

clockFace = display.newImageRect("ClockFace.png",760,760)
clockFace.x , clockFace.y = w/2 , h/2
secondHand = display.newImageRect("SecondHand.png",7,380)
secondHand.x , secondHand.y = w/2 , h/2
secondHand.anchorY=0.9
minuteHand = display.newImageRect("MinuteHand.png",12,340)
minuteHand.x , minuteHand.y = w/2 , h/2
minuteHand.anchorY=0.9
hourHand = display.newImageRect("HourHand.png",10,200)
hourHand.x , hourHand.y = w/2 , h/2
hourHand.anchorY=1
shine = display.newImageRect("Shine.png",720,720)
shine.x , shine.y = w/2 , h/2
dot = display.newImageRect("CenterDot2.png",50,50)
dot.x , dot.y = w/2 , h/2
--clockFace:scale(w/800,w/800)
--secondHand:scale(w/800,w/800)
--minuteHand:scale(w/800,w/800)
--hourHand:scale(w/800,w/800)
--shine:scale(w/800,w/800)
--dot:scale(0.03,0.03)

local function tick( event )
	secondHand.rotation=(os.date("%S")*6)
	minuteHand.rotation=((os.date("%M")+os.date("%S")/60)*6)
	hourHand.rotation=((os.date("%I")+(os.date("%M")/60))*30)
	timer.performWithDelay(1000,tick)
end

tick()