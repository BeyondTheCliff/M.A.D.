

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)

local composer = require( "composer" )
local scene = composer.newScene()
function scene:create( event ) --Creates the splash screen objects
	local sceneGroup = self.view
	local bg = display.newRect(0,0,w,h)
	bg.anchorX,bg.anchorY=0,0
	bg:setFillColor(0.1,0.9,0.1)
	sceneGroup:insert(bg)--Adds object to the group
	local button = display.newText("Test Game",w/2,h*0.5,"AmericanTypewriter",100)
	sceneGroup:insert(button)
	button:addEventListener("tap",function() switchScene("mainMenu") end)
	bg:addEventListener("tap",function() switchScene("mainMenu") end)
end
scene:addEventListener( "create", scene )
return scene