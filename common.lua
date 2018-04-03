-- MAX_TIME = 10
random = math.random

function waitSec(time)
    mSleep(time * 1000)
end

function getInputText(str)
    local st = "input text \""..str.."\""
    return st
end

function ocr(list,MAX_TIME)
    MAX_TIME = MAX_TIME or 10
    local str,x1,y1,x2,y2 = list[1],list[2][1],list[2][2],list[3][1],list[3][2]
	local time = 0
	while (true) do
		waitSec(1)
		time = time + 1
		local text = ocrText(x1, y1, x2, y2, list[4], str)
		if text == str then
			return true
		end
        if time >= MAX_TIME then
        	return false
   --          if fun then
   --              fun()
   --          else
   --              dialog("好像没反应了诶。。。"..x1..","..y1, 3)
   --              lua_exit()
   --          end
			-- break
		end
	end
end