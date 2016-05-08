--Ian Smelser
--4/27/16
--Main menu for the app

local composer = require("composer")
local scene = composer.newScene()

local function callSwitch( event )
	local id = event.target.id
	if (event.phase=="ended") then
		switchScene(id)
	end
end

function scene:create(event)
	local sceneGroup = self.view
	local bg = display.newRect(0,0,w,h)
	bg.anchorX,bg.anchorY=0,0
	bg:setFillColor(0.8,0.1,0.1)
	sceneGroup:insert(bg)
	local bgButton = display.newRoundedRect(w/2,h*0.075,400,75,12)
	bgButton:setFillColor(1,0.1,0.1)
	sceneGroup:insert(bgButton)
	local titleText = display.newText("Main Menu",w/2,h*0.075,"AmericanTypewriter",60)
	sceneGroup:insert(titleText)
	-----------------------------
	local button1 = {}
	button1[1] = widget.newButton(
    {
		onEvent = callSwitch,
		emboss = true,
		shape = "roundedRect",
		width = 520,
		height = 100,
		cornerRadius = 12,
		fillColor = { default={1,0.1,0.1}, over={0.5,0.1,0.1,0.4} },
		strokeColor = { default={0.5,0,0}, over={1,0.2,0.1} },
		strokeWidth = 6,
		x=w/2,
		y=h*0.2,
		id="battleship.battleship"
    }
	)
	sceneGroup:insert(button1[1])
	button1[2] = display.newText("Battleship",w/2,h*0.2,"AmericanTypewriter",80)
	sceneGroup:insert(button1[2])
	button1[2]:addEventListener("touch",callSwitch)
	-----------------------------
	local button2 = {}
	button2[1] = widget.newButton(
    {
		onEvent = callSwitch,
		emboss = true,
		shape = "roundedRect",
		width = 600,
		height = 100,
		cornerRadius = 12,
		fillColor = { default={1,0.1,0.1}, over={0.5,0.1,0.1,0.4} },
		strokeColor = { default={0.5,0,0}, over={1,0.2,0.1} },
		strokeWidth = 6,
		x=w/2,
		y=h*0.3,
		id="fingerPaint.field"
    }
	)
	sceneGroup:insert(button2[1])
	button2[2] = display.newText("Finger Painter",w/2,h*0.3,"AmericanTypewriter",80)
	sceneGroup:insert(button2[2])
	button2[2]:addEventListener("touch",callSwitch)
	-----------------------------
end
scene:addEventListener( "create", scene )
return scene