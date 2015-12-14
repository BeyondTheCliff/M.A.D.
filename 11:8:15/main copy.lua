--Ian Smelser 
--11/5/15
--Clock app

w = display.contentWidth --My own personal globals
h = display.contentHeight

local Dclock = display.newText("",w/2,h*0.13,nil,80) --Digital Clock at the top
Dclock.numX=0
local backgroundCir = display.newCircle(w/2,h/2,w/2.1) --Background Circle (Basically a ring)
backgroundCir.strokeWidth=10
backgroundCir:setFillColor(0,0,0)
tick={} --making the second ticks
for i=1,60 do 
	print(i)
	local x = -math.sin(i/9.57)*280+w/2 --YAY! Math!
	local y = math.cos(i/9.57)*280+h/2 --More math
	tick[i] = display.newText("|",x,y,nil,35) --I used "|" pipes to make the ticks
	tick[i].rotation=i*6 --Using pipes is quick and easy
	tick[i]:setFillColor(0.65,0.65,0.65)
end
local hourHand = display.newRect(w/2,h/2,200,30) --The hour hand is the widest and shortest
hourHand.anchorX=0
hourHand:setFillColor(0,0.5,0) --and green
hourHand.rotation=-90
local minHand = display.newRect(w/2,h/2,240,20) --Minutes hand is in the middle
minHand.anchorX=0
minHand:setFillColor(0,0,0.8) --and blue
minHand.rotation=-90
local secHand = display.newRect(w/2,h/2,270,10) --Second hand is long and thin
secHand.anchorX=0
secHand:setFillColor(0.7,0,0) --and red
secHand.rotation=-90

numbers={}
state=0
a=6
for i=1,12 do --Creates the numbers using sin and cos to make a circle
	a=a+1
	local x = -math.sin(a/1.91)*250+w/2
	local y = math.cos(a/1.91)*250+h/2
	numbers[i]=display.newText(i,x,y,nil,60)
	numbers[i].numX=i
end
local knob = display.newCircle(w/2,h/2,20)
local function time( event ) --The keeper of the time. Updates 1000ms 
	local currentT = os.date("*t")
	local hours = os.date("%I")
	local minutes = os.date("%M")
	local seconds = os.date("%S")
	local total = (hours*3600)+(minutes*60)+seconds
	--transition.to(secHand,{time=900,rotation=((seconds+1)*6)-90})
	secHand.rotation=(seconds*6)-90
	--transition.to(minHand,{time=500,rotation=(((minutes*60+seconds+60)/10))-90})
	minHand.rotation=(minutes*6)-90
	--transition.to(hourHand,{time=500,rotation=((total+3600)/240)-90})
	hourHand.rotation=(hours*30)-90
	print(secHand.rotation)
	timer.performWithDelay(1000,time)
	Dclock.text=os.date("%I:%M:%S")
end
time()