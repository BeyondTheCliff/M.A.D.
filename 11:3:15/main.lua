--Ian Smelser
--11/4/15
--testing things

local background = display.newImage("bkgrd.png",0,0)
print(display.contentWidth)
print(display.contentHeight)

local function click( event )
	print("1")
	local x = event.x
	local y = event.y
	if (event.phase=="began") then
		local textx = display.newText("X",x,y,nil,60)
		print("2")
	end
end

background:addEventListener("touch",click)