--Ian Smelser
--11/3/15
--Vectors

local w = display.contentWidth
local h = display.contentHeight
local rect = display.newRoundedRect(w/2,h/2,150,50,10)
rect.strokeWidth=2
rect:setFillColor(0,0.3,1)
local text = display.newText("Hello!",w/2,h*0.3,nil,60)
text.alpha=1
state=0
function click(event)
	if (event.phase == "began") then
		rect:setFillColor(0,0,1)
		transition.to(text,{time=50,rotation=text.rotation+10,onComplete=click})
		return true
	elseif (event.phase == "ended") then
		rect:setFillColor(0,0.3,1)
		text.rotation=0
		return true
	end
	transition.to(text,{time=50,rotation=text.rotation+10,onComplete=click})
	print(text.rotation)
end
rect:addEventListener("touch",click)