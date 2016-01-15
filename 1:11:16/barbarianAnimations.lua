-- This file was generated using SpriteHelper 2
-- For more informations please visit http://www.gamedevhelper.com/spritehelper2

module(...)

function getSequenceData()

	local sequenceData = {
		{
			name = "walking-se",
			frames={45, 56, 54, 35, 7, 47, 29, 14, },
			time=1000.000015,
			loopCount = 0
		},
		{
			name = "walking-ne",
			frames={3, 52, 1, 8, 42, 60, 48, 62, },
			time=1000.000015,
			loopCount = 0
		},
		{
			name = "walking-e",
			frames={12, 18, 41, 59, 46, 16, 9, 17, },
			time=1000.000015,
			loopCount = 0
		},
		{
			name = "walking-nw",
			frames={57, 22, 32, 34, 26, 40, 37, 33, },
			time=1000.000015,
			loopCount = 0
		},
		{
			name = "walking-sw",
			frames={19, 55, 61, 43, 20, 13, 21, 10, },
			time=1000.000015,
			loopCount = 0
		},
		{
			name = "walking-n",
			frames={25, 2, 11, 58, 31, 23, 44, 50, },
			time=1000.000015,
			loopCount = 0
		},
		{
			name = "walking-s",
			frames={28, 4, 6, 64, 27, 38, 30, 53, },
			time=1000.000015,
			loopCount = 0
		},
		{
			name = "walking-w",
			frames={49, 36, 5, 15, 24, 51, 63, 39, },
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
