tx = {}
local victoryTime = 0
local totalTimes = 0
local TURNTIME = 20

function tx.total()
	nLog(totalTimes)
	totalTimes = totalTimes + 1
	if tx.JMvictory() then
		tx.victoryEnd()
		totalTimes = 0
	elseif tx.JMstart() then
		tx.start()
	elseif tx.JMxuanpai() then
		tx.querenxuanpai()
	elseif totalTimes > TURNTIME then
		tx.renshu()
		totalTimes = 0
	end
end

function tx.JMvictory()
	return ocr(ocrList.shengli,1)
end

function tx.JMstart()
	return ocr(ocrList.start,1)
end

function tx.JMxuanpai()
	return ocr(ocrList.xuanpai,1)
end

function tx.start()
	nLog("start")
	local x = random(900,970)
	local y = random(550,620)
	tap(x,y)
end

function tx.victoryEnd()
	nLog("victoryEnd")
	for i = 1,2 do
		local x = random(820,1000)
		local y = random(220,490)
		tap(x,y)
		waitSec(1)
	end
	victoryTime = victoryTime + 1
	if victoryTime >= needWin then
		-- lua_exit()
		doBreak = true
	end
end

function tx.querenxuanpai()
	nLog("querenxuanpai")
	local x = random(600,680)
	local y = random(550,580)
	tap(x,y)
end

function tx.renshu()
	nLog("renshu")
	local x = random(1230,1260)
	local y = random(695,710)
	tap(x,y)

	waitSec(1)

	local x = random(580,690)
	local y = random(255,270)
	tap(x,y)

	waitSec(7)
	for i = 1,2 do
		local x = random(820,1000)
		local y = random(220,490)
		tap(x,y)
		waitSec(1)
	end
end