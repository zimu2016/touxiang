require("const")
needWin = 20
init(0)
doBreak = false

function test()
	tx.total()
end

while true do
	waitSec(1)
	test()
	if doBreak then
		break
	end
end