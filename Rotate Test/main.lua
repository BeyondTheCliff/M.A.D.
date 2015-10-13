-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

--Ian Smelser
--10/5/15
--Rotation, In Class

--Defining display texts
local portrait = display.newText("Portrait",display.contentWidth/2,display.contentHeight/2,nil,60)
local landscape = display.newText("Landscape",display.contentWidth/2,display.contentHeight/2,nil,60)

--Set the colors and alphas
portrait:setFillColor(1,1,1)
portrait.alpha=1
landscape:setFillColor(1,1,1)
landscape.alpha=0

--Function containing the rotate systems
local function rotate(event)
	print(system.orientation)
	--Detection for landscape
	if (system.orientation=="landscapeLeft" or system.orientation=="landscapeRight") then
		landscape.alpha=1
		portrait.alpha=0
		landscape.x=display.contentWidth/2
		landscape.y=display.contentHeight/2
	else
		landscape.alpha=0
		portrait.alpha=1
		portrait.x=display.contentWidth/2
		portrait.y=display.contentHeight/2
	end
end

--Runtime event listener using resize 
Runtime:addEventListener("resize",rotate)