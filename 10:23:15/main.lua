--Ian Smelser
--10/23/15
--Assignment 4-1

--Declaring Vars, texts, and text fields 
arr={}
local w = display.contentWidth
local h = display.contentHeight
local background = display.newImage("bkgrd.png", 0, 0)
local submit = display.newImage("submit.png",w/2+200,h*0.1)
local text = native.newTextField(w/2-100,h*0.1,300,50)
text.inputType="default"


--First destroys any old text, then sets the new text using the length of the string
local function _display(event)
	if (arr[1]~=nil) then --Only runs if there is already a array set
		for i=1,table.getn(arr) do
			print("Removing-"..i..":"..arr[i].text)
			arr[i]:removeSelf()
		end
	end
	print("Running")
	for i=1,string.len(text.text) do --Runs for the same length of the string
		local char = string.sub(text.text,i,i)
		local _height = i*75+150
		print(i..":"..char)
		arr[i]=display.newText(char,w/2,_height)
		arr[i].alpha=0
	end
	for i=1,string.len(text.text) do
		print("fading:"..i)
		transition.to(arr[i],{time=i*1000,alpha=1})
	end
end

local function keyboardListener (event) --Hides the keyboard when the background is tapped
	native.setKeyboardFocus(nil)
end
--Event listeners to tie it all together
background:addEventListener("tap", keyboardListener)
submit:addEventListener("tap",_display)
