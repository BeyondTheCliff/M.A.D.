--Monday, September 14, 2015
--Color changing text
print("Hello World")

local clock = os.clock
function sleep(n)
	local t0 = clock()
	while clock() - t0 <= n do end
end

local text = display.newText("Hello!",display.contentCenterX,display.contentCenterY,nil,50)
x = 1
local function changeColor()
	print(x)
	if (x==1) then
		print("function 1")
		text:setFillColor(1,0,0)
		x=2
	elseif (x==2) then
		print("function 2")
		text:setFillColor(0,0,1)
		x=3
	elseif (x==3) then
		print("function 3")
		text:setFillColor(0,1,0)
		x=1
	end
end

text:addEventListener("tap", changeColor)
