--Ian Smelser
--10/28/15
--Assignment 4-1
--Tip Calc

--Load images and texts, then formating 
local background = display.newImage("bkgrd.png", 0, 0)
local instructions_1 = display.newText("Enter Your Subtotal:",display.contentWidth*0.45,100,nil,30)
local instructions_2 = display.newText("Enter Your Tip %:",display.contentWidth*0.45,180,nil,30)
local submit = display.newImage("submit.png",display.contentCenterX,display.contentHeight-100)
local inputP = native.newTextField(display.contentWidth*0.73,100,display.contentWidth*0.5,50) --Subtotal
local inputT = native.newTextField(display.contentWidth*0.73,180,display.contentWidth*0.5,50) --Tip %
inputP.inputType=("number")
inputT.inputType=("number")
instructions_1.anchorX=1
instructions_2.anchorX=1
end_text1=nil
end_text2=nil
end_text3=nil
submit:scale(2,2)

local function keyboardListener (event) --Hides the keyboard when the background is tapped
	native.setKeyboardFocus(nil)
end
background:addEventListener("tap", keyboardListener)

--Calculating function which can be used multiple times
local function calc(event)
	if (end_text1~=nil or end_text2~=nil or end_text3~=nil) then
		end_text1:removeSelf()
		end_text2:removeSelf()
		end_text3:removeSelf()
	end
	local subtotal = inputP.text
	local tip = inputT.text
	local total = ((tip/100)*subtotal)+subtotal
	subtotal=string.format( "Subtotal: $%3.2f", subtotal )
	tip=string.format( "Tip: $%3.2f", tip )
	total=string.format( "Total: $%3.2f", total )
	print(total)
	end_text1 = display.newText(subtotal,50,500,nil,40) --Display subtotal
	end_text1.anchorX = 0
	end_text2 = display.newText(tip,50,560,nil,40) --Display tip
	end_text2.anchorX = 0
	end_text3 = display.newText(total,50,620,nil,40) --Display tip
	end_text3.anchorX = 0
end
submit:addEventListener("tap",calc)