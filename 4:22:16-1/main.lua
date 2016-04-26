local widget = require("widget")

local letters = native.getFontNames()
for i, fontname in ipairs(letters) do 
	--print("fontname ="..tostring(fontname))
end

local RedColor = 0
local BlueColor = 0
local GreenColor = 0

local Red = display.newText("Red:"..RedColor, 80, 60, "Residualni", 45)
Red:setFillColor (1, 0, 0)

local Blue = display.newText("Blue:"..BlueColor, 80, 110, "Residualni", 45)
Blue:setFillColor (0, 0, 1)

local Green = display.newText("Green:"..GreenColor, 80, 160, "Residualni", 45)
Green:setFillColor (0, 1, 0)

	

local RedBar = widget.newSlider(
{
	x = display.contentCenterX,
	y = 300,
	width = 100,
	value = 0,
	id = "RedBar"
	}	
	)

local BlueBar = widget.newSlider(
{
	x = display.contentCenterX,
	y = 340,
	width = 100,
	value = 0,
	id = "BlueBar"
	}	
	)

local GreenBar = widget.newSlider(
{
	x = display.contentCenterX,
	y = 380,
	width = 100,
	value = 0,
	id = "GreenBar"
	}	
	)