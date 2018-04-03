require("touxiang")
require("common")
require("TSLib")

-- st_name = require "st_name"
-- st_account = require "st_account"

appid = "com.blizzard.wtcg.hearthstone"

-- accountPath = userPath().."/res/account.txt"

ocrList = {
    shengli = {
        "胜利",
        {623,401},
        {701,435},
        1
    },
    start = {
        "返回",
        {1032,654},
        {1081,677},
        1
    },
    xuanpai = {
        "确认",
        {600,550},
        {680,580},
        1
    },
    close = {
        "Close",
        {622,288},
        {687,310},
        0
    },
}