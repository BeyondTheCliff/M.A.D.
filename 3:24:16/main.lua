--Ian Smelser
--3/24/16
--Score Board

w = display.contentWidth
h = display.contentHeight
display.setDefault("background",0,0,0)
display.setStatusBar(display.HiddenStatusBar)

local sqlite3 = require "sqlite3" --The name database uses sql
local nameGenerator = require "nameGenerator" --Credit to atrizhong on the Corona Forums

local firstname = {} --All of the various arrays 
local score = {}
local objectsFirst = {}
local objectsScore = {}
local players = {firstname,score,objectsFirst,objectsScore} --A larger container
local max = 5 --Maximum players for the random gen
local maxScore = 10 --Max score
math.randomseed(os.time()) --Start with a new random seed
nameGenerator:open() --Start the name gen

for i=1,max do --Random generation of names and scores
	if (i%2) then
		firstname[i] = nameGenerator:generateFirstName() --Male names
	else
		firstname[i] = nameGenerator:generateFirstName(true) --Female names
	end
	score[i] = math.random(1,maxScore) --randomized score
	print(firstname[i].." : "..score[i])
end
local yloc = h*0.05 --dynamic ranges
local n = h/(max*1.1) --font size
print(n)
if (n>100) then --reset font size
	n=90
end
local fontSize = n --flop
local first = nil --primary trigger for red color
local evens=1 -- color sorting
for j=maxScore,1,-1 do
	for i=1,table.maxn(firstname) do
		if (score[i]==j) then
			print(i.." : "..j)
			if (string.len(firstname[i])>9) and (n>30) then
				fontSize=n*0.8
			else
				fontSize=n
			end
			objectsFirst[i] = display.newText(firstname[i],w*0.05,yloc,nil,fontSize)
			objectsFirst[i].anchorX=0
			objectsFirst[i].name=i
			objectsScore[i] = display.newText(score[i],w*0.90,yloc,nil,n)
			objectsScore[i].name=i
			yloc=yloc+n
			if (evens==1) then
				objectsFirst[i]:setFillColor(0,0.2,0.8)
				objectsScore[i]:setFillColor(0,0.2,0.8)
				evens=0
			else
				objectsFirst[i]:setFillColor(0,0.6,0.5)
				objectsScore[i]:setFillColor(0,0.6,0.5)
				evens=1
			end
			if (first==nil) then
				first=1
				objectsFirst[i]:setFillColor(0.9,0,0)
				objectsScore[i]:setFillColor(0.9,0,0)
			end
		end
	end
end

local function clicked( event ) --random stuff. Click a name or number to make it larger
	local number = event.target.name
	print(number)
	if event.phase=="began" then
		objectsFirst[number].size=objectsFirst[number].size+10
		objectsScore[number].size=objectsFirst[number].size+10
	elseif event.phase=="ended" then
		objectsFirst[number].size=objectsFirst[number].size-10
		objectsScore[number].size=objectsFirst[number].size-10
	end
end
for i=1,table.maxn(firstname) do
	objectsFirst[i]:addEventListener("touch",clicked)
	objectsScore[i]:addEventListener("touch",clicked)
end
