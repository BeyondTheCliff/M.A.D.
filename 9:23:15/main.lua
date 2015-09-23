--9/23/15
--Ian Smelser
--

local num = 0
local square = display.newImage("Ch3Square.png", display.contentCenterX,display.contentCenterY)
local button = display.newImage("Ch3ShowButton.png",display.contentCenterX,display.contentCenterY+300)
local function fade()
	if (num==0) then
		transition.to(square, {time=500, alpha=0})
		num=1
	elseif (num==1) then
		transition.to(square, {time=500, alpha=1})
		num=0
	end
end
button:addEventListener("tap",fade)