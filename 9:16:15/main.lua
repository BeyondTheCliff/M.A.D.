--9/16/15
--Assignment 1
--Ian Smelser

--Defing All Objects
local redButton = display.newImage("button-red.png",display.contentCenterX-100,display.contentCenterY+100)
local greenButton = display.newImage("button-green.png",display.contentCenterX+100,display.contentCenterY+100)
local redText = display.newText("Red",display.contentCenterX, 100, nil, 60)
local greenText = display.newText("Green",display.contentCenterX, 100, nil, 60)

--Setting the scene
redText:setFillColor(1,0,0,0)
greenText:setFillColor(0,1,0,0)

--Setting functions
function red()
	redText:setFillColor(1,0,0,1)
	greenText:setFillColor(0,1,0,0)
	redText.x = math.random(25, display.contentWidth - 50)
	redText.y = math.random(25, display.contentHeight - 50)
end
function green()
	redText:setFillColor(1,0,0,0)
	greenText:setFillColor(0,1,0,1)
	greenText.x = math.random(25, display.contentWidth - 50)
	greenText.y = math.random(25, display.contentHeight - 50)
end

--Interactions
redButton:addEventListener("tap",red)
greenButton:addEventListener("tap",green)