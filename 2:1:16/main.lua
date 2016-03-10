--Ian Smelser
--2/1/16
--Audio Tests
--Globals
w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)
--Loading sound tracks and buttons
soundTrack1 = audio.loadStream("loop.caf")
soundTrackDur1 = audio.getDuration(soundTrack1)
soundTrack2 = audio.loadStream("08 Instrumental.mp3")
soundTrackDur2 = audio.getDuration(soundTrack2)
soundTrack3 = audio.loadStream("13 Dramatic.mp3")
soundTrackDur3 = audio.getDuration(soundTrack3)
local play = display.newImageRect("play.png",100,100)
local pause = display.newImageRect("pause.png",100,100)
local stop = display.newImageRect("stop.png",100,100)
play.x,play.y=w*0.4,h*0.9
pause.x,pause.y=w*0.4,h*0.9
stop.x,stop.y=w*0.6,h*0.9
pause.alpha=0 --Start the pause as invisible
--Display the track options and tag them for later use in the function.
local track1 = display.newText("Track 1",w/2,h*0.2,nil,100)
track1.name="soundTrack1"
local track2 = display.newText("Track 2",w/2,h*0.3,nil,100)
track2.name="soundTrack2"
local track3 = display.newText("Track 3",w/2,h*0.4,nil,100)
track3.name="soundTrack3"
track1:setFillColor(1,0,0) --Starting track is the first one
local bar = display.newRect(w/2,h*0.65,w,30) --The track bar, could be used for manual seeking
local dot = display.newRect(0,h*0.65,20,30) --The blue bar progresses across the screen 
dot:setFillColor(0,0,1)
dot.anchorX=0
local state = display.newText("Stopped",w/2,h*0.75,nil,75) --State text

local currentTrack = soundTrack1 --Local currents for the change track and play track
local currentDuration = soundTrackDur1
local function changeTrack(event) --This function is called by any of the track buttons
	local target = event.target.name
	transition.cancel(transitions) --basic stuff to cancel the previous stuff
	transition.to(dot,{time=250,width=20})
	audio.pause(1)
	audio.stop(1)
	pause.alpha=0
	play.alpha=1
	if (target=="soundTrack1") then
		currentTrack = soundTrack1 --things to change for the next track
		currentDuration = soundTrackDur1
		track1:setFillColor(1,0,0)
		track2:setFillColor(1,1,1)
		track3:setFillColor(1,1,1)
	elseif (target=="soundTrack2") then
		currentTrack = soundTrack2
		currentDuration = soundTrackDur2
		track1:setFillColor(1,1,1)
		track2:setFillColor(1,0,0)
		track3:setFillColor(1,1,1)
	elseif (target=="soundTrack3") then
		currentTrack = soundTrack3
		currentDuration = soundTrackDur3
		track1:setFillColor(1,1,1)
		track2:setFillColor(1,1,1)
		track3:setFillColor(1,0,0)
	end
end
local function playTrack()
	pause.alpha=1 --switches the buttons
	play.alpha=0
	if (audio.isChannelActive(1)==true) then --only resumes something if something is there
		audio.resume(1)
		transition.resume(transitions)
	else
		local soundTrack = audio.play(currentTrack,{loops=-1,channel=1})
		local transitions = transition.to(dot,{time=currentDuration,width=w,iterations=-1})--starts the blue bar progressing across the scene
	end
	state.text="Playing"
end
local function pauseTrack() --Switches the buttons and pauses audio and pauses transitions 
	audio.pause(1)
	transition.pause(transitions)
	pause.alpha=0
	play.alpha=1
	state.text="Paused"
end
local function stopTrack() --Has a whole bunch of reset stuff
	audio.seek(0,soundTrack)
	audio.stop(1)
	transition.cancel(transitions)
	transition.to(dot,{time=500,width=20})
	pause.alpha=0
	play.alpha=1
	state.text="Stopped"
end
--All the event listeners for the various buttons and functions
play:addEventListener("tap",playTrack)
pause:addEventListener("tap",pauseTrack)
stop:addEventListener("tap",stopTrack)
track1:addEventListener("tap",changeTrack)
track2:addEventListener("tap",changeTrack)
track3:addEventListener("tap",changeTrack)
