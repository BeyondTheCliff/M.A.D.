--Ian Smelser
--1/20/16
--Groups

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)

local button1 = display.newImage("Button1.png",0,0)
local button2 = display.newImage("Button2.png",60,0)
local button3 = display.newImage("Button3.png",120,0)
state=false

local group = display.newGroup()
group.anchorChildren=true
group.anchorX=0.5
group.anchorY=0.5
group:insert(button1)
group:insert(button2)
group:insert(button3)
group.x=w/2
group.y=h/2

function move( event )
	if (state==false) then
		transition.to(group,{time=300,rotation=180})
		transition.to(group,{time=300, x=math.random(70,w-140), y=math.random(70,h-140)})
		state=true
	else
		transition.to(group,{time=300,rotation=0})
		transition.to(group,{time=300, x=math.random(70,w-140), y=math.random(70,h-140)})
		state=false
	end
end
group:addEventListener("tap",move)