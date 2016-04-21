--Ian Smelser
--4/12/16
--Widgets

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)

local widget = require( "widget" )

local function handleButtonEvent( event )
	if ("ended" == event.phase) or ("began" == event.phase) then
		button1:setLabel( "Hold" )
		progressView:setProgress(progressView:getProgress()+0.1)
	else
		button1:setLabel( "Released" )
	end
end

button1 = widget.newButton(
	{
		x=w/2,
		y=h/2,
		label = "BUTTON",
		onEvent = handleButtonEvent,
		emboss = false,
		shape = "roundedRect",
		width = 300,
		height = 100,
		cornerRadius = 5,
		fillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} },
		strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
		strokeWidth = 5,
		fontSize=50
	}
)

progressView = widget.newProgressView(
    {
    	x=w/2,
    	y=h*0.4,
        left = 10,
        top = 200,
        width = 280,
        height = 30,
        isAnimated = true
    }
)
progressView:setProgress(0)