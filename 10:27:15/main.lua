--Array test 

local score = 0
local scoreT = display.newText(score,display.contentCenterX,140,nil,60)
local addT = display.newText("Add",display.contentCenterX,display.contentHeight*0.9)

function click(event)
	local tar = event.target.text
	local num_1 = event.target.num1
	local num_2 = event.target.num2
	score=score+tar
	scoreT.text=score
	matrix[num_1][num_2].alpha=0
	for i=1,10 do
		for v=1,10 do
			if (matrix[num_1][num_2].text==matrix[i][v].text and matrix[i][v].alpha==1) then
				matrix[i][v].alpha=0
			end
		end
	end
end

matrix={}
i=0
v=0
for i=1,10 do
	matrix[i]={}
	for v=1,10 do
		matrix[i][v]=display.newText(i*v,i*60-10,v*60+200,nil,35)
		print(matrix[i][v].text)
		matrix[i][v].num1=i
		matrix[i][v].num2=v
		matrix[i][v]:addEventListener("touch",click)
	end
end

function addAll( event )
	for i=1,10 do
		for v=1,10 do
			score=score+matrix[i][v].text
			scoreT.text=score
		end
	end
end
addT:addEventListener("tap",addAll)