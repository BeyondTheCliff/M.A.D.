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



    system.activate( "multitouch" )
    local physics = require( "physics" )
    --local spring = require("spring")
    --local pinballTableObjects = require("pinballtableobjects")
    --local gameAudio = require("gameaudio")
    physics.setDrawMode ("hybrid")
    
    physics.start(true)
    physics.setGravity(0, 9.8 * 2) 
    
    local topLeft = {
        x = (display.contentWidth - display.viewableContentWidth) / 2, 
        y = (display.contentHeight - display.viewableContentHeight) / 2}
        
    local bottomRight = {
        x = topLeft.x + display.viewableContentWidth, 
        y = topLeft.y + display.viewableContentHeight}
        
    
    local center = (display.contentWidth/2)
    
    local ballProp = {}
    local ballRadius = 20
    
    local launchWidthBuffer = 5
    local borderWidth = 25
    
    local scoreText
    local splashGroup
    local machineBackground 
    local splashBackground
    local background = display.newImage( "background.fw.png", display.contentWidth/2, display.contentHeight/2)
    
    
    local number = 0
    local number2 = 3
    local score = display.newText ("SCORE:"..number, display.contentCenterX*1.25, display.contentCenterY*.5, nil)
    local lives = display.newText ("LIVES:"..number2, display.contentCenterX*.55, display.contentCenterY*.5, nil)
    
    
    
    
    local backgroundA = display.newRect(0,0,1800,3000)
    backgroundA:setFillColor(0.7,.1,0,0.5)
    local Music = audio.loadStream( "Blackhole-Absolutia.mp3" )
    local function playSong( event )
        Song = audio.play( Music, { channel=1, loops=-1 } ) -- plays the song and displays the pause button
    end
    backgroundA:addEventListener("tap", playSong)
    
    --local block = display.newCircle(243,459,10)
    --local block1 = display.newCircle(251,466,10)
    --local block2 = display.newCircle(250,470,10)
    --local block3 = display.newCircle(255,475,10)
    --local block4 = display.newCircle(220,480,10)
    --local block5 = display.newCircle(220,485,10)
    local block6 = display.newCircle(280,395,35)
    physics.addBody(block6, "static", {radius = 35, bounce = 20})
    local block7 = display.newCircle(410,400,35)
    physics.addBody(block7, "static", {radius = 35, bounce = 20})
    local block8 = display.newCircle(440,500,35)
    physics.addBody(block8, "static", {radius = 35, bounce = 20})
    local block9 = display.newCircle(340,560,35)
    physics.addBody(block9, "static", {radius = 35, bounce = 20})
    local block10 = display.newCircle(250,510,35)
    physics.addBody(block10, "static", {radius = 35, bounce = 20})
    local a1block = display.newCircle(53,800,15)
    physics.addBody(a1block, "static", {radius = 15})
    local a1block1 = display.newCircle(59,770,15)
    physics.addBody(a1block1, "static", {radius = 15})
    local a1block2 = display.newCircle(49,830,15)
    physics.addBody(a1block2, "static", {radius = 15})
    local a1block3 = display.newCircle(43,859,15)
    physics.addBody(a1block3, "static", {radius = 15})
    local a1block4 = display.newCircle(40,880,15)
    physics.addBody(a1block4, "static", {radius = 15})
    local a1block5 = display.newCircle(90,1015,15)
    physics.addBody(a1block5, "static", {radius = 15})
    local a1block6 = display.newCircle(75,999,15)
    physics.addBody(a1block6, "static", {radius = 15})
    local a1block7 = display.newCircle(60,985,15)
    physics.addBody(a1block7, "static", {radius = 15})
    local a1block8 = display.newCircle(40,965,15)
    physics.addBody(a1block8, "static", {radius = 15})
    local a1block9 = display.newCircle(30,950,15)
    physics.addBody(a1block9, "static", {radius = 15})
    local a1block10 = display.newCircle(30,935,15)
    physics.addBody(a1block10, "static", {radius = 15})
    local a2block = display.newCircle(33,930,15)
    physics.addBody(a2block, "static", {radius = 15})
    local a2block1 = display.newCircle(31,925,15)
    physics.addBody(a2block1, "static", {radius = 15})
    local a2block2 = display.newCircle(30,900,15)
    physics.addBody(a2block2, "static", {radius = 15})
    local a2block3 = display.newCircle(570,1015,20)
    physics.addBody(a2block3, "static", {radius = 15})
    local a2block4 = display.newCircle(590,999,15)
    physics.addBody(a2block4, "static", {radius = 15})
    local a2block5 = display.newCircle(610,985,15)
    physics.addBody(a2block5, "static", {radius = 15})
    local a2block6 = display.newCircle(630,965,15)
    physics.addBody(a2block6, "static", {radius = 15})
    local a2block7 = display.newCircle(645,950,15)
    physics.addBody(a2block7, "static", {radius = 15})
    local a2block8 = display.newCircle(620,770,15)
    physics.addBody(a2block8, "static", {radius = 15})
    local a2block9 = display.newCircle(625,800,15)
    physics.addBody(a2block9, "static", {radius = 15})
    local a2block10 = display.newCircle(630,830,15)
    physics.addBody(a2block10, "static", {radius = 15})
    local a3block = display.newCircle(635,859,15)
    physics.addBody(a3block, "static", {radius = 15})
    local a3block1 = display.newCircle(640,880,15)
    physics.addBody(a3block1, "static", {radius = 15})
    local a3block2 = display.newCircle(645,900,15)
    physics.addBody(a3block2, "static", {radius = 15})
    local a3block3 = display.newCircle(480,935,20)
    physics.addBody(a3block3, "static", {radius = 15})
    local a3block4 = display.newCircle(500,920,25)
    physics.addBody(a3block4, "static", {radius = 15})
    local a3block5 = display.newCircle(650,925,15)
    physics.addBody(a3block5, "static", {radius = 15})
    local a3block6 = display.newCircle(520,780,20)
    physics.addBody(a3block6, "static", {radius = 15})
    local a3block7 = display.newCircle(520,805,20)
    physics.addBody(a3block7, "static", {radius = 15})
    local a3block8 = display.newCircle(520,840,28)
    physics.addBody(a3block8, "static", {radius = 28})
    local a3block9 = display.newCircle(520,875,35)
    physics.addBody(a3block9, "static", {radius = 35})
    local a3block10 = display.newCircle(190,935,20)
    physics.addBody(a3block10, "static", {radius = 20})
    local block11 = display.newCircle(172,920,25)
    physics.addBody(block11, "static", {radius = 25})
    local block12 = display.newCircle(144,780,15)
    physics.addBody(block12, "static", {radius = 15})
    local block13 = display.newCircle(145,805,20)
    physics.addBody(block13, "static", {radius = 20})
    local block14 = display.newCircle(150,840,28)
    physics.addBody(block14, "static", {radius = 28})
    local block15 = display.newCircle(155,875,35)
    physics.addBody(block15, "static", {radius = 35})
    local pong1 = display.newRect(140, 1050, 170, 50)
    pong1.anchorX=-100
    pong1.anchorY=0.5
    pong1:setFillColor(0,0,1)
    local pong2 = display.newRect(530, 1050, 170, 50)
    pong2.anchorX=100
    pong2.anchorY = 0.5
    pong2:setFillColor(0,0,1)
    physics.addBody(pong1, "static", {bounce = 2})
    physics.addBody(pong2, "static", {bounce = 2})
    local ball  = display.newImage("ball.png", display.contentHeight/2, display.contentWidth/2)
    physics:addBody(ball, {density = 50, friction =10, bounce=1, radius=10})
    
    physics:setGravity(x, y)
    
    gx, gy = physics.getGravity()
    
    
    physics.setGravity(0,5)
    
    local group1 = display.newGroup()
    group1.anchorChildren = true
    group1.x = display.contentCenterX-50
    group1.y = display.contentHeight-325
    group1:insert(block6)
    group1:insert(block7)
    group1:insert(block8)
    group1:insert(block9)
    group1:insert(block10)
    group1:insert(a1block)
    group1:insert(a1block1)
    group1:insert(a1block2)
    group1:insert(a1block3)
    group1:insert(a1block4)
    group1:insert(a1block5)
    group1:insert(a1block6)
    group1:insert(a1block7)
    group1:insert(a1block8)
    group1:insert(a1block9)
    group1:insert(a1block10)
    group1:insert(a2block)
    group1:insert(a2block1)
    group1:insert(a2block2)
    group1:insert(a2block3)
    group1:insert(a2block4)
    group1:insert(a2block5)
    group1:insert(a2block6)
    group1:insert(a2block7)
    group1:insert(a2block8)
    group1:insert(a2block9)
    group1:insert(a2block10)
    group1:insert(a3block)
    group1:insert(a3block1)
    group1:insert(a3block2)
    group1:insert(a3block3)
    group1:insert(a3block4)
    group1:insert(a3block5)
    group1:insert(a3block6)
    group1:insert(a3block7)
    group1:insert(a3block8)
    group1:insert(a3block9)
    group1:insert(a3block10)
    group1:insert(block11)
    group1:insert(block12)
    group1:insert(block13)
    group1:insert(block14)
    group1:insert(block15)
    
    
    
    local leftSide = display.newRect(4,500, 10, 1550)
    
    leftSide:setFillColor(1,1,1,0.1)
    
    local rightSide = display.newRect(770,500,10,1550)
    
    rightSide:setFillColor(1,1,1,0.1)
    
    local top= display.newRect(display.contentWidth/2,-170,768,10)
    
    top:setFillColor(1,1,1,0.1)
    
    local ground= display.newRect(500,1245,1000,100)
    
    physics.addBody(ground, "static") 
    
    physics.addBody(leftSide, "static")
    
    physics.addBody(rightSide, "static")
    
    physics.addBody(top, "static")
    
    function flip(event)
        if ( event.phase == "began" ) then
        transition.to(pong1, {time = 100, rotation = -100})
        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
        transition.to(pong1, {time = 10, rotation = 0})
    end
    end
    
    backgroundA:addEventListener("touch", flip)
    
    function flip1(event)
        if ( event.phase == "began" ) then
        transition.to(pong2, {time = 100, rotation = 100})
        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
        transition.to(pong2, {time = 10, rotation = 0})
    end
    end
    
    function collide( self, event )
        if event.phase== "began" then
            if self.name == "ball" and event.other.name== "group1" then
                number = number+1
                score.text= "SCORE:" ..number
    
               end
           end
       end
    ball.collision= collide
    ball:addEventListener("collision", ball)
    backgroundA:addEventListener("touch", flip1)
    
    function collide2( self, event )
        if event.phase== "began" then
            if self.name == "ground" and event.other.name== "ball" then
                number2 = number2-1
                lives.text= "LIVES:" ..number2
                if number2== 0 then 
                    group1.alpha=0
                    display.newText("GAME OVER", display.contentCenterX, display.contentCenterY, nil, 25)
                    button = display.newText("RESET", display.contentCenterX, display.contentCenterY*1.5, nil, 25)
    
                    button: addEventListener("reset", button)
    
    
                 end
             end
         end
     end
    
    ground.collision= collide2
    ground:addEventListener("collision", ground)
    end
scene:addEventListener( "create", scene )
return scene
















