--9/22/15
--Button Counter Part 2: Win Condidtion - Assignment 3
--Ian Smelser

--Defing  objects num, button, text
local num = 0
local button = display.newImage("button.png",display.contentCenterX,display.contentCenterY+200)
local text = display.newText(num,display.contentCenterX,display.contentCenterY-200,nil,60)

--Count function
local function count()
	if num<20 then
		--Normal count increase and text size grow
		num=num+1
		text.text=num
		text.size=60+(num*10)
	else
		--Win condidtion. Blue "You Win!" text.
		text:setFillColor(0,0,0)
		local endText = display.newText("You Win!",0,0,nil,60)
		endText.x=display.contentCenterX
		endText.y=display.contentCenterY
		endText:setFillColor(0.2,0.3,1)
		endText.size = endText.size
	end
end

--Event Listener
button:addEventListener("tap",count)