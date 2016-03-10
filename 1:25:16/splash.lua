--Ian Smelser
--1/26/16
--Splash Screen
--Creates a splash screen for the start of the app
--Load the composer API
local composer = require( "composer" )
local scene = composer.newScene()
local function gotoVectored() --Tell main.lua to change scenes
	switchScene(1)
end
function scene:create( event ) --Creates the splash screen objects
	local sceneGroup = self.view
	local bg = display.newRect(0,0,w,h)
	bg.anchorX,bg.anchorY=0,0
	bg:setFillColor(0.9,0.1,0.1)
	sceneGroup:insert(bg)--Adds object to the group
	local button = display.newText("Open Clocks",w/2,h*0.5,"AmericanTypewriter",100)
	sceneGroup:insert(button)
	button:addEventListener("tap",gotoVectored)
	bg:addEventListener("tap",gotoVectored)
end
scene:addEventListener( "create", scene )
return scene