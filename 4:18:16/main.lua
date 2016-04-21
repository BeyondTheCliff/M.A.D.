--Ian Smelser
--4/18/16
--Widget Project

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)

local widget = require("widget")

local currentNumber = 0

local function onStepperPress( event )

    if ( "increment" == event.phase ) then
        currentNumber = currentNumber + 1
    elseif ( "decrement" == event.phase ) then
        currentNumber = currentNumber - 1
    end
    print( currentNumber )
end

local newStepper = widget.newStepper(
    {
        left = 150,
        top = 200,
        minimumValue = 0,
        maximumValue = 50,
        onPress = onStepperPress
    }
)