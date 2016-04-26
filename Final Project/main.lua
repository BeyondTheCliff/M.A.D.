--D. Sharek, I. Smelser, B. Young, A. Meredith  
--4/26/16
--Final Project - 

--[[
Ideas:
Mini games
	Multiple smaller games eg. battle ship, chess, checkers
RGP? 
	Larger more complicated game
	Might take to long
Multi-player 
	Could not do servers
	Could do local or p2p
	
]]--
w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)

local widget = require("widget")
local physics = require("physics")