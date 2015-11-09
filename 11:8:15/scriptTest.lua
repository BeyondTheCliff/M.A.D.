--Ian Smelser
--11/8/15
--Buttons and API

function testEvent(  )
	print("testEvent triggered")
end
function GoodButtons( num,x,y,width,height,Tevent,Ccolors )
	if (Tevent==nil) then
		Tevent=testEvent
	end
	local function GoodButtons_click( event )
		local name = event.target.name
		local Ccolors=event.target.Ccolors
		if (event.phase=="began" and name~=nil) then
			Gbutton[name]:setFillColor(Ccolors[1]-0.1,Ccolors[2]-0.1,Ccolors[3]-0.1)
			return true
		elseif (event.phase=="ended") then
			Gbutton[name]:setFillColor(Ccolors[1]+0.1,Ccolors[2]+0.1,Ccolors[3]+0.1)
			return true
		else
			print("fail")
		end
	end
	if (Gbutton==nil) then
		Gbutton={}
	end
	if (Gbutton[num]==nil) then
		Gbutton[num] = display.newRoundedRect(x,y,width,height,10)
		Gbutton[num].name=1
		Gbutton[num]:setFillColor(Ccolors[1],Ccolors[2],Ccolors[3])
		Gbutton[num].strokeWidth=2
		Gbutton[num]:setStrokeColor(1,1,1)
		Gbutton[num]:addEventListener("touch",GoodButtons_click)
		Gbutton[num]:addEventListener("tap",Tevent)
		Gbutton[num].name=num
		Gbutton[num].Ccolors=Ccolors
		Gbutton[num].numX=0
		print(num..":1:"..Gbutton[num].Ccolors[1])
		print(num..":2:"..Gbutton[num].Ccolors[2])
		print(num..":3:"..Gbutton[num].Ccolors[3])
	end
end
function toggle( event,pass )
	print(pass)
	local target = event.target.name
	local colors = event.target.Ccolors
	local numX = event.target.numX
	if (numX==0) then
		Gbutton[target]:setStrokeColor(1,0,0)
		Gbutton[target].numX=1
		print("Toggle On")
	else
		Gbutton[target]:setStrokeColor(1,1,1)
		Gbutton[target].numX=0
		print("Toggle Off")
	end
end