--Ian Smelser
--10/5/15
--Rotation, In Class

--Text
local portrait = display.newText("Portrait",display.contentWidth/2,display.contentHeight/2,nil,60)
local landscape = display.newText("Landscape",display.contentWidth/2,display.contentHeight/2,nil,60)
local width = display.contentWidth
local height = display.contentHeight

portrait:setFillColor(1,1,1)
portrait.alpha=1
landscape:setFillColor(1,1,1)
landscape.alpha=0

local function rotate1(event)
	print("hi")
	if (system.orienation=="landscapeLeft") then
		landscape.alpha=1
		portrait.alpha=0
	end

	--if (system.orienation=="landscapeLeft" or system.orienation=="landscapeRight") then
	--	local newAngle = landscape.rotation - event.delta
	--	transition.to( landscape, {time= 150, rotation = newAngle})
	--	transition.to( portrait, {rotation = newAngle})
	--	portrait.alpha = 0
	--	landscape.alpha = 1
	--	print("pi")
	--else
	--	local newAngle = portrait.rotation - event.delta
	--	transition.to( portrait, {time= 150, rotation = newAngle})
	--	transition.to( landscape, {rotation = newAngle})
	--	portrait.alpha = 1
	--	landscape.alpha = 0
	--	print("phy")
	--end
end

print("what")
Runtime:addEventListener("resize",rotate1)