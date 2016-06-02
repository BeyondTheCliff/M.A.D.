local composer = require( "composer" )
local scene = composer.newScene()
--loads composer and makes a new scene

local fingerPaint = require("DrawingApp.fingerPaint")
--enables the fingerPaint lua file (API)
local colorPicker = require("DrawingApp.colorPicker")
--enables the colorPicker lua file (API)
local widget = require("widget")
--enables the widget library

display.setStatusBar(display.HiddenStatusBar)
--hides the status bar

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local screenTop = display.screenOriginY
local screenLeft = display.screenOriginX
local screenBottom = display.screenOriginY+display.actualContentHeight
local screenRight = display.screenOriginX+display.actualContentWidth
local screenWidth = screenRight - screenLeft
local screenHeight = screenBottom - screenTop

-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view

    display.setDefault("background", 1, .85, .5)

    --[[local laxField = display.newImage("laxField.png", display.contentCenterX, display.contentCenterY *.95)
    sceneGroup:insert(laxField)
    laxField:scale(.7, .7)]]

    local canvas = fingerPaint.newCanvas(
	{
	--width: the width of your canvas. Defaults to the full screen width.
	--height: the height of your canvas. Defaults to the full screen height.
	strokeWidth = 20,
	canvasColor = {1, 1, 1, .001},
	paintColor = {0, 0, 0, 1}
	--segmented: a boolean (true/false) that, when set to true, results in paint strokes that are comprised of separate line object segments. USE WITH CAUTION: setting this value to true can substantially increase the memory usage of your app. Defaults to false.
	--x: the x coordinate where you want your canvas to be placed. Defaults to the horizontal center of the screen.
	--y: the y coordinate where you want your canvas to be placed. Defaults to the vertical center of the screen.
	--isActive: a boolean (true/false) that disables painting when set to false, and enables painting when set to true. Defaults to true.
	}
	)
    sceneGroup:insert(canvas)

    -- create UNDO button
    local undo = widget.newButton{
        label = "undo",
        width = 0,
        height = 0,
        fontSize = 40,
        onRelease = canvas.undo
    }
        undo.anchorX, undo.anchorY = 0, 1
        undo.x, undo.y = screenLeft + 40, screenBottom - 20
        sceneGroup:insert(undo)
    
    --create REDO button
    local redo = widget.newButton{
        label = "redo",
        width = 0,
        height = 0,
        fontSize = 40,
        onRelease = canvas.redo
    }
        redo.anchorX, redo.anchorY = 0, 1
        redo.x, redo.y = screenLeft + 150, screenBottom - 20
        sceneGroup:insert(redo)

    -- Initialize the scene here
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.

    local mainMenuButton = widget.newButton(
        {
        label = "Menu",
        width = 0,
        height = 0,
        fontSize = 40,
        onRelease = function() switchScene("mainMenu") end
        }
    )
    mainMenuButton.anchorX, mainMenuButton.anchorY = 0, 1
    mainMenuButton.x, mainMenuButton.y = display.contentWidth *.85, screenBottom - 20
    sceneGroup:insert(mainMenuButton)

    --local mainMenuButton = display.newText("Menu",display.contentWidth *.85,screenBottom - 20,nil,40)
    --mainMenuButton:addEventListener("tap",function() switchScene("mainMenu") end)

    -- create a button to change paint color & a function to handle the colorPicker selection
    local function changePaintColor(event)
        local function colorListener(r,g,b,a)
            canvas:setPaintColor(r,g,b,a)
        end
    
        colorPicker.show(colorListener, canvas.paintR, canvas.paintG, canvas.paintB, canvas.paintA)
    end
    
    local changePaintButton = widget.newButton{
        label = "change paint color",
        width = 0,
        height = 0,
        fontSize = 40,
        onRelease = changePaintColor
    }
        changePaintButton.anchorX, changePaintButton.anchorY = 1, 1
        changePaintButton.x, changePaintButton.y = screenRight - display.contentWidth*.23, screenBottom - 20
        sceneGroup:insert(changePaintButton)
    end


    -- "scene:show()"
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
    display.setDefault("background", 0,0,0)
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view
    -- Insert code here to clean up the scene
    -- Example: remove display objects, save state, etc.
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene