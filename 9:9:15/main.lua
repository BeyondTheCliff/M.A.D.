--main.lua
-- Start date Wednesday, September 9, 2015
-- End date Thursday, September 10, 2015

display.setStatusBar(display.HiddenStatusBar)

local clock = os.clock
function sleep(n)
	local t0 = clock()
	while clock() - t0 <= n do end
end

local count = 10
local textObj = display.newText("Pi",0,0,nil,52)
textObj.anchorX=0
textObj.anchorY=0

for count=10,1,-1 do
	print(count)
	textObj.text=count
	sleep(1)
end