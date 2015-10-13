--Ian Smelser
--9/29/15
--Chapter 3 Assigmnet 1: Assignment 4

--Setting number and boolean state, along with the text for the number and the button
local num = 0
local state = true
local text = display.newText(num, display.contentWidth/2, 300,nil,60)
local click = display.newText("Click Here", display.contentWidth/2, 500,nil,60)

--Function containing the count up and down, and the boolean logic check
local function count()
	--Change boolean logic depending on number state
	if (num>=20) then --Check num for numbers greater than 20
		state=false 
	elseif (num<=0) then --Check num for numbers less than 20
		state=true
	end
	--Count up and down depending on the boolean operator
	if (state==true) then
		num=num+1 --Count up
		text.text=num
	else
		num=num-1 --Count down
		text.text=num
	end
end

--Listener for the "Click Here" button and the count function
click:addEventListener("tap",count)