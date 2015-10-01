--Ian Smelser
--9/29/15
--Math


local arr = {}

for i=1,100 do
	print("Interation:"..i)
	local x = math.cos(i+100)*200+300
	local y = math.sin(i+100)*200+300
	print("X="..x)
	print("Y="..y)
	arr[i]=display.newImage("10square.png",x,y)
end

