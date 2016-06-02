--D. Sharek, I. Smelser, B. Young, A. Meredith  
--4/26/16
--Final Project - 

--[[
Ideas:
Mini games
	Multiple smaller games eg. battle ship, chess, checkers
Multi-player 
	Could not do servers
	Could do local or p2p
battleship.battleship
mainMenu

]]--
w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)

widget = require("widget")
physics = require("physics")
composer = require("composer")

function switchScene( scene )
	if (scene==nil) then
		composer.gotoScene("mainMenu")
	else
		composer.gotoScene(scene)
	end
end
switchScene("mainMenu")