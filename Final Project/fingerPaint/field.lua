local scene = composer.newScene()
--loads composer and makes a new scene

local fingerPaint = require("fingerPaint.fingerPaint")
--enables the fingerPaint lua file

display.setStatusBar(display.HiddenStatusBar)
--hides the status bar

-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view

    local laxField = display.newImage("laxField.png", display.contentCenterX, display.contentCenterY)

    local canvas = fingerPaint.newCanvas(
	{
	--width: the width of your canvas. Defaults to the full screen width.
	--height: the height of your canvas. Defaults to the full screen height.
	--strokeWidth: the width of your fingerpainting "strokes," or the lines that the user draws. Defaults to 10 pixels.
	canvasColor = {0, 0, 0, 0.001},
	paintColor = {1, 0, 0, 1},
	--segmented: a boolean (true/false) that, when set to true, results in paint strokes that are comprised of separate line object segments. USE WITH CAUTION: setting this value to true can substantially increase the memory usage of your app. Defaults to false.
	--x: the x coordinate where you want your canvas to be placed. Defaults to the horizontal center of the screen.
	--y: the y coordinate where you want your canvas to be placed. Defaults to the vertical center of the screen.
	--isActive: a boolean (true/false) that disables painting when set to false, and enables painting when set to true. Defaults to true.
	}
	)
	sceneGroup:insert(canvas)


    -- Initialize the scene here
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
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


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene