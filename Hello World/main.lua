--Arrays and things

--local array = {}
--for i=0,9 do
--	array[i]=i
--	print(array[i])
--end
--
--print("Array Size "..table.getn(array))
--
--
--for x=0,table.getn(array) do
--	display.newText(array[x],100,100+(array[x]*75),native.systemFont,48)
--end



--Timer, count up

--local x = 1
--local textObj = display.newText(x,100,100,"Times",48)
--function listener( event )
--	print(x)
--	textObj.text = x
--	x=x+1
--	if x>10 then
--		return 0
--	end
--	timer.performWithDelay(1000,listener)
--end
--
--print("Start")
--listener()

--Hello World: Sleep function

local clock = os.clock
local date = os.date
function sleep(n)  -- seconds
	local t0 = clock()
	while clock() - t0 <= n do end
end

print(date)