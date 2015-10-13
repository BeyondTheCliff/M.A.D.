--Ian Smelser
--10/1/15
--Assignment 5

--Define device areas and cat image
local width = display.contentWidth
local height = display.contentHeight
local cat = display.newImage("redkitty.png",width/2,height/2)

--Function containing random variables in the transition
function move(event)
	local time = math.random(200,3000)
	local x = math.random(50,width-50)
	local y = math.random(50,height-50)
	print("Time:"..time)
	print("X:"..x)
	print("Y:"..y)
	print("-------------")
	transition.to(cat,{time=time, x=x, y=y})
end

--Event listener linking the cat button to the function controlling it
cat:addEventListener("tap",move)