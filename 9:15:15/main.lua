--9/15/15
--Random Colors

local clock = os.clock
function sleep(n)
	local t0 = clock()
	while clock() - t0 <= n do end
end

print("Hello World")

local text = display.newText("Colors",display.contentCenterX,display.contentCenterY,nil,60)
local rand1 = display.newText("1",display.contentCenterX,100,nil,60)
local rand2 = display.newText("2",display.contentCenterX,200,nil,60)
local rand3 = display.newText("3",display.contentCenterX,300,nil,60)
local function colorChange( event )
	print("--------------------")
	local x = {math.random(),math.random(),math.random()}
	print(x[1])
	print(x[2])
	print(x[3])
	text:setFillColor(x[1],x[2],x[3])
	rand1.text = x[1]
	rand2.text = x[2]
	rand3.text = x[3]
	print("--------------------|")
end

text:addEventListener("tap",colorChange)