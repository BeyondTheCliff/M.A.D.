--Ian Smelser
--1/11/16
--Sprite Test

--Global Defaults
w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)

--Load sprites sheet and data and sequences. Load the barbarian.
local sheetData = require("barbarianData")
local animation = require("barbarianAnimations")
local options = sheetData.getSpriteSheetData()
local walking = animation.getSequenceData()
local spriteSheet = graphics.newImageSheet("barbarian.png",options)
local barbarianWalking = display.newSprite(spriteSheet, walking)
--Center the barbarian
barbarianWalking.x, barbarianWalking.y = w/2, h/2
--Function that moves 
local function move( event )
	print(event.target.name)
	if (event.phase=="began") then
		barbarianWalking:setSequence(event.target.name)
		barbarianWalking:play()
		if event.target.name=="walking-n" then 
			transition.to(barbarianWalking, {time=3000, y=0})
		elseif event.target.name=="walking-s" then
			transition.to(barbarianWalking, {time=3000, y=display.contentHeight})
		elseif event.target.name=="walking-w" then 
			transition.to(barbarianWalking, {time=3000, x=0})
		else 
			transition.to(barbarianWalking, {time=3000, x=display.contentWidth})
		end
	elseif event.phase == "ended" or event.phase == "canceled" then
		barbarianWalking:pause()
		transition.cancel()
	else
		barbarianWalking:pause()
		transition.cancel()
	end
end

local buttonN = display.newRect(w*0.25,0,w*0.5,h/2)
buttonN:setFillColor(0.2,0.2,0.8)
buttonN.name, buttonN.anchorY, buttonN.anchorX, buttonN.alpha="walking-n", 0, 0, 0.1
local buttonS = display.newRect(w*0.25,h/2,w*0.5,h/2)
buttonS:setFillColor(0.2,0.2,0.8)
buttonS.name, buttonS.anchorY, buttonS.anchorX, buttonS.alpha="walking-s", 0, 0, 0.1
local buttonE = display.newRect(w*0.75,h*0.25,w*0.25,h*0.5)
buttonE:setFillColor(0.2,0.2,0.8)
buttonE.name, buttonE.anchorY, buttonE.anchorX, buttonE.alpha="walking-e", 0, 0, 0.1
local buttonW = display.newRect(w*0,h*0.25,w*0.25,h*0.5)
buttonW:setFillColor(0.2,0.2,0.8)
buttonW.name, buttonW.anchorY, buttonW.anchorX, buttonW.alpha="walking-w", 0, 0, 0.1


buttonN:addEventListener("touch",move)
buttonS:addEventListener("touch",move)
buttonE:addEventListener("touch",move)
buttonW:addEventListener("touch",move)