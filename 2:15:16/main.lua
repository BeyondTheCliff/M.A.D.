--Ian Smelser
--2/15/16
--Physics Project
--Globals
w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)
--Starting up physics
local physics = require("physics")
physics.start(true)
--Make the walls
local ground = display.newRect(w/2,h*1,w,25)
physics.addBody(ground,"static")
local wallRight = display.newRect(w*0.01,h*0.5,25,h)
physics.addBody(wallRight,"static")
local wallLeft = display.newRect(w*0.99,h*0.5,25,h)
physics.addBody(wallLeft,"static")
local top = display.newRect(w/2,h*0.0,w,25)
physics.addBody(top,"static")
--Make the blocks
local block_left = display.newRect(w*0.20,h*0.4,280,50)
block_left:setFillColor(0,0,1)
physics.addBody(block_left,"static")
local block_right = display.newRect(w*0.80,h*0.6,280,50)
block_right:setFillColor(0,1,0)
physics.addBody(block_right,"static")
local portal_right = display.newRect(w*0.98,h*0.2,30,200)
portal_right:setFillColor(1,0.5,0)
physics.addBody(portal_right,"static")
local portal_left = display.newRect(w*0.02,h*0.2,30,200)
portal_left:setFillColor(0,0.3,1)
physics.addBody(portal_left,"static")
local bouncePad = display.newRect(w*0.09,h*0.95,250,50)
bouncePad:setFillColor(0.5,0.1,0.1)
bouncePad.rotation=45
physics.addBody(bouncePad,"static",{bounce=5})
--Make the ball
local ball = display.newCircle(w/2,h*0.8,50)
ball:setFillColor(1,0,0)
physics.addBody(ball,"dynamic",{radius=50})
--Dragging body function from the book
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
ball:addEventListener("touch",dragBody)
local function respawnBlock (event) --A test re spawning feature. Not complete.
	local block_left = display.newRect(w*0.20,h*0.4,280,50)
	block_left:setFillColor(0,0,1)
	physics.addBody(block_left,"static")
	block_left.alpha=0
	transition.to(block_left,{time=2000,alpha=1})
end
local function block_left_trigger( event, self ) --Fades and destroys the block
	if (event.phase=="began") then
		if (block_left.alpha==0) then
			block_left:removeSelf()
			timer.performWithDelay(2000,respawnBlock)
		else
			block_left.alpha=block_left.alpha-0.1
		end
	else
	end	
end
block_left.collision = onLocalCollision
block_left:addEventListener( "collision", block_left_trigger)

local function block_right_trigger( event, self ) --Random color for the other block
	if (event.phase=="began") then
		block_right:setFillColor(math.random(),math.random(),math.random())
	else
	end
end
block_right.collision = onLocalCollision
block_right:addEventListener( "collision", block_right_trigger)

local function portal_right_move( event, self ) --Testing a portal feature. 
	print("portal_right_move")
	ball.alpha=0
	transition.to(ball,{time=10,x=150,alpha=1})
end
portal_right.collision = onLocalCollision
portal_right:addEventListener("collision",portal_right_move)

local function portal_left_move( event, self )
	print("portal_left_move")
	ball.alpha=0
	transition.to(ball,{time=10,x=w-150,alpha=1})
end
portal_left.collision = onLocalCollision
portal_left:addEventListener("collision",portal_left_move)
