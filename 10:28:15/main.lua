--Ian Smelser
--10/28/15
--Assignment 4-1
--Tip Calc
per={}
local instructions = display.newText("Enter Your Subtotal:",200,100,nil,30)
local numF = native.newTextField(480,100,270,50)
per[1] = display.newText("5%",display.contentWidth*0.2,200,nil,50)
per[2] = display.newText("10%",display.contentWidth*0.4,200,nil,50)
per[3] = display.newText("15%",display.contentWidth*0.6,200,nil,50)
per[4] = display.newText("20%",display.contentWidth*0.8,200,nil,50)
per[1]:setFillColor(1,1,1);per[2]:setFillColor(1,1,1);per[3]:setFillColor(1,1,1);per[4]:setFillColor(1,1,1);
per[1].id=1;per[2].id=2;per[3].id=3;per[4].id=4;
old=nil

local function perC(event)
	local tar = event.target.id
	per[tar]:setFillColor(1,0.2,0.2)

end
for i=1,4 do
	print(i)
	per[i]:addEventListener("tap",perC)
end