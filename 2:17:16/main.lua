--Ian Smelser
--2/17/16
--Test Portal Physics

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)

local physics = require("physics")
physics.start(true)

local ground = display.newRect(w/2,h*1,w,25)
physics.addBody(ground,"static")
local wallRight = display.newRect(w*0.01,h*0.5,25,h)
physics.addBody(wallRight,"static")
local wallLeft = display.newRect(w*0.99,h*0.5,25,h)
physics.addBody(wallLeft,"static")
local top = display.newRect(w/2,h*0.0,w,25)
physics.addBody(top,"static")

local ball = display.newCircle(w/2,h*0.8,50)
ball:setFillColor(1,0,0)
physics.addBody(ball,"dynamic",{radius=50})
local fakeball = display.newCircle(w/2,h*0.8,50)
fakeball:setFillColor(1,0,0)
fakeball.alpha=0

local leftPortal = display.newRect(w*0.25,h*0.5,20,200)
leftPortal:setFillColor(1,0.5,0)
local rightPortal = display.newRect(w*0.75,h*0.5,20,200)
rightPortal:setFillColor(0,0.3,1)

local active = false

local function test1( event )
	if ball.x<(w*0.75+60) and ball.x>(w*0.75-60) then
		if ball.y<(h/2+150) and ball.y>(h/2-150) then
			--ball:setFillColor(0,0,1)
			--if acitve == false then
				fakeball.y=ball.y
				fakeball.x=ball.x-(w/2)
				--fakeball.alpha=1
				transition.to(fakeball,{time=100,alpha=1})
				--active=true
			--end
		else
			ball:setFillColor(1,0,0)
			--fakeball.alpha=0
			transition.to(fakeball,{time=100,alpha=0})
			--active=false
		end
	else
		ball:setFillColor(1,0,0)
		--fakeball.alpha=0
		transition.to(fakeball,{time=100,alpha=0})
		--active=false
	end
end
local function test2( event )
	if ball.x<(w*0.25+60) and ball.x>(w*0.25-60) then
		if ball.y<(h/2+150) and ball.y>(h/2-150) then
			--ball:setFillColor(0,0,1)
			--if active == false then
				fakeball.y=ball.y
				fakeball.x=ball.x+(w/2)
				--fakeball.alpha=1
				transition.to(fakeball,{time=100,alpha=1})
				--active=true
			--end
		else
			ball:setFillColor(1,0,0)
			--fakeball.alpha=0
			transition.to(fakeball,{time=100,alpha=0})
			--active=false
		end
	else
		ball:setFillColor(1,0,0)
		--fakeball.alpha=0
		transition.to(fakeball,{time=100,alpha=0})
		--active=false
	end
end
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

timer.performWithDelay(10,test1,-1)
timer.performWithDelay(10,test2,-1)
