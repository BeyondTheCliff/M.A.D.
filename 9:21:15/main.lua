--Ian Smelser
--9/21/15
--Array tables!!!!!

mt = {}
for i=1,10 do
	mt[i] = {}
	for x=1,10 do
		mt[i][x] = i*x
		print(mt[i][x])
	end
end