--Weld Joint

w = display.contentWidth
h = display.contentHeight

local physics = require("physics")
physics.start(true)

local ground = display.newRect(w/2,h,w,25)
physics.addBody(ground,"static")
local WallRight = display.newRect(w*0.001,h/2,25,h)
physics.addBody(WallRight,"static")
local WallLeft = display.newRect(w*0.999,h/2,25,h)

local circle_red = display.newCircle(w*0.3,h*0.4,50)
circle_red:setFillColor(1,0,0)
physics.addBody(circle_red,"dynamic",{radius=50})
local circle_green = display.newCircle(w/2,h*0.6,50)
circle_green:setFillColor(0,1,0)
physics.addBody(circle_green,"dynamic",{radius=50})
local circle_blue = display.newCircle(w*0.7,h*0.4,50)
circle_blue:setFillColor(0,0,1)
physics.addBody(circle_blue,"dynamic",{radius=50})

local weldJoint1 = physics.newJoint("weld",circle_red,circle_green,10,10)
local weldJoint1 = physics.newJoint("weld",circle_green,circle_blue,10,10)
local weldJoint1 = physics.newJoint("weld",circle_blue,circle_red,10,10)


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
circle_red:addEventListener("touch",dragBody)
circle_green:addEventListener("touch",dragBody)
circle_blue:addEventListener("touch",dragBody)