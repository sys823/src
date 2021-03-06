---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by ken.
--- DateTime: 2019/11/4 21:16
---

local equipmentAttr = {
    [1] = {                             --武器
        {10,12,14,16,6,8},              --物攻上线，魔攻上线，道攻上线，命中，物防,魔防
        {3,5,7,10,20,30,50,100}
    },
    [2] = {                             --头盔
        {10,12,14,16,6,8},              --物攻上线，魔攻上线，道攻上线，命中，物防,魔防
        {10,30,100}
    },
    [3] = {                             --左手镯
        {10,12,14,16,6,8},              --物攻上线，魔攻上线，道攻上线，命中，物防,魔防
        {10,30,100}
    },
    [4] = {                             --右手镯
        {10,12,14,6,5},              --物攻上线，魔攻上线，道攻上线，物防,魔防
        {10,30,100}
    },
    [5] = {                             --衣服
        {10,12,14,16,6,8},              --物攻上线，魔攻上线，道攻上线，命中，物防,魔防
        {3,5,7,10,20,30,50,100}
    },
    [7] = {                             --鞋子
        {10,12,14,16,6,8},              --物攻上线，魔攻上线，道攻上线，命中，物防,魔防
        {10,30,100}
    },
    [8] = {                             --腰带
        {10,12,14,16,6,8},              --物攻上线，魔攻上线，道攻上线，命中，物防,魔防
        {10,30,100}
    },
    [9] =  {                            --项链
        {10,12,14,16,6,8},              --物攻上线，魔攻上线，道攻上线，命中，物防,魔防
        {10,30,100}
    },
    [10] = {                            --左戒子
        {10,12,14,16,6,8},              --物攻上线，魔攻上线，道攻上线，命中，物防,魔防
        {10,30,100}
    },
    [11] = {                            --右戒子
        {10,12,14,16,6,8},              --物攻上线，魔攻上线，道攻上线，命中，物防,魔防
        {10,30,100}
    },
    [12] = {                            --勋章
        {10,12,14,16,6,8},              --物攻上线，魔攻上线，道攻上线，命中，物防,魔防
        {10,30,100}
    },
    [19] = {                            --斗笠
        {10,12,14,16,6,8},              --物攻上线，魔攻上线，道攻上线，命中，物防,魔防
        {10,30,100}
    },
}
local attributeName = {"物攻上线","魔攻上线","道攻上线","命中","物防","魔防"}
local ingots = {3000,3000,3000,5000,3000,3000}      --升级对应该属性需要的元宝

function main(npc, player)
    local msg = "#COLORCOLOR_RED#㊣#COLOREND##COLORCOLOR_GOLD#=================#COLOREND##COLORCOLOR_RED#欢迎光临装备升级系统#COLOREND##COLORCOLOR_GOLD#=================#COLOREND##COLORCOLOR_RED#㊣#COLOREND#\n"
    msg = msg.."#OFFSET<X:0,Y:4>##COLORCOLOR_SKYBLUE#    初次提升成功率40%，成功率随升级点数相应降低，\n除精准外升级必须物品3000元宝，精准需要5000元宝，\n首饰最高3点，其他最高可以提升7点。#COLOREND#\n"
    msg = msg.."#COLORCOLOR_BROWN#   ┌─────┬─────┬─────┬─────┐#COLOREND#\n"
    msg = msg.."#COLORCOLOR_BROWN#   │#COLOREND##OFFSET<X:0,Y:2>##OFFSET<X:0,Y:-2># <@InfoItemRefine#1 *01*武器升级>#COLORCOLOR_BROWN##OFFSET<X:-2,Y:0># │ #COLOREND##OFFSET<X:0,Y:2>##OFFSET<X:-2,Y:-2>#<@InfoItemRefine#5 *01*衣服升级>#COLORCOLOR_BROWN##OFFSET<X:0,Y:0># │ #COLOREND##OFFSET<X:0,Y:0>#<@InfoItemRefine#19 *01*斗笠升级>#COLORCOLOR_BROWN##OFFSET<X:-2,Y:0># │ #COLOREND##OFFSET<X:0,Y:0>#<@InfoItemRefine#12 *01*勋章升级>#COLORCOLOR_BROWN##OFFSET<X:-2,Y:0># │#COLOREND#\n"
    msg = msg.."#COLORCOLOR_BROWN#   ├─────┼─────┼─────┼─────┤#COLOREND#\n"
    msg = msg.."#COLORCOLOR_BROWN#   │#COLOREND##OFFSET<X:0,Y:-2>##OFFSET<X:0,Y:0># <@InfoItemRefine#2 *01*头盔升级>#COLORCOLOR_BROWN##OFFSET<X:-2,Y:0># │ #COLOREND##OFFSET<X:0,Y:2>##OFFSET<X:-2,Y:-2>#<@InfoItemRefine#9 *01*项链升级>#COLORCOLOR_BROWN##OFFSET<X:0,Y:0># │ #COLOREND##OFFSET<X:0,Y:0>#<@InfoItemRefine#8 *01*腰带升级>#COLORCOLOR_BROWN##OFFSET<X:-2,Y:0># │ #COLOREND##OFFSET<X:0,Y:0>#<@InfoItemRefine#7 *01*鞋子升级>#COLORCOLOR_BROWN##OFFSET<X:-2,Y:0># │#COLOREND#\n"
    msg = msg.."#COLORCOLOR_BROWN#   ├─────┼─────┼─────┼─────┤#COLOREND#\n"
    msg = msg.."#COLORCOLOR_BROWN#   │#COLOREND##OFFSET<X:0,Y:-2>##OFFSET<X:0,Y:0>#<@InfoItemRefine#10 *01*左戒指升级>#COLORCOLOR_BROWN##OFFSET<X:-2,Y:0>#│#COLOREND##OFFSET<X:0,Y:2>##OFFSET<X:-2,Y:-2>#<@InfoItemRefine#11 *01*右戒指升级>#COLORCOLOR_BROWN##OFFSET<X:0,Y:0>#│#COLOREND##OFFSET<X:0,Y:0>#<@InfoItemRefine#3 *01*左手镯升级>#COLORCOLOR_BROWN##OFFSET<X:-2,Y:0>#│#COLOREND##OFFSET<X:0,Y:0>#<@InfoItemRefine#4 *01*右手镯升级>#COLORCOLOR_BROWN##OFFSET<X:-2,Y:0>#│#COLOREND#\n"
    msg = msg.."#COLORCOLOR_BROWN#   └─────┴─────┴─────┴─────┘#COLOREND#\n"
    msg = msg.."#OFFSET<X:300,Y:0>##IMAGE1902700019#<@main *01*返回>\n"
    lualib:NPCTalkDetailEx(npc, player, msg, 430, 240)
    return""
end
-------------------------------------------------------------------------------------------幸运项链
function InfoItemRefine(npc, player,num)
    num = tonumber(num)

    local msg = "\n"
    msg = msg.."#IMAGE<ID:1902700017>#<@strengthen#1#"..num.." *01*【升级攻击】>#COLORCOLOR_RED#     攻击 ：强化1属性点 需要->3000元宝#COLOREND#\n\n"
    msg = msg.."#IMAGE<ID:1902700017>#<@strengthen#2#"..num.." *01*【升级魔攻】>#COLORCOLOR_RED#     魔法 ：强化1属性点 需要->3000元宝#COLOREND#\n\n"
    msg = msg.."#IMAGE<ID:1902700017>#<@strengthen#3#"..num.." *01*【升级道攻】>#COLORCOLOR_RED#     道术 ：强化1属性点 需要->3000元宝#COLOREND#\n\n"
    if num == 1 then
        msg = msg.."#IMAGE<ID:1902700017>#<@strengthen#4#"..num.." *01*【升级精准】>#COLORCOLOR_RED#     精准 ：强化1属性点 需要->5000元宝#COLOREND#\n\n"
    end

    if num ~= 9 and num ~= 1 then
        msg = msg.."#IMAGE<ID:1902700017>#<@strengthen#5#"..num.." *01*【升级防御】>#COLORCOLOR_RED#     防御 ：强化1属性点 需要->3000元宝#COLOREND#\n\n"
        msg = msg.."#IMAGE<ID:1902700017>#<@strengthen#6#"..num.." *01*【升级魔御】>#COLORCOLOR_RED#     魔御 ：强化1属性点 需要->3000元宝#COLOREND#\n\n"
    end

    msg = msg.."#COLORCOLOR_GREENG#温馨提示：请把你要升级的装备戴在装备栏上！#COLOREND#\n"
    --msg = msg.."#OFFSET<X:0,Y:0>##COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n"
    msg = msg.."                                            #IMAGE<ID:1902700019>#<@main *01*「返回」>"
    return msg
end

function strengthen(npc,player,type,num)
    num = tonumber(num)
    type = tonumber(type)
    local item_guid = lualib:Player_GetItemGuid(player, num)
    local da = "_da8"..type
    local dv = "_dv8"..type
    local attrValue = lualib:GetInt(item_guid,dv)
    local ranomMax = equipmentAttr[num][2][attrValue+1]
    local random = lualib:GenRandom(1,ranomMax)
    if item_guid == "" then
        return "请把装备穿戴身上进行升级！\n \n<@InfoItemRefine#"..num.." *01*返回>\n"
    end
    if attrValue >= #equipmentAttr[num][2] then
        lualib:MsgBox(player,"当前属性已经为"..dv..",已经升至最大属性值!!!")
        return ""
    end
    if not lualib:Player_SubIngot(player,ingots[type],false,"装备强化扣除元宝","装备强化扣除元宝") then
        return "元宝不足！"
    end
    if random ~= 2 then
        return "强化失败！！！！！\n \n<@InfoItemRefine#"..num.." *01*返回>"
    end
    lualib:SetInt(item_guid,da,equipmentAttr[num][1][type])
    lualib:SetInt(item_guid,dv,attrValue+1)
    lualib:Item_NotifyUpdate("",item_guid)
    lualib:MsgBox(player,"提升成功！成功提升【"..attributeName[type].."属性1点】！！！")
    return "强化成功！！！！！\n \n<@InfoItemRefine#"..num.." *01*返回>"
end
lualib:SysMsg_SendBroadcastMsg(tostring(), )
