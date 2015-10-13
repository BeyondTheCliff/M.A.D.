--Game test 1
--Finally got random working! And the timing!

--Define the main array (not a table)
arr={}
--Defining all of the variables
local width = display.contentWidth
local height = display.contentHeight
local yvar = 200
local xvar = 0
local clickR = display.newText("Reset",100,100,nil,40)
local clickC = display.newText("Random",500,100,nil,40)
local score = 0
rand = nil
egress=false
egress2=false
failsafe = 0
failsafe_text=nil
time=0
halt=false
local scoreText = display.newText(score,width/2,100,nil,60)
local startGame = display.newText("Start Game",width/2,height*0.9,nil,60)
--Click it and it goes away function
local function click(event)
	local i = event.target.num
	if (arr[i].alpha==0) then
		score=score-1
	else
		score=score+1
		arr[i].alpha=0
	end
	scoreText.text=score
end
--Spawn the 16 squares
for i=1,16 do
	print("Spawning:"..i)
	if (i==5) then
		yvar=400
		xvar=0
	elseif (i==9) then
		yvar=600
		xvar=0
	elseif (i==13) then
		yvar=800
		xvar=0
	end
	arr[i]=display.newImage("square.png",width/2+150-(xvar*100), yvar+50)
	xvar=xvar+1
	arr[i].alpha=0
	arr[i].num=i
	arr[i]:addEventListener("tap",click)
end


local function reset () --Simple reset function. Remember to update with new variables!
	print("Reset Activated")
	for i=1,16 do
		arr[i].alpha=0
	end
	score=0
	scoreText.text=score
	if (failsafe_text~=nil) then
		failsafe_text:removeSelf()
	end
	egress2=false
	egress=false
	halt=true
end

clickR:addEventListener("tap",reset)

local function random()
	egress=false
	failsafe=1
	while (egress==false) do --Checking if a square is already visible function
		if (rand==nil) then
			rand=math.random(1,16)
		end
		if (arr[rand].alpha==1) then
			rand=math.random(1,16)
			print("New Random:"..rand)
		else
			arr[rand].alpha=1
			print("Success at:"..rand)
			egress=true
		end
		failsafe=failsafe+1
		if (failsafe>100) then
			print("Failsafe Activated")
			if failsafe==nil then
				failsafe_text=display.newText("Failsafe Activated", width/2, height/2)
			end
			egress=true
		end
	end
	rand=nil
end

clickC:addEventListener("tap",random)

function startTime(event) --Starts the game
	print(egress2)
	print(egress)
	if (failsafe>100 or halt==true) then
		egress2=true
	end
	if (egress2==false) then
		time=1000/(score+1)
		print(time)
		timer.performWithDelay(time,startTime)
		print("pass")
		random()
	else
		egress2=false
		halt=false
	end

end

startGame:addEventListener("tap",startTime)