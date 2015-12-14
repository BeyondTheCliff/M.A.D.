--Ian Smelser
--11/16/15
--Slow type

function slowType( x,y,text,event )
	local NewDisplay = display.newText("",x,y,"AmericanTypewriter",60)
	NewDisplay.anchorX=0
	local i = 1
	print(string.len(text))
	local function Output( event )
		
		if (i<string.len(text)+1) then
			local char = string.sub(text,i,i)
			print(i.." "..char)
			NewDisplay.text=NewDisplay.text..char
		else
			print("fail")
		end
		i=i+1
	end
	timer.performWithDelay(250,Output,string.len(text))
end

slowType(200,200,"Hello World!")