tx = {}
local victoryTime = 0
local m_myTurn = false
local m_enemyTurn = false
local free_tick = 0

local curt_panel = 0
local panel = {
	wait = 1,
	xuanpai = 2,
	myTurn = 3,
	enemyTurn = 4,
	victory = 5,
	lost = 6,
	getGold = 7,
}

function tx.total()
	-- keepScreen(true)
	curt_panel = 0
	curt_panel = tx.GetCurtPanel()
	-- keepScreen(false)

	if curt_panel == panel.wait then
		-- nLog("wait")
		free_tick = 0
		tx.start()
	elseif curt_panel == panel.xuanpai then
		-- nLog("xuanpai")
		free_tick = 0
		tx.querenxuanpai()
	elseif curt_panel == panel.myTurn then
		-- nLog("myTurn")
		free_tick = 0
		m_myTurn = true
		if not m_enemyTurn then
			tx.endTurn()
		end
	elseif curt_panel == panel.enemyTurn then
		free_tick = 0
		m_enemyTurn = true
		-- nLog("enemyTurn")
	elseif curt_panel == panel.victory then
		-- nLog("victory")
		tx.victoryEnd()
	-- elseif curt_panel == panel.lost then
		--运行不到
		-- nLog("lost")
		-- tx.renshu()
	elseif curt_panel == panel.getGold then
		-- nLog("getGold")
		tx.randomClick()
	else
		free_tick = free_tick + 1
		if free_tick > 10 then
			tx.randomClick()
			free_tick = 0
		end
	end

	if m_myTurn and m_enemyTurn then
		tx.renshu()
	end
end

function tx.GetCurtPanel()
	if multiColor(colorList.wait) then
		return panel.wait
	end

	if multiColor(colorList.xuanpai) then
		return panel.xuanpai
	end

	if multiColor(colorList.myTurn) then
		return panel.myTurn
	end

	if multiColor(colorList.myTurnEnd) then
		return panel.myTurn
	end

	if multiColor(colorList.enemyTurn) then
		return panel.enemyTurn
	end

	-- if multiColor(colorList.victory) then
	-- 	return panel.victory
	-- end
	if ocr2(ocrList.shengli) then
		return panel.victory
	end

	-- if multiColor(colorList.lost) then
	-- 	return panel.lost
	-- end

	if multiColor(colorList.getGold) then
		return panel.getGold
	end
end

function tx.start()
	-- nLog("start")
	m_myTurn = false
	m_enemyTurn = false
	local x = random(900,970)
	local y = random(550,620)
	tap(x,y)
end

function tx.victoryEnd()
	-- nLog("victoryEnd")
	tx.randomClick()
	victoryTime = victoryTime + 1
	nLog("victoryTime----------"..victoryTime)
	if victoryTime >= needWin then
		-- lua_exit()
		doBreak = true
	end
end

function tx.querenxuanpai()
	-- nLog("querenxuanpai")
	local x = random(600,680)
	local y = random(550,580)
	tap(x,y)
end

function tx.renshu()
	-- nLog("renshu")
	m_myTurn = false
	m_enemyTurn = false
	local x = random(1230,1260)
	local y = random(695,710)
	tap(x,y)

	waitSec(1)

	local x = random(580,690)
	local y = random(255,270)
	tap(x,y)

	waitSec(7)
	tx.randomClick()
end

function tx.endTurn()
	waitSec(1)
	local x = random(1008,1080)
	local y = random(317,337)
	tap(x,y)
end

function tx.randomClick()
	for i = 1,2 do
		local x = random(820,1000)
		local y = random(220,490)
		tap(x,y)
		waitSec(0.5)
	end
end