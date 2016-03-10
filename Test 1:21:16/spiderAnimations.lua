-- This file was generated using SpriteHelper 2
-- For more informations please visit http://www.gamedevhelper.com/spritehelper2

module(...)

function getSequenceData()

	local sequenceData = {
		{
			name = "walking-e",
			frames={1, 2, 3, 4, 5, 6, 7, 8, },
			time=1000.000015,
			loopCount = 0
		},
		{
			name = "walking-n",
			frames={9, 10, 11, 12, 13, 14, 15, 16, },
			time=1000.000015,
			loopCount = 0
		},
		{
			name = "walking-ne",
			frames={17, 18, 19, 20, 21, 22, 23, 24, },
			time=1000.000015,
			loopCount = 0
		},
		{
			name = "walking-nw",
			frames={25, 26, 27, 28, 29, 30, 31, 32, },
			time=1000.000015,
			loopCount = 0
		},
		{
			name = "walking-s",
			frames={33, 34, 35, 36, 37, 38, 39, 40, },
			time=1000.000015,
			loopCount = 0
		},
		{
			name = "walking-se",
			frames={41, 42, 43, 44, 45, 46, 47, 48, },
			time=1000.000015,
			loopCount = 1
		},
		{
			name = "walking-sw",
			frames={49, 50, 51, 52, 53, 54, 55, 56, },
			time=1000.000015,
			loopCount = 0
		},
		{
			name = "walking-w",
			frames={57, 58, 59, 60, 61, 62, 63, 64, },
			time=1000.000015,
			loopCount = 0
		},
	}
return sequenceData
end

function getSequenceWithName(name)

	local seq = getSequenceData();
	for i =1, #seq do
		if seq[i].name == name then
			return { seq[i] };
		end
	end
return nil;
end
