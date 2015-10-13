--Ian Smelser
--10/12/15
--Project 4.0

--Basics, no displaying objects, Lots of math
local w = display.contentWidth
local h = display.contentHeight
local daysInYear = 365.2425   -- # days based on Gregorian cal
local weeksInYear = daysInYear / 7
local daysInMonth = daysInYear / 12   --average # days a month
local weeksInMonth = daysInMonth / 7 -- # of weeks in a month
local secInMin = 60    -- # of seconds in a minute
local secInHour = 60 * secInMin
local secInDay = 24 * secInHour
local secInWeek = 7 * secInDay
local secInMonth = daysInMonth *secInDay  -- ave # of sec/month
local secInYear = daysInYear *secInDay   --# seconds in a year
local todaysDate = os.date("*t")
--Load images and text and text fields, including background
local background = display.newImage("bkgrd.png", 0, 0)
local text_name = display.newText("Enter your name",w/2,h*0.1,nil,40)
local text_bday = display.newText("Enter date of birth mm/dd/yyyy",w/2,h*0.3,nil,40)
local submit = display.newImage("submit.png",w/2,h*0.9)
local name = native.newTextField(w/2,h*0.2,400,50)
local bday = native.newTextField(w/2,h*0.4,400,50)
name.inputType="default"
bday.inputType="default"
--Calculating function 
local function calc(event)
	--Modify the input to break up the information
	local bdayLen = string.len(bday.text)
	local birthYear = string.sub(bday.text, bdayLen-3, bdayLen)
	local birthMonth = string.sub(bday.text, 1,2)
	local birthDay = string.sub(bday.text, 4, 5)
	--Debugging
	print(birthYear)
	print(birthMonth)
	print(birthDay)
	--Clean up the old screen
	bday:removeSelf()
	name:removeSelf()
	text_bday:removeSelf()
	text_name:removeSelf()
	--Do all the math and display it
	local totalSecToday = (todaysDate.year * secInYear) + (todaysDate.month * secInMonth) + (todaysDate.day * secInDay)
	local totalSecBday = (birthYear * secInYear) + (birthMonth * secInMonth) + (birthDay * secInDay)
	local totalSecAlive = totalSecToday - totalSecBday
	local secAliveText = display.newText(name.text..", you have been Alive for :", w/2, 100, native.systemFont, 30)
	local secAlive = display.newText(totalSecAlive.." seconds", w/2, 200, native.systemFont, 30)
	local secAliveText2 = display.newText("and counting", w/2, 300, native.systemFont, 30)
end
--Exit keyboard function
local function keyboardListener (event)
	native.setKeyboardFocus(nil)
end
--Event listeners for exiting keyboard and for submit button
background:addEventListener("tap", keyboardListener)
submit:addEventListener("tap", calc)