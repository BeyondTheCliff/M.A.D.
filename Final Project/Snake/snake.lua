local composer = require( "composer" )
local scene = composer.newScene()
--loads composer and makes a new scene
-------------------------------------------------------------------
local widget = require("widget")
--enables the widget library
-------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)
--hides the status bar
-------------------------------------------------------------------
---------------------Variables for direction-----------------------
-------------------------------------------------------------------
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local screenTop = display.screenOriginY
local screenLeft = display.screenOriginX
local screenBottom = display.screenOriginY+display.actualContentHeight
local screenRight = display.screenOriginX+display.actualContentWidth
local screenWidth = screenRight - screenLeft
local screenHeight = screenBottom - screenTop
-------------------------------------------------------------------
-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view
-------------------------------------------------------------------
    display.setDefault("background", 0.2,0.81,0.24,1.00 )
-------------------------------------------------------------------
    function movePlayer(e)
        dir = e.target.name
         
        if(started == nil) then
            timerSrc = timer.performWithDelay(speed, update, 0)
            started = true
        end


        if(dir == 'up') then
            head.y = head.y - mConst
         
            headHitArea.x = headGFX.x
            headHitArea.y = headGFX.y - 7
        elseif(dir == 'left') then
            head.x = head.x - mConst
         
            headHitArea.x = headGFX.x - 8
            headHitArea.y = headGFX.y
        elseif(dir == 'down') then
            head.y = head.y + mConst
         
            headHitArea.x = headGFX.x
            headHitArea.y = headGFX.y + 8
        elseif(dir == 'right') then
            head.x = head.x + mConst
         
            headHitArea.x = headGFX.x + 7
            headHitArea.y = headGFX.y
        end
    end
-------------------------------------------------------------------
-----Widgets for direction buttons---------------------------------
-------------------------------------------------------------------
    local upButton = widget.newButton(
        {shape = "rectangle",
        width = display.contentWidth,
        height = display.contentHeight*.15,
        x = display.contentWidth *.5,
        y = display.contentHeight*.55,
        fillColor = {default = {1,1,0,0.1 }, over = {0.4,0.22,0.09,0.1}},
        onRelease = gameListeners
        }
    )
    sceneGroup:insert(upButton)
    upButton.name = "up"

    local downButton = widget.newButton(
        {shape = "rectangle",
        width = display.contentWidth,
        height = display.contentHeight*.25,
        x = display.contentCenterX,
        y = display.contentHeight,
        fillColor = {default = {1,1,0,0.1 }, over = {0.4,0.22,0.09,0.1}},
        onRelease = gameListeners
        }
    )
    sceneGroup:insert(downButton)
    downButton.name = "down"

    local leftButton = widget.newButton(
        {shape = "rectangle",
        width = display.contentWidth *.5,
        height = display.contentHeight*.25,
        x = display.contentWidth*.25,
        y = display.contentHeight*.75,
        fillColor = {default = {1,1,0,0.1 }, over = {0.4,0.22,0.09,0.1}},
        onRelease = gameListeners
        }
    )
    sceneGroup:insert(leftButton)
    leftButton.name = "left"

    local rightButton = widget.newButton(
        {shape = "rectangle",
        width = display.contentWidth/2,
        height = display.contentHeight*.25,
        x = display.contentWidth*.75,
        y = display.contentHeight*.75,
        fillColor = {default = {1,1,0,0.1 }, over = {0.4,0.22,0.09,0.1}},
        onRelease = gameListeners
        }
    )
    sceneGroup:insert(rightButton)
    rightButton.name = "right"
-------------------------------------------------------------------
-------------------Main Menu Button--------------------------------
-------------------------------------------------------------------
    local mainMenuButton = widget.newButton(
        {
        label = "Menu",
        width = 0,
        height = 0,
        fontSize = 40,
        onRelease = composer.gotoScene("mainMenu")
        }
    )
    mainMenuButton.anchorX, mainMenuButton.anchorY = 0, 1
    mainMenuButton.x, mainMenuButton.y = display.contentWidth *.85, screenBottom - 20
    sceneGroup:insert(mainMenuButton)
-------------------------------------------------------------------

    score = display.newText("0", display.contentWidth*.1, display.contentHeight*.05, native.systemFontBold, 50)
    score:setFillColor(0.5, 1, 0)
    sceneGroup:insert(score)
-------------------------------------------------------------------
    local headGFX = display.newRect(display.contentCenterX, display.contentCenterY, 75, 35)
    headGFX:setFillColor(0, 1, 0)
    sceneGroup:insert(headGFX)
    local headHitArea = display.newLine(display.contentCenterX+5, display.contentCenterY-0.2, display.contentCenterX -5, display.contentCenterY-0.2)
    headHitArea:setStrokeColor(1, 0, 0)
    headHitArea.strokeWidth = 10
    sceneGroup:insert(headHitArea)
    head = display.newGroup(headGFX, headHitArea)
    sceneGroup:insert(head)
    lastPart = head
    parts = display.newGroup()
    sceneGroup:insert(parts)

    local part = display.newImage("part.png")
    part:setFillColor(1, 1, 0)
    sceneGroup:insert(part)
-------------------------------------------------------------------

    local randomX = 25 + math.floor(math.random() * 750)
    local randomY = 25 + math.floor(math.random() * 1334)
         
    local apple = display.newImage('apple.png', randomX, randomY)
    apples = display.newGroup(apple)
    sceneGroup:insert(apples)
    transition.scaleTo( apple, { xScale=.5, yScale=.5, time=1000 } )
-------------------------------------------------------------------
    function gameListeners()
        upButton:addEventListener('tap', movePlayer)
        leftButton:addEventListener('tap', movePlayer)
        downButton:addEventListener('tap', movePlayer)
        rightButton:addEventListener('tap', movePlayer)
    end
-------------------------------------------------------------------
    function hitTestObjects(obj1, obj2)
        local leftButton = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
        local rightButton = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
        local upButton = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
        local downButton = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax
        return (leftButton or rightButton) and (upButton or downButton)
    end
-------------------------------------------------------------------
    function update()
     
        -- Capture head last position, this moves the first added piece
     
        local lastX = head.x
        local lastY = head.y
     
        local xPos = {}
        local yPos = {}



        for i = 1, parts.numChildren do
            -- Capture parts position to move them
     
            xPos[i] = parts[i].x
            yPos[i] = parts[i].y
     
        -- Move Parts
     
            if(parts[i-1] == nil) then
                parts[i].x = lastX
                parts[i].y = lastY
            else
                parts[i].x = xPos[i-1]
                parts[i].y = yPos[i-1]
            end
    
-------------------------------------------------------------------
    -- Game over if head touches other part of snake
         
        if(hitTestObjects(headHitArea, parts[i])) then
            print(parts[i].name)
            if(parts[i].name == '1') then
                print('one')
            else
                timer.cancel(timerSrc)
                timerSrc = nil
                --audio.play(gameOver)
            end
        end
-------------------------------------------------------------------

        -- Move Head & Hit Area
 


    -- Detect apple-player collision
 
        for i = 1, apples.numChildren do
            if(hitTestObjects(head, apples[i])) then
        -- Remove Apple         
            display.remove(apples[i])


    -- Move Parts
     
    if(parts[i-1] == nil) then
        parts[i].x = lastX
        parts[i].y = lastY
    else
        parts[i].x = xPos[i-1]
        parts[i].y = yPos[i-1]
    end
        -- Add Score

    score.text = score.text + tostring(10)
    score:setReferencePoint(display.TopLeftReferencePoint)
    score.x = 10
    --audio.play(appleGrab)

    -- Add snake body

    
 

        current = current + 1
        part.name = tostring(current)
        lastPart = part
        parts:insert(part)

      -- Add new apple
       
        local randomX = 25 + math.floor(math.random() * 750)
        local randomY = 25 + math.floor(math.random() * 1334)
   
      local apple = display.newImage('apple.png', randomX, randomY)
      apples = display.newGroup(apple)
      sceneGroup:insert(apple)
end
end
end
end
end -- ends the scene:create


  --[[ "scene:show()"
    function scene:show( event )

        local sceneGroup = self.view
        local phase = event.phase

        if ( phase == "will" ) then
            -- Called when the scene is still off screen (but is about to come on screen)
        elseif ( phase == "did" ) then
            -- Called when the scene is now on screen
            -- Insert code here to make the scene come alive
            -- Example: start timers, begin animation, play audio, etc.
        end
    end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen)
        -- Insert code here to "pause" the scene
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view
    -- Insert code here to clean up the scene
    -- Example: remove display objects, save state, etc.
end
]]

-- -------------------------------------------------------------------------------


------------------------

-- Listener setup
scene:addEventListener( "create", scene )
--[[scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )]]

-- -------------------------------------------------------------------------------

return scene