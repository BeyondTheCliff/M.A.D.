--Ian Smelser
--1/25/16
--Composer API

--Global Variables and global changes
w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)
globalState=0 --A global state used for scene organization

local composer = require("composer") --Load composer elements
local transitions = {"zoomInOutFade","zoomOutInFade","fade","crossFade"} --Table of transitions
local x = 1
function switchScene( var ) --Function that controls scenes and transitions
	if (var~=nil) then
		globalState=var
	end
	if (globalState==0) then
		composer.gotoScene("splash")
	elseif (globalState==1) then
		composer.gotoScene("vector", {effect=transitions[x], time="500"})
	elseif (globalState==2) then
		composer.gotoScene("imaged", {effect=transitions[x], time="500"})
	end
	print(x..":"..transitions[x])
	x=x+1
	if (x==table.getn(transitions)+1) then
		x=1
	end
end
switchScene() --Initialization