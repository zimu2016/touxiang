require("touxiang")
require("common")
require("TSLib")

-- st_name = require "st_name"
-- st_account = require "st_account"

appid = "com.blizzard.wtcg.hearthstone"

-- accountPath = userPath().."/res/account.txt"
colorList = {
    wait = {
        {  856,  494, 0x541815},
        {  842,  576, 0x401113},
        { 1007,  502, 0x4e1615},
        { 1031,  604, 0x361010},
    },
    xuanpai = {
        {  517,  103, 0xab8048},
        {  745,  108, 0xc69854},
        {  609,  562, 0x7ec2ff},
        {  678,  566, 0x7fc3ff},
    },
    myTurn = {
        { 1012,  317, 0xe1bf16},
        { 1073,  320, 0xedc612},
        { 1010,  341, 0x93610e},
        { 1076,  340, 0x865216},
    },
    myTurnEnd = {
        { 1014,  317, 0x38bf0e},
        { 1069,  318, 0x41c61c},
        { 1013,  337, 0x2fab00},
        { 1072,  338, 0x66c73e},
    },
    enemyTurn = {
        {  996,  318, 0x4b4644},
        { 1067,  318, 0x655e55},
        {  996,  343, 0x968877},
        { 1074,  339, 0x60594f},
    },
    victory = {
        {  565,  600, 0x2f2319},
        {  584,  618, 0xefcd5c},
        {  708,  594, 0x614f38},
        {  750,  624, 0xffffff},
    },
    lose = {
        {  555,  430, 0x9b7a48},
        {  691,  438, 0x9f7642},
    },
    getGold = {
        {  539,  501, 0x5158a5},
        {  744,  487, 0x565fad},
        {  535,  539, 0x3c4794},
        {  746,  537, 0x3c479c},
    },
    setting = {
        {  429,  345, 0x6b533c},
        {  665,  376, 0x735b41},
        {  653,  539, 0x443221},
        {  898,  421, 0x53402b},
    },
    cost = {
        {  882,  663, 0x314f87},
        {  907,  665, 0x2f5586},
        {  927,  665, 0x386fc1},
        {  910,  659, 0x2c5396},
    },
}

ocrList = {
    shengli = {
        "获胜",
        {606,640},
        {643,656},
        1
    },
    lose = {
        "点击继续",
        {576,662},
        {703,693},
        1
    },
    close = {
        "Close",
        {622,288},
        {687,310},
        0
    },
}