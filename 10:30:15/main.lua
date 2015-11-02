--Ian S
--10/30/15
--font tests

local submit = display.newImage("submit.png",display.contentCenterX,500)
findings = display.newText("Hello",display.contentCenterX,350,nil,50)
state=1

function create( text,font )
	print(text)
	print(font)
	findings:removeSelf()
	findings = display.newText(text,display.contentCenterX,350,font,50)
end

function click( event )
	print("pi")
	print(state)
	if (state==1) then
		create("HelloA","AmericanTypewriter")
		state=0
	else
		create("Hello",nil)
		state=1
	end
end
submit:addEventListener("tap",click)