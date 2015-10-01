--Game test 1

arr={}

local width = display.contentWidth
local height = display.contentHeight
local x = 1
local yvar = 200
local xvar = 0
local clickB = display.newText("Reset",100,100,nil,40)
local clickC = display.newText("Random",500,100,nil,40)
local score = 0
local scoreText = display.newText(score,width/2,100,nil,60)

local function click(event)
	local i = event.target.num
	arr[i].alpha=0
	score=score+1
	scoreText.text=score
end

for i=1,16 do
	print(i)
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
	arr[i]=display.newText("arr:"..i,width/2+200-(xvar*100), yvar)
	xvar=xvar+1
	arr[i].alpha=1
	arr[i].num=i
	arr[i]:addEventListener("tap",click)
end


local function reset ()
	for i=1,16 do
		print(i)
		arr[i].alpha=1
	end
	score=0
	scoreText.text=score
end

clickB:addEventListener("tap",reset)

local function random ()
	local rand = math.random(1,16)
	local alph = arr[rand].alpha
	print("Num:"..rand)
	print("A1:"..alph)
	arr[rand].alpha=0
	print("A2:"..arr[rand].alpha)
	if (alph==0) then
		while (alph==1) do
			local rand = math.random(1,16)
			print("while:"..rand)
			arr[rand].alpha=0
			alph = arr[rand].alpha
		end
	end
end

clickC:addEventListener("tap",random)