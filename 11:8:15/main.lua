--Ian Smelser
--11/8/15
--Test main.lua

require("script")

function move( event)
	print(Gbutton.x)
	print("pi")
end
GoodButtons(1,500,200,150,100,testEvent,{0.2,0.1,0.9},true)
Gbutton[1]:addEventListener("tap",move)


