--Ian Smelser
--5/2/16
--Battleship

local scene = composer.newScene()

function scene:create( event ) --Creates the splash screen objects
	local sceneGroup = self.view
	local button = display.newText("Main Menu",w*0.15,h*0.98,nil,40)
	button:setFillColor(0.8,0,0)
	sceneGroup:insert(button)
	button:addEventListener("tap",function() switchScene("mainMenu") end)
	Gphase="start"
	local function AI( var )
		if (var=="place") then
			local randX = math.random(1,8)
			local randY = math.random(1,8)
			while (squares[randX][randY].name~="water") do
				randX = math.random(1,8)
				randY = math.random(1,8)
			end
			squares[randX][randY]:setFillColor(0,1,0)
			squares[randX][randY].name="enemy"
			enemyShipsLeft=enemyShipsLeft+1
		elseif (var=="attack") then
			local iterations = 0
			local randX = math.random(1,8)
			local randY = math.random(1,8)
			repeat
				print(squares[randX][randY].name)
				randX = math.random(1,8)
				randY = math.random(1,8)
				if (iterations>1000) then
					return 0
				end
				iterations=iterations+1
			until (squares[randX][randY].name~="water") or (squares[randX][randY].name~="player")
			print(randX..":"..randY)
			squares[randX][randY]:setFillColor(0.1,0.1,0.5)
		end
		
	end
	local function selectShips(event )
		if (Gphase=="playerPlace") then
			if (event.phase=="began") and (shipsPlaceCount.number>0) and (squares[event.target.nameX][event.target.nameY].name=="water") then
				--Place player ships
				squares[event.target.nameX][event.target.nameY]:setFillColor(0.5,0.5,0.5)
				squares[event.target.nameX][event.target.nameY].name="player"
				shipsPlaceCount.number=shipsPlaceCount.number-1
				shipsPlaceCount.text=shipsPlaceCount.number.." tiles left"
			end
			if (shipsPlaceCount.number==0) then
				--End placing phase
				Gphase="enemiesPlace"
				selectShips()
			end
			return 0
		end
		if (Gphase=="enemiesPlace") then
			instructions.text="Tap a tile to find enemy ships"
			shipsPlaceCount.text="10 enemy ships left"
			for i=1,10 do
				AI("place")
			end
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
			if (playerShipsLeft==0) then
				Gphase="enemyWin"
				instructions.text="Enemy Wins!"
			end
			return 0
		end
		if (enemyShipsLeft==0) then
			Gphase="playerWin"
			instructions.text="Player Wins!"
		end

	end
	local function startGame( event )
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
			local marker = display.newRect(w/2,h*0.4,10,10)
			marker:setFillColor(1,0,0)
			sceneGroup:insert(marker)
			Gphase="playerPlace"
		end
	end
	startGame()
end
scene:addEventListener( "create", scene )
return scene