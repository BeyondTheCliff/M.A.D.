--Ian Smelser 
--11/11/15
--Clock app

--[[
Click the rim or center of the clock to switch between: running, paused, or changing the 
	digital clock's color. And now has 24 hour time at state 3. 
Click the digital clock to hide or show it. It will reset to white when shown again.
The clock updates to real time every 1 second
Every minute, the number of the current hour will spin.

x=cos(i/resolution-rotationShift)*radius+offset
y=sin(i/resolution-rotationShift)*radius+offset
i - number of iterations to run
resolution = i / tau
rotationShift = pi / 2 or 90 degrees
radius - in pixels 
offset - also in pixels
--]]
local composer = require("composer")
local scene = composer.newScene()
local function goToImaged() --Tells main.lua to change to image clock
	switchScene(2)
end
function scene:create(event)
	local sceneGroup = self.view
	w = display.contentWidth --My own personal globals
	h = display.contentHeight
	local Dclock = display.newText("",w/2,h*0.13,nil,80) --Digital Clock at the top
	Dclock.numX=0
	sceneGroup:insert(Dclock)
	local backgroundCir = display.newCircle(w/2,h/2,w/2.62) --Background Circle (Basically a ring)
	backgroundCir.strokeWidth=10
	backgroundCir:setFillColor(0,0,0)
	sceneGroup:insert(backgroundCir)
	local pauseT = display.newText("Paused",w/2,h*0.9,nil,70) --Some text to notify if paused
	pauseT.alpha=0 --Auto set to invisible
	sceneGroup:insert(pauseT)
	tick={} --making the second ticks
	for i=1,60 do 
		local x = math.cos(i/9.54-1.57)*(289)+w/2 --YAY! Math!
		local y = math.sin(i/9.54-1.57)*(289)+h/2 --More math
		tick[i] = display.newText("|",x,y,nil,30) --I used "|" pipes to make the ticks
		tick[i].rotation=i*6 --Using pipes is quick and easy
		tick[i]:setFillColor(0.65,0.65,0.65)
		sceneGroup:insert(tick[i])
	end
	local hourHand = display.newRect(w/2,h/2,30,170) --The hour hand is the widest and shortest
	hourHand.anchorY=1
	hourHand:setFillColor(0,0.5,0) --and green
	hourHand.rotation=0
	sceneGroup:insert(hourHand)
	local minHand = display.newRect(w/2,h/2,20,240) --Minutes hand is in the middle
	minHand.anchorY=1
	minHand:setFillColor(0,0,0.8) --and blue
	minHand.rotation=0
	sceneGroup:insert(minHand)
	local secHand = display.newRect(w/2,h/2,10,270) --Second hand is long and thin
	secHand.anchorY=1
	secHand:setFillColor(0.7,0,0) --and red
	secHand.rotation=0
	sceneGroup:insert(secHand)
	numbers={}
	state=0
	useTransition=false
	for i=1,12 do --Creates the numbers using sin and cos to make a circle
		local x = math.cos(i/1.91-1.57)*245+w/2
		local y = math.sin(i/1.91-1.57)*245+h/2
		numbers[i]=display.newText(i,x,y,nil,60)
		numbers[i].numX=i
		numbers[i]:setFillColor(1,1,1)
		sceneGroup:insert(numbers[i])
	end
	local knob = display.newCircle(w/2,h/2,20)
	sceneGroup:insert(knob)
	local function colorC( event )
		x={}
		x[1] = math.random(20,100)/100
		x[2] = math.random(20,100)/100
		x[3] = math.random(20,100)/100
		--print(x[1])
		--print(x[2])
		--print(x[3])
		Dclock:setFillColor(x[1],x[2],x[3])
	end
	function time( event ) --The keeper of the time. Updates 1000ms 
		local hours = os.date("%I")
		local minutes = os.date("%M")
		local seconds = os.date("%S")
		local total = (hours*3600)+(minutes*60)+seconds
		if (useTransition==true) then --You can choose to use smooth movements
			transition.to(secHand,{time=900,rotation=((seconds)*6)+secHand.rotation})
			transition.to(minHand,{time=500,rotation=((minutes*60+seconds)/10)})
			transition.to(hourHand,{time=500,rotation=((total/3600)*30)})
		else --I use totaling methods to get accurate positions
			secHand.rotation=((seconds)*6) --times six because 60*6=360
			minHand.rotation=((minutes*60+seconds)/10) --totals minutes and seconds
			hourHand.rotation=((total/3600)*30)	--uses the total above
		end
		if (state~=1) then --Logic check for pausing
			switch24("12")
			timer.performWithDelay(1000,time)
			pauseT.alpha=0
		else --Activates to not run
			pauseT.alpha=1
			--print("pause")
		end
		if (state==2) then --State 2 runs and changes colors
			colorC()
			pauseT.alpha=0
		end
		if (state==3) then
			Dclock.text=os.date("%H:%M:%S")
			if (os.date("%H")>"12") then
				switch24("24")
			else
				switch24("12")
			end
		else
			Dclock.text=os.date("%I:%M:%S %p")
			switch24("12")
		end
		--print(os.date("%c"))
		if (os.date("%S")=="00") then --Spins the hour every minute
			--print("spin")
			local Num = tonumber(os.date("%I"))
			transition.to(numbers[Num],{time=1000,rotation=numbers[Num].rotation+360})	
		end
	end
	local function stateC( event ) --Main logic section for pausing and other states
		if (event.phase=="began") then
			backgroundCir:setStrokeColor(1,0.25,0.25)
			if (state==0) then --Pauses the clock
				state=1
				print("pause")
				print("state:"..state)
			elseif (state==1) then --Runs the clock and the color changer
				state=2
				time()
				--print("state:"..state)
			elseif (state==2) then --Runs the clock normally
				state=3
				--print("state:"..state)
			elseif (state==3) then --24 hour 
				state=0
				--print("state:"..state)
			else --Backup for outside states
				state=1
			end
		elseif (event.phase=="ended") then
			backgroundCir:setStrokeColor(1,1,1)
		else
			backgroundCir:setStrokeColor(1,1,1)
		end
	end
	function switch24( pass )
		if (pass=="24") then
			for i=1,12 do --Creates the numbers using sin and cos to make a circle
				numbers[i].text=i+12
				numbers[i]:setFillColor(1,0.25,0.25)
			end
		else
			for i=1,12 do --Creates the numbers using sin and cos to make a circle
				numbers[i].text=i
				numbers[i]:setFillColor(1,1,1)
			end
		end
	end
	local function hideClock( event ) --Allows the user to hide the digital clock
		if (Dclock.numX==0) then
			Dclock:setFillColor(0,0,0)
			Dclock.numX=1
		else
			Dclock:setFillColor(1,1,1) --The clock's color resets when shown
			Dclock.numX=0
		end
	end
	backgroundCir:addEventListener("touch",stateC) --All of the event listeners
	Dclock:addEventListener("tap",hideClock)
	knob:addEventListener("tap",stateC)
	time() --The startup function
	local button = display.newText("Switch Clocks",w/2,h*0.85,"AmericanTypewriter",60)
	sceneGroup:insert(button)
	button:addEventListener("tap", goToImaged)
end
scene:addEventListener( "create", scene )
return scene