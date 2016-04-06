--Ian Smelser
--3/30/16


w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)

local physics = require("physics")
physics.start(true)
physics.setGravity(0,0)
--physics.setDrawMode("hybrid")


local lives = 3
local lifeDisplay = display.newText("Lives:"..lives, w*0.25, h*0.1, nil, 90)
local score = 0
local scoreDisplay = display.newText("Score:"..score, w*0.75, h*0.1, nil, 90)
local displayGameOver = display.newText("Game Over!", display.contentWidth/2, display.contentHeight/2, nil, 90)
displayGameOver:setFillColor(1,0.2,0.2)
displayGameOver.alpha=0


local function breakBlock( event )
	local name = event.target.name
	transition.to(blocks[name],{alpha=0,time=1000})  
	blocks[name].isSensor=true
	if (event.phase=="began") and (event.target.alpha>0.9) then
		score=score+1	
	end
	scoreDisplay.text="Score:"..score
end

local function initBlocks( event )
	if (blocks~=nil) then
		for i=1,30 do
			blocks[i]:removeSelf()
		end
	end
	local xloc = w*0.05
	local yloc = h*0.2
	blocks = {}
	
	for i=1,30 do
		yloc=(math.ceil(i/10)*50)+(h*0.2)
		if (xloc>w) then
			xloc=w*0.05
		end
		blocks[i] = display.newRect(xloc,yloc,80,50)
		xloc=xloc+(w*0.1)
		--blocks[i]:setFillColor(math.random(),math.random(),math.random())
		if (i%3==0) then
			blocks[i]:setFillColor(1,0,0)
		elseif (i%3==1) then
			blocks[i]:setFillColor(0,0,1)
		else
			blocks[i]:setFillColor(0,1,0)
		end
		blocks[i].name=i
		blocks[i]:addEventListener("collision",breakBlock)
		physics.addBody(blocks[i],"static",{density=1})
	end
end
initBlocks()

local function initBall( event )
	if (ball~=nil) then
		ball:removeSelf()
	end
	ball = display.newCircle(w*0.3, h*0.6, 30)
	ball:setFillColor(1,0,0)
	physics.addBody(ball, "dynamic", {friction = 0, bounce = 1, radius=30})
	ball:setLinearVelocity(300+math.random(-50,50),400+math.random(-50,50))
	ball.name="ball"
end
initBall()

local top = display.newRect(w*0.5,h*0.001,w,h*0.01)
local sideLeft = display.newRect(w*0.001,h/2,w*0.01,h)
local sideRight = display.newRect(w*0.999,h/2,w*0.01,h)
local bottom = display.newRect(w*0.5,h*0.999,w,h*0.01)
physics.addBody(top,"static")
physics.addBody(sideLeft,"static")
physics.addBody(sideRight,"static")
physics.addBody(bottom,"static")

local puck = display.newRoundedRect(w/2,h*0.8,200,20,10)
puck:setFillColor(0.2,0.2,0.7)
physics.addBody(puck,"dynamic",{density=1000})
local piston = physics.newJoint("piston",puck,bottom,puck.x,puck.y,-1,0)

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
puck:addEventListener("touch",dragBody)

Vx=0
Vy=0
angle=math.tan(Vy/Vx)
local function puckBounce( event )
	if (event.other.name=="ball") then
		if (event.phase=="began") then
			Vx, Vy = ball:getLinearVelocity()
			angle=math.tan(Vy/Vx)
		elseif (event.phase=="ended") then
			if (ball.x-puck.x>50) then
				if (angle>1.6) or (angle<1.5) then
					ball:setLinearVelocity(-Vx,-Vy)
				end
			end
		end
	end
end

puck:addEventListener("collision",puckBounce)

local function startGame( event )
	displayGameOver.alpha=0
	lives=3
	lifeDisplay.text="Lives:"..lives
	score=0
	scoreDisplay.text="Score:"..score
	transition.to(puck,{x=w/2,time=200})
	initBlocks()
	initBall()
	physics.start(true)
	puck:setLinearVelocity(0,0)
end
displayGameOver:addEventListener("tap",startGame)

local function Counter(event)
	if (event.phase=="began") then
		lives = lives - 1
		lifeDisplay.text = "Lives:"..lives
		if lives == 0 then --Game over
			transition.to(displayGameOver,{alpha=1,time=1000})
			physics.pause()
		end
	end
end
bottom:addEventListener("collision", Counter)


