--Ian Smelser
--5/2/16
--Battleship

local scene = composer.newScene()

function scene:create( event ) --Creates the screen objects
	local sceneGroup = self.view
	display.setDefault("background", 0,0,0)
	local button = display.newText("Menu",w*0.92,h*0.98,nil,40)
	button:setFillColor(0.8,0,0)
	sceneGroup:insert(button)
	button:addEventListener("tap",function() switchScene("mainMenu") end)
	Gphase="start"
	function RESTART( event )
		for i=1,#Particles do
			Particles[i]:removeSelf()
		end
		for i=1,8 do
			for x=1,8 do
				squares[i][x]:removeSelf()
			end
		end
		instructions:removeSelf()
		updateText:removeSelf()
		shipsPlaceCount:removeSelf()
		marker:removeSelf()
		Gphase="start"
		startGame()
	end
	function AI( mode )
		if (mode=="place") then
			local randX = math.random(1,8)
			local randY = math.random(1,8)
			for i=1,10 do
				local breaker=false
				while (breaker==false) do
					randX = randX+math.random(-1,1)
					randY = randY+math.random(-1,1)
					if (randX>8) then randX=randX-1 end
					if (randX<1) then randX=randX+1 end
					if (randY>8) then randY=randY-1 end
					if (randY<1) then randY=randY+1 end
					if (squares[randX][randY].name=="water") then
						breaker=true
					end
				end
				squares[randX][randY]:setFillColor(0,1,0)
				squares[randX][randY].name="enemy"
				enemyShipsLeft=enemyShipsLeft+1
			end
		elseif (mode=="attack") then
			local iterations = 0
			local randX = math.random(1,8)
			local randY = math.random(1,8)
			repeat
				randX = math.random(1,8)
				randY = math.random(1,8)
				if (iterations>1000) then
					return 0
				end
				iterations=iterations+1
			until (squares[randX][randY].name=="water") or (squares[randX][randY].name=="player")-- and (squares[randX][randY].name~="enemy")
			--print(squares[randX][randY].name)
			--print(randX..":"..randY)
			if (squares[randX][randY].name=="player") then
				playerShipsLeft=playerShipsLeft-1
				squares[randX][randY].name="hit"
				table.insert(Particles,#Particles+1,display.newImageRect("battleship/explosion-2.png",100,100))
				Particles[#Particles].x=squares[randX][randY].x
				Particles[#Particles].y=squares[randX][randY].y
				sceneGroup:insert(Particles[#Particles])
			elseif (squares[randX][randY].name=="water") then
				squares[randX][randY].name="splash"
				squares[randX][randY]:setFillColor(0.1,0.1,0.5)
			end
		end
		
	end
	function selectShips(event )
		print(enemyShipsLeft..":"..playerShipsLeft)
		if (Gphase=="playerPlace") then
			if (event.phase=="began") and (shipsPlaceCount.number>0) and (squares[event.target.nameX][event.target.nameY].name=="water") then
				--Place player ships
				squares[event.target.nameX][event.target.nameY]:setFillColor(0.5,0.5,0.5)
				squares[event.target.nameX][event.target.nameY].name="player"
				shipsPlaceCount.number=shipsPlaceCount.number-1
				shipsPlaceCount.text=shipsPlaceCount.number.." tiles left"
				playerShipsX[#playerShipsX+1]=event.target.nameX
				playerShipsY[#playerShipsY+1]=event.target.nameY
			end
			if (shipsPlaceCount.number==0) then
				--End placing phase
				playerShipsLeft=10
				Gphase="enemiesPlace"
				selectShips()
			end
			return 0
		end
		if (Gphase=="enemiesPlace") then
			instructions.text="Tap a tile to find enemy ships"
			shipsPlaceCount.text="10 enemy ships left"
			AI("place")
			shipsPlaceCount.number=-1
			Gphase="fightPhase"
			return 0
		end
		if (Gphase=="fightPhase") then
			if (event.phase=="began") and (shipsPlaceCount.number<=0) then
				if (squares[event.target.nameX][event.target.nameY].name=="water") or (squares[event.target.nameX][event.target.nameY].name=="enemy") then
					squares[event.target.nameX][event.target.nameY]:setFillColor(0.9,0.2,0.2)
					if (squares[event.target.nameX][event.target.nameY].name=="enemy") then
						squares[event.target.nameX][event.target.nameY].name="enemyHit"
						enemyShipsLeft=enemyShipsLeft-1
						updateText.alpha=1
						updateText.text="Enemy Ship Hit"
						table.insert(Particles,#Particles+1,display.newImageRect("battleship/explosion-2.png",100,100))
						Particles[#Particles].x=squares[event.target.nameX][event.target.nameY].x
						Particles[#Particles].y=squares[event.target.nameX][event.target.nameY].y
						sceneGroup:insert(Particles[#Particles])
					else
						squares[event.target.nameX][event.target.nameY].name="splash"
						updateText.text="Miss"
						updateText.alpha=1
						transition.to(updateText,{time=2000,alpha=0})
					end
					shipsPlaceCount.text=enemyShipsLeft.." enemies left"
					AI("attack")
				end
			end
		end
		if (playerShipsLeft==0) and (Gphase=="fightPhase") then
			Gphase="enemyWin"
			instructions.text="Enemy Wins!"
			shipsPlaceCount.text="Click Here to Restart"
			shipsPlaceCount:addEventListener("tap",RESTART)
		end
		if (enemyShipsLeft==0) and (Gphase=="fightPhase") then
			Gphase="playerWin"
			instructions.text="Player Wins!"
			shipsPlaceCount.text="Click Here to Restart"
			shipsPlaceCount:addEventListener("tap",RESTART)
		end

	end
	function startGame( event )
		if (Gphase=="start") then
			instructions = display.newText("Tap tiles to set your ships",w/2,h*0.03,nil,50)
			sceneGroup:insert(instructions)
			updateText = display.newText("",w/2,h*0.7,nil,60)
			sceneGroup:insert(updateText)
			shipsPlaceCount = display.newText("10 tiles left",w/2,h*0.1,nil,70)
			shipsPlaceCount.number = 10
			sceneGroup:insert(shipsPlaceCount)
			enemyShipsLeft=0
			playerShipsLeft=0
			Particles={}
			playerShipsX={}
			playerShipsY={}
			squares = {}
			for x=1,8 do
				squares[x]={}
				for y=1,8 do
					squares[x][y]=display.newRect(x*(w*0.11)+4,y*(w*0.11)+172,75,75)
					squares[x][y]:setFillColor(0.1,0.3,1)
					squares[x][y].name="water"
					squares[x][y].nameX=x
					squares[x][y].nameY=y
					squares[x][y]:addEventListener("touch",selectShips)
					sceneGroup:insert(squares[x][y])
				end
			end
			marker = display.newCircle(w/2,h*0.4,8)
			marker:setFillColor(1,0,0)
			sceneGroup:insert(marker)
			Gphase="playerPlace"
		end
	end
	startGame()
end
scene:addEventListener( "create", scene )
function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	display.setDefault("background", 0,0,0)
end
scene:addEventListener( "hide", scene )
return scene