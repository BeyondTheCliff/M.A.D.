--9/16/15
--Button Counter - Assignment 2
--Ian Smelser

--Defing all objects
local num = 0
local button = display.newImage("button.png",display.contentCenterX,display.contentCenterY+100)
local text = display.newText(num,display.contentCenterX,display.contentCenterY-200,nil,60)

--Defing function
local function count()
	if num<29 then
		num=num+1
		text.text=num
		text.size=60+(num*4)
	else
		text:setFillColor(0,0,0)
		local endText = display.newText("You can stop now.",display.contentCenterX,display.contentCenterY,nil,60)
	end
end

--Event Listener
button:addEventListener("tap",count)