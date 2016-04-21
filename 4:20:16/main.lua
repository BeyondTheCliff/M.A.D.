--Ian Smelser
--4/20/16
--Widget Color Picker

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)

local widget = require("widget")

local face = display.newImageRect("nature.jpg",500,500)
face.x,face.y=w/2,h/2
local background = display.newRect(w/2,h/2,w,h)
local rValue = display.newText("Red=100%",w*0.5,h*0.1,nil,60)
rValue:setFillColor(1,0,0)
local gValue = display.newText("Green=100%",w*0.5,h*0.2,nil,60)
gValue:setFillColor(0,1,0)
local bValue = display.newText("Blue=100%",w*0.5,h*0.3,nil,60)
bValue:setFillColor(0,0,1)
local aValue = display.newText("Alpha=100%",w*0.5,h*0.4,nil,60)
aValue:setFillColor(0,0,0)
red=1
green=1
blue=1
alpha=1
local function redFunction( event )
	red = event.value/100
	rValue.text="Red="..event.value.."%"
	background:setFillColor(red,green,blue,alpha)
end
local function greeFunction( event )
	green = event.value/100
	gValue.text="Green="..event.value.."%"
	background:setFillColor(red,green,blue,alpha)
end
local function blueFunction( event )
	blue = event.value/100
	bValue.text="Blue="..event.value.."%"
	background:setFillColor(red,green,blue,alpha)
end
local function alphaFunction( event )
	alpha = event.value/100
	aValue.text="Alpha="..event.value.."%"
	background:setFillColor(red,green,blue,alpha)
end

rSlider = widget.newSlider(
    {
        x = w/2,
        y = h*0.6,
        width = w*0.7,
        value = 100,
        listener = redFunction,
    }
)
gSlider = widget.newSlider(
    {
        x = w/2,
        y = h*0.7,
        width = w*0.7,
        value = 100,
        listener = greeFunction
    }
)
bSlider = widget.newSlider(
    {
        x = w/2,
        y = h*0.8,
        width = w*0.7,
        value = 100,
        listener = blueFunction
    }
)
aSlider = widget.newSlider(
    {
        x = w/2,
        y = h*0.9,
        width = w*0.7,
        value = 100,
        listener = alphaFunction
    }
)

local function randRed( event)
	random=0
	random = math.random(0,100)
	rValue.text = "Red="..random.."%"
	rSlider:setValue(random)
	red = random/100
	background:setFillColor(red,green,blue,alpha)
end
rValue:addEventListener("tap",randRed)
local function randGreen( event)
	random=0
	local random = math.random(0,100)
	gValue.text = "Green="..random.."%"
	gSlider:setValue(random)
	green = random/100
	background:setFillColor(red,green,blue,alpha)
end
gValue:addEventListener("tap",randGreen)
local function randBlue( event)
	random=0
	local random = math.random(0,100)
	bValue.text = "Blue="..random.."%"
	bSlider:setValue(random)
	blue = random/100
	background:setFillColor(red,green,blue,alpha)
end
bValue:addEventListener("tap",randBlue)
local function randAlpha( event)
	random=0
	local random = math.random(0,100)
	aValue.text = "Alpha="..random.."%"
	aSlider:setValue(random)
	alpha = random/100
	background:setFillColor(red,green,blue,alpha)
end
aValue:addEventListener("tap",randAlpha)