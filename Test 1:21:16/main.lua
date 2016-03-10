--Ian Smelser
--1/21/16
--Exam Spider

--Global definitions
w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)

--Load arrow images using content scaling
local arrowN = display.newImageRect("arrow-n.png",92,207)
local arrowS = display.newImageRect("arrow-s.png",92,207)
local arrowE = display.newImageRect("arrow-e.png",207,92)
local arrowW = display.newImageRect("arrow-w.png",207,92)
arrowN.name,arrowS.name,arrowE.name,arrowW.name="walking-n","walking-s","walking-e","walking-w"
arrowN.x,arrowN.y=w*0.5,h*0.7
arrowS.x,arrowS.y=w*0.5,h*0.9
arrowE.x,arrowE.y=w*0.7,h*0.8
arrowW.x,arrowW.y=w*0.3,h*0.8
--Load the spider and all associated files (spiderData.lua, spiderAnimations.lua, spider.png)
local sheetData = require("spiderData")
local animation = require("spiderAnimations")
local options = sheetData.getSpriteSheetData()
local moving = animation.getSequenceData()
local spriteSheet = graphics.newImageSheet("spider.png",options)
local spider = display.newSprite(spriteSheet, moving)
spider.x, spider.y = w/2, h/2

--Move function using custom properties to keep track of which arrow is being pressed.
function move( event )
	print(event.target.name)
	if (event.phase=="began") then
		spider:setSequence(event.target.name)
		spider:play()
		if (event.target.name=="walking-n") then
			transition.to(spider,{time=2500,y=0})
		elseif (event.target.name=="walking-s") then
			transition.to(spider,{time=2500,y=h})
		elseif (event.target.name=="walking-e") then
			transition.to(spider,{time=2000,x=w})
		elseif (event.target.name=="walking-w") then
			transition.to(spider,{time=2000,x=0})
		end
	elseif (event.phase=="ended") then --Stop the spider from moving if the click is ended.
		spider:pause()
		transition.cancel()
	end
end
--Add all event listeners for the arrows
arrowN:addEventListener("touch",move)
arrowS:addEventListener("touch",move)
arrowE:addEventListener("touch",move)
arrowW:addEventListener("touch",move)