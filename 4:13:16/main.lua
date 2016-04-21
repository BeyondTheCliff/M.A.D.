--Ian Smelser
--4/13/16
--Drum Kit Using Widgets

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)
system.activate("multitouch")

local widget = require("widget")

sounds = {}
sounds[1] = audio.loadSound("bass.wav")
sounds[2] = audio.loadSound("bonk.wav")
sounds[3] = audio.loadSound("closedhat.wav")
sounds[4] = audio.loadSound("openhat.wav")
sounds[5] = audio.loadSound("lowbonk.wav")
sounds[6] = audio.loadSound("cymbal.wav")
sounds[7] = audio.loadSound("snare.wav")
sounds[8] = audio.loadSound("tightbass.wav")
sounds[9] = audio.loadSound("woodblock.wav")

local function play( event )
	local target = event.target.name
	local music = event.target.name
	print(music)
	if (event.phase=="began") then
		--transition.cancel(decrease)
		--local increase = transition.to(target,{time=time1,width=250,height=250})
		audio.play(sounds[music])
	elseif event.phase == "ended" or event.phase == "canceled" then --Note that this can be just else
		--transition.cancel(increase)
		--local decrease = transition.to(target,{time=time2,width=150,height=150})
	end
end

buttons = {}
xloc, yloc = 0, 0
for i=1,9 do
	if (i<10) then yloc=0.75 end
	if (i<7) then yloc=0.5 end
	if (i<4) then yloc=0.25 end
	if (i==1) or (i==4) or (i==7) then xloc=0.3 end
	if (i==2) or (i==5) or (i==8) then xloc=0.5 end
	if (i==3) or (i==6) or (i==9) then xloc=0.7 end
	print(i.." : "..xloc.." : "..yloc)
	buttons[i] = widget.newButton(
		{
			x=w*xloc,
			y=h*yloc,
			onEvent = play,
			emboss = false,
			defaultFile="Button"..tostring(i)..".png",
			width = 150,
			height = 150,
			--label=i,
			--fontSize=30
		}
	)
	buttons[i].name=i
end