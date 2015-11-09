--Ian Smelser
--10/29/15
--Font lister

arr={}
local inct = display.newText("Enter font name to find", display.contentCenterX, 100, nil, 30)
local right = display.newText(">",display.contentCenterX+150,500,nil,60)
local left = display.newText("<",display.contentCenterX-150,500,nil,60)
local input = native.newTextField(display.contentCenterX,200,500,50)
local submit = display.newRoundedRect(display.contentCenterX,500,200,50,12)
submit:setFillColor(0,0.3,1)
submit.strokeWidth=2
submit:setStrokeColor(1,1,1)
local submitT = display.newText("Submit",display.contentCenterX,500)
local findings = display.newText("",display.contentCenterX,350,nil,30)
local num_find = display.newText("",display.contentCenterX,420,nil,40)
local systemFonts = native.getFontNames()
x=0
function delayC( event )
	submit:setFillColor(0,0.3,1)
end
function create( text,font )
	print(text)
	if (text==nil) then
		text="Nothing Found"
		font=nil
	end
	findings:removeSelf()
	findings = display.newText(text,display.contentCenterX,350,font,30)
end
local function find( event )
	submit:setFillColor(0,0,1)
	x=0
	findings.text=""
	num_find.text=""
	if (arr[1]~=nil) then
		for i=1,table.getn(arr) do
			print("I="..i)
			arr[i]=nil
		end
	end
	
	-- Set the string to query for (part of the font name to locate)
	local searchString = input.text
	
	-- Display each font in the Terminal/console
	for i, fontName in ipairs( systemFonts ) do
		local j, k = string.find( string.lower(fontName), string.lower(searchString) )
		if ( j ~= nil ) then
			x=x+1
			print( x..":Font Name = " .. tostring( fontName ) )
			arr[x]=tostring( fontName )
		end
	end
	x=1
	print(arr[x])
	create(arr[x],arr[x])
	num_find.text=x
	print(findings.font)
	timer.performWithDelay(100,delayC)
end
submit:addEventListener("tap",find)
submitT:addEventListener("tap",find)
local function rightm( event )
	x=x+1
	if (arr[x]==nil) then
		x=1
	end
	create(arr[x],arr[x])
	num_find.text=x
end
right:addEventListener("tap",rightm)
local function leftm( event )
	x=x-1
	if (arr[x]==nil) then
		x=table.getn(arr)
	end
	create(arr[x],arr[x])
	num_find.text=x
end
left:addEventListener("tap",leftm)