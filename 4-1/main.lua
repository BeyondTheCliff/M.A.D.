--Ian Smelser
--11/5/15
--Assignment lolz


-- Keep track of time in seconds
local secondsLeft = 1 * 60   -- 20 minutes * 60 seconds

local clockText = display.newText("", display.contentCenterX, 200, native.systemFontBold, 80)
clockText:setFillColor( 0.7, 0.7, 1 )

local function updateTime()
	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1
	
	-- time is tracked in seconds.  We need to convert it to minutes and seconds
	local minutes = math.floor( secondsLeft / 60 )
	local seconds = secondsLeft % 60
	
	-- make it a string using string format.  
	local timeDisplay = string.format( "%02d:%02d", minutes, seconds )
	clockText.text = timeDisplay
end

-- run them timer
local countDownTimer = timer.performWithDelay( 1000, updateTime, secondsLeft )