-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------


local composer = require( "composer" )
local scene = composer.newScene()
function scene:create( event ) --Creates the splash screen objects
	local sceneGroup = self.view
	local bg = display.newRect(0,0,w,h)
	bg.anchorX,bg.anchorY=0,0
	bg:setFillColor(0.1,0.9,0.1)
	sceneGroup:insert(bg)--Adds object to the group
	local button = display.newText("Test Game",w/2,h*0.5,"AmericanTypewriter",100)
	sceneGroup:insert(button)
	button:addEventListener("tap",function() switchScene("mainMenu") end)
	bg:addEventListener("tap",function() switchScene("mainMenu") end)

	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)

	background:setFillColor(0,0,0)
	
	local topLine= display.newRect(w/2, h*0.35, 630, 20)
	
	local bottomLine= display.newRect(w/2, h*0.5, 630, 20)
	
	local leftLine= display.newRect(w*0.35, h*0.43, 20, 600)
	
	local rightLine= display.newRect(w*0.65, h*0.43, 20, 600)
	
	
	local playerX= display.newText("Player X: 0", w*0.2, h*0.9, nil, 40)
	
	local playerO= display.newText("Player O: 0", w*0.5, h*0.9, nil, 40)
	
	
	playerX.score = 0
	
	playerO.score = 0
	
	winCon=false
	
	local playerTurn = "x" 
	
	local topLeft = display.newRect(display.contentWidth*0.24, display.contentHeight*.29, 150, 150)
	topLeft.alpha=0.1
	topLeft.name="open"
	local topCenter = display.newRect(display.contentWidth/2, display.contentHeight*.29, 200, 150)
	topCenter.alpha=0.1
	topCenter.name="open"
	local topRight = display.newRect(display.contentWidth*.79, display.contentHeight*.29, 170, 150)
	topRight.alpha=0.1
	topRight.name="open"
	local midLeft = display.newRect(display.contentWidth*.2, display.contentHeight*.42, 90, 90)
	midLeft.alpha=0.1
	midLeft.name="open"
	local midCenter = display.newRect(display.contentWidth/2, display.contentHeight*.42, 170, 170)
	midCenter.alpha=0.1
	midCenter.name="open"
	local midRight = display.newRect(display.contentWidth*.83, display.contentHeight*.42, 90, 90)
	midRight.alpha=0.1
	midRight.name="open"
	local bottomLeft = display.newRect(display.contentWidth*.2, display.contentHeight*.63, 90, 90)
	bottomLeft.alpha=0.1
	bottomLeft.name="open"
	local bottomCenter = display.newRect(display.contentWidth/2, display.contentHeight*.63, 90, 90)
	bottomCenter.alpha=0.1
	bottomCenter.name="open"
	local bottomRight = display.newRect(display.contentWidth*.83, display.contentHeight*.63, 90, 90)
	bottomRight.alpha=0.1
	bottomRight.name="open"
	
	placedObjects = {}
	
	local function playerTurns( event )
		if event.x<110 and event.x>0 then Xpos=display.contentWidth*.2 end
		if event.x<210 and event.x>110 then Xpos=display.contentWidth/2 end
		if event.x<display.contentWidth and event.x>210 then Xpos=display.contentWidth*.8 end
		if event.y<150 and event.y>0 then Ypos=100 end
		if event.y<250 and event.y>150 then Ypos=200 end
		if event.y<display.contentHeight and event.y>250 then Ypos=300 end
		if (event.target.name=="open") then
			if playerTurn == "x" then
				placedObjects[#placedObjects+1]=display.newText("X", Xpos, Ypos, nil, 90) 
				playerTurn = "O"
				event.target.name="X"
				
			else 
				placedObjects[#placedObjects+1]=display.newText("O", Xpos, Ypos, nil, 90)
				playerTurn = "x"
				event.target.name="O"
			end	
		end
		if (topLeft.name=="X") and (topCenter.name=="X") and (topRight.name=="X") and (winCon==false) then
			playerX.score = playerX.score+1
			playerX.text="Player X: "..playerX.score
			winCon=true
		end
	
		if (midLeft.name=="X") and (midCenter.name=="X") and (midRight.name=="X") and (winCon==false) then
			playerX.score = playerX.score+1
			playerX.text="Player X: "..playerX.score
			winCon=true
	
		end	
	
		if (bottomLeft.name=="X") and (bottomCenter.name=="X") and (bottomRight.name=="X") and (winCon==false) then
			playerX.score = playerX.score+1
			playerX.text="Player X: "..playerX.score
			winCon=true	
	
		end
	
	
		if (topLeft.name=="X") and (midLeft.name=="X") and (bottomLeft.name=="X") and (winCon==false) then
			playerX.score = playerX.score+1
			playerX.text="Player X: "..playerX.score
			winCon=true	
	
		end
	
		if (topCenter.name=="X") and (midCenter.name=="X") and (bottomCenter.name=="X") and (winCon==false) then
			playerX.score = playerX.score+1
			playerX.text="Player X: "..playerX.score
			winCon=true	
	
		end
	
		if (topRight.name=="X") and (midRight.name=="X") and (bottomRight.name=="X") and (winCon==false) then
			playerX.score = playerX.score+1
			playerX.text="Player X: "..playerX.score
			winCon=true	
	
		end
	
		if (topLeft.name=="X") and (midCenter.name=="X") and (bottomRight.name=="X") and (winCon==false) then
			playerX.score = playerX.score+1
			playerX.text="Player X: "..playerX.score
			winCon=true	
	
		end
	
		if (topRight.name=="X") and (midCenter.name=="X") and (bottomLeft.name=="X") and (winCon==false) then
			playerX.score = playerX.score+1
			playerX.text="Player X: "..playerX.score
			winCon=true	
	
		end
	
		if (topLeft.name=="O") and (topCenter.name=="O") and (topRight.name=="O") and (winCon==false) then
			playerO.score = playerO.score+1
			playerO.text="Player O: "..playerO.score
			winCon=true		
	
		end
	
		if (midLeft.name=="O") and (midCenter.name=="O") and (midRight.name=="O") and (winCon==false) then
			playerO.score = playerO.score+1
			playerO.text="Player O: "..playerO.score
			winCon=true			
	
		end
	
		if (bottomLeft.name=="O") and (bottomCenter.name=="O") and (bottomRight.name=="O") and (winCon==false) then
			playerO.score = playerO.score+1
			playerO.text="Player O: "..playerO.score
			winCon=true				
	
		end
	
		if (topLeft.name=="O") and (midLeft.name=="O") and (bottomLeft.name=="O") and (winCon==false) then
			playerO.score = playerO.score+1
			playerO.text="Player O: "..playerO.score
			winCon=true				
	
		end
	
		if (topCenter.name=="O") and (midCenter.name=="O") and (bottomCenter.name=="O") and (winCon==false) then
			playerO.score = playerO.score+1
			playerO.text="Player O: "..playerO.score
			winCon=true			
	
		end
	
		if (topRight.name=="O") and (midRight.name=="O") and (bottomRight.name=="O") and (winCon==false) then
			playerO.score = playerO.score+1
			playerO.text="Player O: "..playerO.score
			winCon=true			
	
		end
	
		if (topLeft.name=="O") and (midCenter.name=="O") and (bottomRight.name=="O") and (winCon==false) then
			playerO.score = playerO.score+1
			playerO.text="Player O: "..playerO.score
			winCon=true			
	
		end
	
		if (topRight.name=="O") and (midCenter.name=="O") and (bottomLeft.name=="O") and (winCon==false) then
			playerO.score = playerO.score+1
			playerO.text="Player O: "..playerO.score
			winCon=true		
	
		end
	
	
		
	end
	
	topLeft:addEventListener("tap", playerTurns)
	
	topCenter:addEventListener("tap", playerTurns)
	
	topRight:addEventListener("tap", playerTurns)
	
	midLeft:addEventListener("tap", playerTurns)
	
	midCenter:addEventListener("tap", playerTurns)
	
	midRight:addEventListener("tap", playerTurns)
	
	bottomLeft:addEventListener("tap", playerTurns)
	
	bottomCenter:addEventListener("tap", playerTurns)
	
	bottomRight:addEventListener("tap", playerTurns)
	
	local function reset( event )
	
		if (placedObjects[1]==nil) then
			return 0
		end
		if (placedObjects[1]~=nil) then
			print(placedObjects[1])
			for i=1,#placedObjects do
				print(i)
				placedObjects[i]:removeSelf()
				placedObjects[i]=nil
			end
			topLeft.name="open"
			topCenter.name="open"
			topRight.name="open"
			midLeft.name="open"
			midCenter.name="open"
			midRight.name="open"
			bottomLeft.name="open"
			bottomCenter.name="open"
			bottomRight.name="open"
			winCon=false
		end
	end
	
	
	local resetText = display.newText("Reset", display.contentWidth/2, h*0.8, nil, 50)
	resetText:setFillColor(1,0,0)
	
	resetText:addEventListener("tap", reset)
end
scene:addEventListener( "create", scene )
return scene