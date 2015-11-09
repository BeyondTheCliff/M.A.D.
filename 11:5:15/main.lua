--Ian Smelser 
--11/5/15
--Clock app

local w = display.contentWidth
local h = display.contentHeight

local Dclock = display.newText("",w/2,h*0.13,nil,80)
local backgroundCir = display.newCircle(w/2,h/2,w/2.1)
for i=1,60 do
	print(i)
	local x = -math.sin(i/9.57)*280+w/2
	local y = math.cos(i/9.57)*280+h/2
	local tick = display.newText("|",x,y,nil,40)
	tick.rotation=i*6
	tick:setFillColor(0.5,0.5,0.5)
end
local hourHand = display.newRect(w/2,h/2,230,25)
hourHand.anchorX=0
hourHand:setFillColor(0,0.5,0)
hourHand.rotation=-90
local minHand = display.newRect(w/2,h/2,250,20)
minHand.anchorX=0
minHand:setFillColor(0,0,0.8)
minHand.rotation=-90
local secHand = display.newRect(w/2,h/2,270,10)
secHand.anchorX=0
secHand:setFillColor(0.7,0,0)
secHand.rotation=-90
backgroundCir.strokeWidth=10
backgroundCir:setFillColor(0,0,0)
numbers={}
a=6
state=0
for i=1,12 do
	a=a+1
	local x = -math.sin(a/1.91)*250+w/2
	local y = math.cos(a/1.91)*250+h/2
	numbers[i]=display.newText(i,x,y,nil,60)
end

local knob = display.newCircle(w/2,h/2,20)

local function colorC( event )
	x={}
	x[1] = math.random(20,100)/100
	x[2] = math.random(20,100)/100
	x[3] = math.random(20,100)/100
	print(x[1])
	print(x[2])
	print(x[3])
	Dclock:setFillColor(x[1],x[2],x[3])
end
local function time( event )
	local currentT = os.date("*t")
	local hours = os.date("%I")
	local minutes = os.date("%M")
	local seconds = os.date("%S")
	local total = (hours*3600)+(minutes*60)+seconds
	--transition.to(secHand,{time=900,rotation=((seconds+1)*6)-90})
	secHand.rotation=((seconds+1)*6)-90
	--transition.to(minHand,{time=500,rotation=(((minutes*60+seconds+60)/10))-90})
	minHand.rotation=((minutes*60+seconds+60)/10)-90
	--transition.to(hourHand,{time=500,rotation=((total+3600)/240)-90})
	hourHand.rotation=((total/3600)*30)-90
	print(secHand.rotation)
	if (state~=1) then
		timer.performWithDelay(1000,time)
	end
	if (state==2) then
		colorC()
	end
	Dclock.text=os.date("%I:%M:%S")
end

local function stateC( event )
	if (state==0) then
		state=1
		print("pause")
		print("state:"..state)
	elseif (state==1) then
		state=2
		time()
		print("state:"..state)
	elseif (state==2) then
		state=0
		print("state:"..state)
	end
end
backgroundCir:addEventListener("tap",stateC)
time()