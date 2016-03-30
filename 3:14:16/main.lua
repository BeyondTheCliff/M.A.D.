--3/14/16
--Cars

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)

local physics = require("physics")
physics.start(true)
physics.setDrawMode("hybrid")
physics.setGravity(0,10)
--15

local background = display.newRect(w/2,h/2,w,h)
background.alpha=0.01
physics.addBody(background,"static",{isSensor=true})
local ground = display.newRect(w/2,h*1,w,25)
physics.addBody(ground,"static")
local wallRight = display.newRect(w*0.001,h*0.5,25,h)
physics.addBody(wallRight,"static")
local wallLeft = display.newRect(w*0.999,h*0.5,25,h)
physics.addBody(wallLeft,"static")
local top = display.newRect(w/2,h*0.0,w,25)
physics.addBody(top,"static")
local block1 = display.newRect(w/2,h*0.8,600,10)
block1.rotation=-30
physics.addBody(block1,"dynamic")
local blockPivot = physics.newJoint("pivot",block1,background,w/2,h*0.8)
blockPivot.isMotorEnabled=true

local buttonRight = display.newRect(w*0.75,h/2,w/2,h)
buttonRight.alpha=0.01
local buttonLeft = display.newRect(w*0.25,h/2,w/2,h)
buttonLeft.alpha=0.01

local car = display.newGroup()
car.anchorChilderen=true
local carBody = display.newImageRect("car.png",307,100)
carBody.x,carBody.y=w*0.1,h*0.9
car:insert(carBody)
local wheelRight = display.newImageRect("wheelRight.png",51,55)
wheelRight.x,wheelRight.y=carBody.x-100,carBody.y+20
car:insert(wheelRight)
local wheelLeft = display.newImageRect("wheelLeft.png",53,56)
wheelLeft.x,wheelLeft.y=carBody.x+85,carBody.y+20
car:insert(wheelLeft)

local carShape = {-150,20, 150,20, 120,-50, -120,-50}
physics.addBody(carBody,"dynamic",{bounce=0.5,friction=1,denisty=10,shape=carShape})
physics.addBody(wheelRight,"dynamic",{radius=25,friction=2,denisty=5})
physics.addBody(wheelLeft,"dynamic",{radius=25,friction=2,denisty=5})

local pivotRight = physics.newJoint("pivot",wheelRight,carBody,wheelRight.x,wheelRight.y)
local pivotLeft = physics.newJoint("pivot",wheelLeft,carBody,wheelLeft.x,wheelLeft.y)
pivotLeft.isMotorEnabled=true
pivotLeft.motorSpeed=0
pivotLeft.maxMotorTorque=100
pivotLeft.dampingRatio=1
pivotRight.isMotorEnabled=true
pivotRight.motorSpeed=0
pivotRight.maxMotorTorque=100
pivotRight.dampingRatio=1

local distanceJoint = physics.newJoint("distance",wheelRight,wheelLeft,wheelLeft.x,wheelLeft.y,wheelRight.x,wheelRight.y)

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
carBody:addEventListener("touch",dragBody)
block1:addEventListener("touch",dragBody)

local function moveRight( event )
	if (event.phase=="began" or event.phase=="moved") then
		pivotLeft.motorSpeed=-1500
		pivotRight.motorSpeed=-1500
	else
		pivotLeft.motorSpeed=0
		pivotRight.motorSpeed=0
	end
end
buttonRight:addEventListener("touch",moveRight)

local function moveLeft( event )
	if (event.phase=="began" or event.phase=="moved") then
		pivotLeft.motorSpeed=1500
		pivotRight.motorSpeed=1500
	else
		pivotLeft.motorSpeed=0
		pivotRight.motorSpeed=0
	end
end
buttonLeft:addEventListener("touch",moveLeft)
