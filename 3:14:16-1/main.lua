local physics = require("physics") 
physics.start() 
physics.setGravity(1)
physics.setDrawMode("hybrid")

local Creatures = {}
local Connections = {}

local Rectangle = display.newRect (0, 0, 200, 50)
Rectangle:setFillColor(1, 1, 0)
physics.addBody(Rectangle, "static", {isSensor = true})
Rectangle.x = display.contentCenterX-30, 400
Rectangle.y = display.contentCenterX-30, 400

local Circle1 = display.newCircle(0, 0, 50)
Circle1:setFillColor(1, 0, 1)
physics.addBody(Circle1, "dynamic", {bounce=0, friction=0, radius=50})
Circle1.x = Rectangle.x-60, 400
Circle1.y = Rectangle.x-60, 400

local Circle2 = display.newCircle(0, 0, 100)
Circle2:setFillColor(0, 1, 1)
physics.addBody(Circle2, "dynamic", {bounce=0, friction=0, radius=100})
Circle2.x = Rectangle.x+60, 400
Circle2.y = Rectangle.x+60, 400 

Creatures[#Creatures+1] = physics.newJoint("pivot", Rectangle, Circle1, Rectangle.x-60, Rectangle.y)
Creatures[#Creatures+1] = physics.newJoint("pivot", Rectangle, Circle2, Rectangle.x+60, Rectangle.y)

local Starter = display.newCircle(0, 0, 50, (math.pi*50)+30)
Starter:setFillColor(0, 1, 0)
physics.addBody(Starter, "dynamic", {bounce=0, friction=0, radius=50})
starter.x = Rectangle.x+200, Circle1.x=(Starter.height/2)-20
starter.y = Rectangle.x+200, Circle1.y=(Starter.height/2)-20
Connections[Connections+1]=Starter 

Creatures[Creatures+1] = physics.newJoint("piston", Rectangle, Starter, Starter.x, Starter.y, 0, 1)

Creatures[Creatures+1] = physics.newJoint("gear", Circle1.x, Circle2, Creatures[1], Creatures[2], 1.0)
 
Creatures[Creatures+1] = physics.newJoint("gear", Circle2.x, Starter, Creatures[2], Creatures[3], -1*(30/50))