tx = {}
local victoryTime = 0
local m_myTurn = false
local m_enemyTurn = false
--每隔10-15秒就随机点两下（排除异常）
local free_tick = 0
--若多次出现异常，则投降
local tick_times = 0
local wait_time = 10

local curt_panel = 0
local panel = {
	null = 0,
	wait = 1,
	xuanpai = 2,
	myTurn = 3,
	enemyTurn = 4,
	victory = 5,
	lose = 6,
	getGold = 7,
	setting = 8,
	cost = 9,
	connectErr = 10,
}

function tx.total()
	-- keepScreen(true)
	curt_panel = panel.null
	curt_panel = tx.GetCurtPanel()
	-- keepScreen(false)

	if curt_panel == panel.wait then
		nLog("wait")
		free_tick = -15
		tx.start()
	elseif curt_panel == panel.xuanpai then
		nLog("xuanpai")
		free_tick = 0
		tx.huanpai()
		tx.querenxuanpai()
	elseif curt_panel == panel.myTurn then
		nLog("myTurn")
		m_myTurn = true
		if not m_enemyTurn then
			tx.endTurn()
			waitSec(1)
		end
	elseif curt_panel == panel.enemyTurn then
		nLog("enemyTurn")
		m_enemyTurn = true
	elseif curt_panel == panel.victory then
		nLog("victory")
		tx.victoryEnd()
	-- elseif curt_panel == panel.lose then
		--运行不到
		-- nLog("lose")
		-- tx.renshu()
	-- elseif curt_panel == panel.getGold then
		-- nLog("getGold")
		-- tx.randomClick()
	elseif curt_panel == panel.setting then
		nLog("setting")
		for i = 1,2 do
			local x = random(628,834)
			local y = random(635,681)
			tap(x,y)
			waitSec(0.5)
		end
	elseif curt_panel == panel.connectErr then
		nLog("connectErr")
		local x = random(610,664)
		local y = random(424,437)
		tap(x,y)
		waitSec(0.5)
	elseif curt_panel == panel.null then
		nLog("tick: "..free_tick)
		free_tick = free_tick + 1
		if free_tick > wait_time then
			tick_times = tick_times + 1
			wait_time = random(10,15)
			tx.randomClick()
			free_tick = 0
		end

		if tick_times >=5 then
			m_myTurn = true
			m_enemyTurn = true
		end
	end

	if m_myTurn and m_enemyTurn then
		tx.renshu()
	end
end

function tx.GetCurtPanel()
	if multiColor(colorList.myTurn,70) then
		return panel.myTurn
	end

	if multiColor(colorList.myTurnEnd,70) then
		return panel.myTurn
	end

	-- if ocr2(ocrList.shengli) then
	if multiColor(colorList.victory,80) or ocr2(ocrList.shengli) then
		return panel.victory
	end
	
	if multiColor(colorList.enemyTurn,80) then
		return panel.enemyTurn
	end

	if multiColor(colorList.connectErr) then
		return panel.connectErr
	end
	
	if multiColor(colorList.wait) then
		return panel.wait
	end

	if multiColor(colorList.xuanpai) then
		return panel.xuanpai
	end

	-- if multiColor(colorList.lose) then
	-- if ocr2(ocrList.lose) then
		-- return panel.lose
	-- end

	-- if multiColor(colorList.getGold) then
	-- 	return panel.getGold
	-- end

	if multiColor(colorList.setting) then
		return panel.setting
	end
	
	return panel.null
end

function tx.start()
	-- nLog("start")
	m_myTurn = false
	m_enemyTurn = false
	tick_times = 0
	local x = random(900,970)
	local y = random(550,620)
	tap(x,y)
end

function tx.victoryEnd()
	-- nLog("victoryEnd")
	tx.randomClick()
	tick_times = 0
	victoryTime = victoryTime + 1
	nLog("victoryTime----------"..victoryTime)
	if victoryTime >= needWin then
		-- lua_exit()
		doBreak = true
	end
end

function tx.huanpai()
	-- nLog("huanpai")
	for i = 1,2 do
		local x = random(330,940)
		local y = random(250,430)
		tap(x,y)
		waitSec(0.5)
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
	tick_times = 0
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
	local x = random(1008,1080)
	local y = random(317,337)
	tap(x,y)
	waitSec(0.5)
	x = random(820,1000)
	y = random(220,490)
	tap(x,y)
	waitSec(0.5)
end