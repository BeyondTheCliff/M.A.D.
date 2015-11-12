--Ian Smelser
--9/29/15
--Math

arr = {}
debug=true
local w = display.contentWidth
local h = display.contentHeight

function run(event)
	for i=1,12 do
		print("Printing")
		local x = math.cos(i/1.91+3)*100+w/2
		local y = math.sin(i/1.91+3)*100+h*0.3
		if (debug==true) then
			print("Interation:"..i)
			print("X="..x)
			print("Y="..y)
		end
		arr[i]=display.newText(i,x,y,nil,60)
	end
end
run()