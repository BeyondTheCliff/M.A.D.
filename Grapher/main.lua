--Ian Smelser
--9/29/15
--Math

arr = {}
state = 0
oldInput=0
debug=false
local w = display.contentWidth
local h = display.contentHeight
local reset = display.newText("Run",w/2,h/2+200,nil,40)
local input = native.newTextField(w/2, h/2+300, 300, 50)
input.inputType="default"


function run(event)
	if (state==1) then
		print("Reset")
		for i=1,oldInput do
			arr[i]:removeSelf()
			arr[i]=nil
		end
	end
	if (input==nil) then
		input=100
	end
	for i=1,input.text do
		oldInput=input.text
		local x = math.cos(i+100)*200+300
		local y = math.sin(i+100)*200+300
		if (debug==true) then
			print("Interation:"..i)
			print("X="..x)
			print("Y="..y)
		end
		arr[i]=display.newCircle(x,y,10)
		state=1
	end
end

reset:addEventListener("tap",run)