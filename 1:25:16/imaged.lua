--Ian Smelser
--11/24/15
--Clock: part 3

local composer = require( "composer" )
local scene = composer.newScene()
local function goToVecored()
	switchScene(1)
end
function scene:create( event )
	local sceneGroup = self.view
	clockFace = display.newImageRect("ClockFace.png",760,760)
	clockFace.x , clockFace.y = w/2 , h/2
	sceneGroup:insert(clockFace)
	secondHand = display.newImageRect("SecondHand.png",7,380)
	secondHand.x , secondHand.y = w/2 , h/2
	secondHand.anchorY=0.9
	sceneGroup:insert(secondHand)
	minuteHand = display.newImageRect("MinuteHand.png",12,340)
	minuteHand.x , minuteHand.y = w/2 , h/2
	minuteHand.anchorY=0.9
	sceneGroup:insert(minuteHand)
	hourHand = display.newImageRect("HourHand.png",10,200)
	hourHand.x , hourHand.y = w/2 , h/2
	hourHand.anchorY=1
	sceneGroup:insert(hourHand)
	shine = display.newImageRect("Shine.png",720,720)
	shine.x , shine.y = w/2 , h/2
	sceneGroup:insert(shine)
	dot = display.newImageRect("CenterDot2.png",50,50)
	dot.x , dot.y = w/2 , h/2
	sceneGroup:insert(dot)
	local function tick( event )
		secondHand.rotation=(os.date("%S")*6)
		minuteHand.rotation=((os.date("%M")+os.date("%S")/60)*6)
		hourHand.rotation=((os.date("%I")+(os.date("%M")/60))*30)
		timer.performWithDelay(1000,tick)
	end
	tick()
	local button = display.newText("Switch Clock",w/2,h*0.85,"AmericanTypewriter",60)
	sceneGroup:insert(button)
	button:addEventListener("tap",goToVecored)
end

scene:addEventListener( "create", scene )
return scene