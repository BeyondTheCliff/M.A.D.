--Ian Smelser
--2/4/16
--Drum Set project
--Set globals and settings
w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)
system.activate("multitouch")
--Load the music
music1 = audio.loadSound("bass.wav")
music2 = audio.loadSound("bonk.wav")
music3 = audio.loadSound("closedhat.wav")
music4 = audio.loadSound("openhat.wav")
music5 = audio.loadSound("lowbonk.wav")
music6 = audio.loadSound("cymbal.wav")
music7 = audio.loadSound("snare.wav")
music8 = audio.loadSound("tightbass.wav")
music9 = audio.loadSound("woodblock.wav")
--Load the buttons with dynamic resolution
circle1=display.newImageRect("Button1.png",150,150)
circle1.x=w*0.3
circle1.y=h*0.2
circle1.name=circle1
circle1.music=music1
circle2=display.newImageRect("Button2.png",150,150)
circle2.x=w*0.5
circle2.y=h*0.2
circle2.name=circle2
circle2.music=music2
circle3=display.newImageRect("Button3.png",150,150)
circle3.x=w*0.7
circle3.y=h*0.2
circle3.name=circle3
circle3.music=music3
circle4=display.newImageRect("Button4.png",150,150)
circle4.x=w*0.3
circle4.y=h*0.5
circle4.name=circle4
circle4.music=music4
circle5=display.newImageRect("Button5.png",150,150)
circle5.x=w*0.5
circle5.y=h*0.5
circle5.name=circle5
circle5.music=music5
circle6=display.newImageRect("Button6.png",150,150)
circle6.x=w*0.7
circle6.y=h*0.5
circle6.name=circle6
circle6.music=music6
circle7=display.newImageRect("Button7.png",150,150)
circle7.x=w*0.3
circle7.y=h*0.8
circle7.name=circle7
circle7.music=music7
circle8=display.newImageRect("Button8.png",150,150)
circle8.x=w*0.5
circle8.y=h*0.8
circle8.name=circle8
circle8.music=music8
circle9=display.newImageRect("Button9.png",150,150)
circle9.x=w*0.7
circle9.y=h*0.8
circle9.name=circle9
circle9.music=music9

time1=25
time2=200
--The function that use phases and increases the button sizes then decrease and play sounds accordingly.
local function play( event )
	local target = event.target.name
	local music = event.target.music
	if (event.phase=="began") then
		transition.cancel(decrease)
		local increase = transition.to(target,{time=time1,width=250,height=250})
		audio.play(music)
	elseif event.phase == "ended" or event.phase == "canceled" then --Note that this can be just else
		transition.cancel(increase)
		local decrease = transition.to(target,{time=time2,width=150,height=150})
	end
end
--Event listeners
circle1:addEventListener("touch",play)
circle2:addEventListener("touch",play)
circle3:addEventListener("touch",play)
circle4:addEventListener("touch",play)
circle5:addEventListener("touch",play)
circle6:addEventListener("touch",play)
circle7:addEventListener("touch",play)
circle8:addEventListener("touch",play)
circle9:addEventListener("touch",play)
