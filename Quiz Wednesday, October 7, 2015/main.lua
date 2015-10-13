-----------------------------------------------------------------------------------------
--Ian Smelser
--10/7/15
--Quiz 4 : Practical 
-----------------------------------------------------------------------------------------


--Declaring local variables:
--width and height of this device
--and the 3 buttons in an global array
local w = display.contentWidth
local h = display.contentHeight
button={}
button[1] = display.newImage("button1.png",w/2-100,h/2)
button[2] = display.newImage("button2.png",w/2,h/2)
button[3] = display.newImage("button3.png",w/2+100,h/2)
button[1].num=1
button[2].num=2
button[3].num=3
--On screen documentation
local docs = display.newText("Click the buttons to make them disappear",w/2,h/2-250)
local docs2 = display.newText("Tilt the device to reset the buttons",w/2,h/2-230)

--Function that disappears the buttons
--then fades them back in on 1 second
--It also moves the documentation text into proper position
function move(event)
	print(system.orientation)
	local w = display.contentWidth
	local h = display.contentHeight
	for i=1,3 do
		button[i].alpha=0
	end
	transition.to(button[1],{time=1000, x=display.contentWidth/2-100, y=display.contentHeight/2, alpha=1})
	transition.to(button[2],{time=1000, x=display.contentWidth/2, y=display.contentHeight/2, alpha=1})
	transition.to(button[3],{time=1000, x=display.contentWidth/2+100, y=display.contentHeight/2, alpha=1})
	--Detection for the text
	if (system.orientation=="landscapeLeft" or system.orientation=="landscapeRight") then
		docs.x=w/2
		docs.y=h/2-130
		docs2.x=w/2
		docs2.y=h/2-110
		print("pi")
	else
		docs.x=w/2
		docs.y=h/2-250
		docs2.x=w/2
		docs2.y=h/2-230
	end
	
end

--CLick the buttons and they disappear. Tilt the device to reset.
function multi_button(event)
	num=event.target.num
	print("disappear "..num)
	button[num].alpha=0
end

--Runtime event listener using resize
--Event listener for the 3 buttons
Runtime:addEventListener("resize",move)
button[1]:addEventListener("tap",multi_button)
button[2]:addEventListener("tap",multi_button)
button[3]:addEventListener("tap",multi_button)