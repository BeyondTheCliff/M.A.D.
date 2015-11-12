--Ian Smelser
--9/29/15
--Math

arr = {}
debug=true
local w = display.contentWidth
local h = display.contentHeight
res=0
rotShift=0
its=12

for i=1,its do
	print("Printing")
	res=its/
	rotShift=math.pi()/2 --90 degrees
	local x = math.cos(i/res+rotShift)*100+w/2
	local y = math.sin(i/res+rotShift)*100+h*0.3
	if (debug==true) then
		print("Interation:"..i)
		print("X="..x)
		print("Y="..y)
	end
	arr[i]=display.newText(i,x,y,nil,60)
end
