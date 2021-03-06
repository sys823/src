---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by ya.
--- DateTime: 2020/4/20 12:41
---
local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/serializer")
require("system/timecount_def")
local mapName = {   --地图名字，玩家进入坐标X,y,怪物刷新坐标x,y
    {"世界BOSS1",82,25,53,51},
    {"世界BOSS2",99,96,65,66},
    {"世界BOSS3",41,66,25,47},
    {"世界BOSS4",50,50,23,21},
    {"世界BOSS5",40,60,18,29},
}

local  monsterBoss = {  --刷新的怪物1，...
    "上古斑斓虎",
    "素云雪妖",
    "捕灵鬼鲛",
    "黑炎凤凰",
    "异界兽王"
}

local refreshTime = {   --刷新时间1，...
    2*60*60,
    5*60*60,
    8*60*60,
    12*60*60,
    24*60*60
}

local sfsx = {}
-----------------------图标显示-----------------------------
function belleForm_show(player,line,pos)
    AddSEIcon(player, line, pos, "世界BOSS", 1800200015, "世界BOSS", "main", "", "世界BOSS")
    return true
end


-------------------图标被点击-----------------------
function main(player)
    for i=1,#mapName do
        if lualib:GetDBNum(mapName[i][1]) == 1 then
            sfsx[i] = 1
        else
            sfsx[i] = 0
        end
    end
    local data = "sfsx = " .. serialize(sfsx)
    lualib:ShowFormWithContent(player,"脚本表单",data)
    lualib:ShowFormWithContent(player, "form文件表单", "世界BOSS")
    return ""
end

function receive(player,num)
    local num = tonumber(num)
    local mapGuid = lualib:MapGuid(player)
    local map = lualib:KeyName(mapGuid)
    if map == mapName[num][1] then
        lualib:SysPromptMsg(player,"已经在该世界BOSS地图中！！")
        return ""
    end
    lualib:Player_MapMoveXY(player,mapName[num][1],mapName[num][2],mapName[num][3],3)
    return ""
end

function refreshMonster()
    local startServer = lualib:GetConstVar("StartServerTime")
    local startServerTime = lualib:Str2Time(startServer)
    local times = lualib:GetAllTime()

    for i=1,#refreshTime do
        if (times-startServerTime)%(refreshTime[i]) == 0 then
            local map = lualib:Map_GetMapGuid(mapName[i][1])
            if lualib:GetDBNum(mapName[i][1]) ~= 1 then
                lualib:Map_GenMonster(map,mapName[i][4],mapName[i][5],3,1,monsterBoss[i],1,false)
                lualib:SysMsg_SendBroadcastMsg("世界BOSS【"..monsterBoss[i].."】刷新啦！请快速前往击杀!","世界BOSS")
                lualib:SysMsg_SendBroadcastMsg("世界BOSS【"..monsterBoss[i].."】刷新啦！请快速前往击杀!","世界BOSS")
                lualib:SysMsg_SendBroadcastMsg("世界BOSS【"..monsterBoss[i].."】刷新啦！请快速前往击杀!","世界BOSS")
                lualib:SysMsg_SendBroadcastMsg("世界BOSS【"..monsterBoss[i].."】刷新啦！请快速前往击杀!","世界BOSS")
                lualib:SetDBNum(mapName[i][1],1)
            else
                lualib:SysMsg_SendBroadcastMsg("世界BOSS【"..monsterBoss[i].."】刷新啦！请快速前往击杀!","世界BOSS")
                lualib:SysMsg_SendBroadcastMsg("世界BOSS【"..monsterBoss[i].."】刷新啦！请快速前往击杀!","世界BOSS")
                lualib:SysMsg_SendBroadcastMsg("世界BOSS【"..monsterBoss[i].."】刷新啦！请快速前往击杀!","世界BOSS")
                lualib:SysMsg_SendBroadcastMsg("世界BOSS【"..monsterBoss[i].."】刷新啦！请快速前往击杀!","世界BOSS")
            end
        end
    end

end

function restartRefresh()
    local startServer = lualib:GetConstVar("StartServerTime")
    local startServerTime = lualib:Str2Time(startServer)
    local times = lualib:GetAllTime()
    if times - startServerTime > 0 then
        for i=1,#refreshTime do
            local map = lualib:Map_GetMapGuid(mapName[i][1])
            if lualib:Map_GetMonsterCount(map,monsterBoss[i],true,true) == 0 then

                lualib:Map_GenMonster(map,mapName[i][4],mapName[i][5],3,1,monsterBoss[i],1,false)
                lualib:SetDBNum(mapName[i][1],1)
            end
        end
    end
end
