--Game test 1
--Finally got random working! And the timing! I broke it then I fixed it by using game states!

--Define the main array (not a table)
arr={}
--Defining all of the variables
local width = display.contentWidth
local height = display.contentHeight
local yvar = 200
local xvar = 0
local clickR = display.newText("Reset",100,100,nil,40)
local clickC = display.newText("Random",500,100,nil,40)
clickC.alpha=0
local score = 0
rand = nil
state="stop"
egress=false
failsafe = 0
failsafe_text=display.newText("Game Over", width/2, height/2)
failsafe_text.alpha=0
time=1000
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
	--print("Spawning:"..i)
	if (i==5) then
		yvar=400
		xvar=0
	elseif (i==9) then
		yvar=550
		xvar=0
	elseif (i==13) then
		yvar=700
		xvar=0
	end
	arr[i]=display.newImage("square.png",width/2+150-(xvar*100), yvar+50)
	xvar=xvar+1
	arr[i].alpha=0 --They start invisible
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
	if (state=="running") then
		state="halt"
	elseif (state=="halt") then
		state="stop"
	end
	startGame.alpha=1
	failsafe_text.alpha=0
	time=1000
end

clickR:addEventListener("tap",reset)

local function random() --Random show function
	egress=false
	failsafe=1
	while (egress==false) do --Checking if a square is already visible function
		if (rand==nil) then
			rand=math.random(1,16)
		end
		if (arr[rand].alpha==1) then
			rand=math.random(1,16)
			--print("New Random:"..rand)
		else
			arr[rand].alpha=1
			--print("Success at:"..rand)
			egress=true
		end
		failsafe=failsafe+1
		if (failsafe>50) then
			print("Failsafe Activated")
			state="halt"
			egress=true
		end
	end
	rand=nil
end

clickC:addEventListener("tap",random)

function startTime(event) --Starts the game. This has the logic for the game
	if (state=="stop") then
		state="running"
	end
	if (failsafe>100 or state=="halt" or time<10) then
		for i=1,16 do
			arr[i].alpha=0
		end
		failsafe_text.alpha=1
		--clickR.text="Reset"
		state="stop"
	end
	if (state=="running") then
		time=(time*0.99999999)-math.sqrt(((score+1)*3))
		print("time:"..time)
		print("score:"..score)
		timer.performWithDelay(time,startTime)
		--print("pass")
		random()
		--clickR.text="Stop"
	end
	startGame.alpha=0
end

startGame:addEventListener("tap",startTime)