--Ian Smelser
--1/19/16
--Fonts and stuff

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)


local fonts = native.getFontNames()
for i, fontname in ipairs(fonts) do
	print("fontname = "..tostring(fontname))
end

local text = display.newText("ABCDEFGHIJKLMNOPQRSTUVWXYZ",w/2,h/2,"AldotheApache",60)
local text = display.newText("abcdefghijklmnopqrstuvwxyz",w/2,h*0.55,"AldotheApache",60)