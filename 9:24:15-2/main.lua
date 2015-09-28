--9/24/15
--Ian Smelser
--Assigmnet 3.1

--Text and Var for alpha
local text = display.newText("",display.contentWidth/2,100,nil,60)

--Load Images
local square = display.newImage("Ch3Square.png")
square.x = display.contentWidth/2
square.y = 200

--Buttons!
local hideButton = display.newImage("Ch3HideButton.png")
hideButton.x = display.contentWidth/2 -100
hideButton.y = display.contentHeight/2

local showButton = display.newImage("Ch3ShowButton.png")
showButton.x = display.contentWidth/2
showButton.y = display.contentHeight/2

local fadeButton = display.newImage("Ch3FadeButton.png")
fadeButton.x = display.contentWidth/2+100
fadeButton.y = display.contentHeight/2

--All functions for the buttons Hide, Show, and toggle fade
local function hide_Button()
	square.alpha=0
	text.text=square.alpha
end
local function show_Button()
	square.alpha=1
	text.text=square.alpha
end
local function fade_Button()
	if (square.alpha==1) then
		transition.to(square, {time=1000, alpha=0})
		text.text=0
	else
		transition.to(square, {time=1000, alpha=1})
		text.text=1
	end
end

--Debug set
text.text=square.alpha
--Events Listeners 
hideButton:addEventListener("tap", hide_Button)
showButton:addEventListener("tap", show_Button)
fadeButton:addEventListener("tap", fade_Button)