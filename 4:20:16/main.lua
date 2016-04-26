--Ian Smelser
--4/20/16
--Widget Color Picker

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)

local widget = require("widget")

red=1
green=1
blue=1
alpha=1
random=0

local face = display.newImageRect("nature.jpg",500,500)
face.x,face.y=w/2,h/2
local background = display.newRect(w/2,h/2,w,h)
background:setFillColor(red,green,blue,alpha)
Values={}
Values["Red"] = display.newText("Red=".. red*100 .."%",w*0.5,h*0.1,nil,60)
Values["Red"]:setFillColor(1,0,0)
Values["Red"].name="Red"
Values["Green"] = display.newText("Green=".. green*100 .."%",w*0.5,h*0.2,nil,60)
Values["Green"]:setFillColor(0,1,0)
Values["Green"].name="Green"
Values["Blue"] = display.newText("Blue=".. blue*100 .."%",w*0.5,h*0.3,nil,60)
Values["Blue"]:setFillColor(0,0,1)
Values["Blue"].name="Blue"
Values["Alpha"] = display.newText("Alpha=".. alpha*100 .."%",w*0.5,h*0.4,nil,60)
Values["Alpha"]:setFillColor(0,0,0)
Values["Alpha"].name="Alpha"

local function colorFunction( event )
	local color = event.value/100
	local id = event.target.id
	if (id=="Red") then red=color end
	if (id=="Green") then green=color end
	if (id=="Blue") then blue=color end
	if (id=="Alpha") then alpha=color end
	Values[event.target.id].text=event.target.id.."="..event.value.."%"
	background:setFillColor(red,green,blue,alpha)
end

Sliders={}
Sliders["Red"] = widget.newSlider(
    {
        x = w/2,
        y = h*0.6,
        width = w*0.7,
        value = 100,
        listener = colorFunction,
        id="Red"
    }
)
Sliders["Green"] = widget.newSlider(
    {
        x = w/2,
        y = h*0.7,
        width = w*0.7,
        value = 100,
        listener = colorFunction,
        id="Green"
    }
)
Sliders["Blue"] = widget.newSlider(
    {
        x = w/2,
        y = h*0.8,
        width = w*0.7,
        value = 100,
        listener = colorFunction,
        id="Blue",
    }
)
Sliders["Alpha"] = widget.newSlider(
    {
        x = w/2,
        y = h*0.9,
        width = w*0.7,
        value = 100,
        listener = colorFunction,
        id="Alpha"
    }
)

local function random( event)
	local name = event.target.name
	random=0
	random = math.random(0,100)
	if (name=="Red") then red=random/100 end
	if (name=="Green") then green=random/100 end
	if (name=="Blue") then blue=random/100 end
	if (name=="Alpha") then alpha=random/100 end
	Values[name].text = name.."="..random.."%"
	Sliders[name]:setValue(random)
	print(red..":"..random)
	background:setFillColor(red,green,blue,alpha)
end
Values["Red"]:addEventListener("tap",random)
Values["Green"]:addEventListener("tap",random)
Values["Blue"]:addEventListener("tap",random)
Values["Alpha"]:addEventListener("tap",random)