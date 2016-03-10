--Ian Smelser
--3/6/16
--Weld Joint

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)

local physics = require("physics")
physics.start(true)
--physics.setGravity(0,0)

local ground = display.newRect(w/2,h*1,w,25)
physics.addBody(ground,"static")
local wallRight = display.newRect(w*0.01,h*0.5,25,h)
physics.addBody(wallRight,"static")
local wallLeft = display.newRect(w*0.99,h*0.5,25,h)
physics.addBody(wallLeft,"static")
local top = display.newRect(w/2,h*0.0,w,25)
physics.addBody(top,"static")

local circle1 = display.newCircle(w*0.3,h*0.4,50)
circle1:setFillColor(1,0,0)
physics.addBody(circle1,"dynamic",{radius=50})
local circle2 = display.newCircle(w/2,h*0.6,50)
circle2:setFillColor(0,0,1)
physics.addBody(circle2,"dynamic",{radius=50})
local circle3 = display.newCircle(w*0.7,h*0.4,50)
circle3:setFillColor(0,1,0)
physics.addBody(circle3,"dynamic",{radius=50})


local weldJoint1 = physics.newJoint("weld",circle1,circle2,10,10)
local weldJoint2 = physics.newJoint("weld",circle2,circle3,10,10)
local weldJoint2 = physics.newJoint("weld",circle3,circle1,10,10)
--weldJoint.dampingRatio=1
--weldJoint.frequency=10000

local function dragBody( event )
	local body = event.target
	local phase = event.phase
	local stage = display.getCurrentStage()
	if "began" == phase then
		stage:setFocus( body, event.id )
		body.isFocus = true
		body.tempJoint = physics.newJoint( "touch", body,
		event.x, event.y )
	elseif body.isFocus then
		if "moved" == phase then
			 body.tempJoint:setTarget( event.x, event.y )
			 elseif "ended" == phase or "cancelled" == phase then
				stage:setFocus( body, nil )
				body.isFocus = false
				body.tempJoint:removeSelf()
			end
	end
	return true
end
circle1:addEventListener("touch",dragBody)
circle2:addEventListener("touch",dragBody)
circle3:addEventListener("touch",dragBody)