--Ian Smelser
--3/9/16
--Gear Test

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)

local physics = require("physics")
physics.start(true)
physics.setDrawMode("hybrid")
--physics.setGravity(0,0)

local background = display.newRect(0,0,1,1)
background.anchorX,background.anchorY=0,0
background:setFillColor(0.2,0.2,0.2)
physics.addBody(background,"static",{isSensor=true})

local ground = display.newRect(w/2,h*1,w,25)
physics.addBody(ground,"static")
local wallRight = display.newRect(w*0.01,h*0.5,25,h)
physics.addBody(wallRight,"static")
local wallLeft = display.newRect(w*0.99,h*0.5,25,h)
physics.addBody(wallLeft,"static")
local top = display.newRect(w/2,h*0.0,w,25)
physics.addBody(top,"static")

local staticBox = display.newRect(w*0.375,h/2,w/2,100)
physics.addBody(staticBox,"static",{isSensor=true})
staticBox.alpha=0.5

local gear1 = display.newCircle(w*0.25,h/2,100)
gear1:setFillColor(0.8,0,0)
physics.addBody(gear1,"dynamic",{radius=100,friction=100})
--local knob = display.newCircle(w*0.25,h*0.45,20)
--knob:setFillColor(0,0,0)
--physics.addBody(knob,"dynamic",{isSensor=true})
local gear2 = display.newCircle(w*0.5,h/2,100)
gear2:setFillColor(0,0,0.8)
physics.addBody(gear2,"dynamic",{radius=100,friction=100})

local pivot1 = physics.newJoint("pivot",staticBox,gear1,w*0.25,h/2)
--local pivotknob = physics.newJoint("pivot",gear1,knob,w*0.25,h*0.45)
local pivot2 = physics.newJoint("pivot",staticBox,gear2,w*0.5,h/2)

local gearJoint = physics.newJoint("gear",gear1,gear2,pivot1,pivot2,2)

pivot1.isMotorEnabeled=true
pivot1.isActive=true
pivot1.motorSpeed=0.5
pivot1.maxMotorTorque=10000
pivot1.maxMotorForce=10000

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
gear1:addEventListener("touch",dragBody)
gear2:addEventListener("touch",dragBody)
--knob:addEventListener("touch",dragBody)