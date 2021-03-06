---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Admin.
--- DateTime: 2020/5/19 12:43
---
local timeNum =  0
function receive(player)
    local level = lualib:Level(player)
    if level < 65 then
        lualib:MsgBox(player,"您的等级不足！！请65级以后再来参加！")
        return ""
    end

    if lualib:GetDBNum("treasureChest") == 1 then
        lualib:Player_MapMoveXY(player,"天赐宝箱",79,158,3)
    else
        lualib:MsgBox(player,"活动尚未开始！")
    end
    return ""
end

function treasureChestTimer()
    local startTimeStr = lualib:GetConstVar("StartServerTime")      --开区时间字符串
    local startTime = lualib:Str2Time(startTimeStr)                 --开区时间
    local currentTimeStr = lualib:Now()                             --当前时间字符串
    local currentTime = lualib:Str2Time(currentTimeStr)                             --当前时间
    local activit = lualib:Str2Time("2020-05-01 19:10:00")                             --当前时间
    if (currentTime - startTime) / (60 *60) == 0 then
        lualib:SetDBNum("treasureChest",1)
        lualib:AddTimer("0", 20200519, 1000, -1, "天赐宝箱:treasureChestOver")
        timeNum = 0
        lualib:SysMsg_SendBroadcastMsg("天赐宝箱活动开始了！！！快去抢吧！！", "天赐宝箱")
        lualib:SysMsg_SendBroadcastMsg("天赐宝箱活动开始了！！！快去抢吧！！", "天赐宝箱")
        lualib:SysMsg_SendBroadcastMsg("天赐宝箱活动开始了！！！快去抢吧！！", "天赐宝箱")

    end
    if (currentTime - activit) % (24 * 60 * 60) == 0 and (currentTime - startTime) >= (24 * 60 * 60) then
        lualib:SetDBNum("treasureChest",1)
        lualib:AddTimer("0", 20200519, 1000, -1, "天赐宝箱:treasureChestOver")
        timeNum = 0
        lualib:SysMsg_SendBroadcastMsg("天赐宝箱活动开始了！！！快去抢吧！！", "天赐宝箱")
        lualib:SysMsg_SendBroadcastMsg("天赐宝箱活动开始了！！！快去抢吧！！", "天赐宝箱")
        lualib:SysMsg_SendBroadcastMsg("天赐宝箱活动开始了！！！快去抢吧！！", "天赐宝箱")

    end
    return ""
end

function treasureChestOver()
    local map = lualib:Map_GetMapGuid("天赐宝箱")
    if lualib:Map_GetMapNpc(map,"天赐宝箱") == "" then
        if lualib:Map_GenNpc(map, "天赐宝箱",79,55,2,1) then
            timeNum = timeNum + 1
            lualib:SysMsg_SendBroadcastMsg("宝箱出现！！！快去抢吧！！", "天赐宝箱")
        end
    end

    if timeNum == 20 then
        lualib:DisableTimer("0",20200519)
        lualib:SetDBNum("treasureChest",0)
    end
    return ""
end