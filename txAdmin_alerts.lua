--[[
========= txAdmin Server Restart Alerts ===========================
]]

local txConfig = {}

txConfig.timeRemaining = {
    1800,
    900,
    600,
    300,
    60,
}
local timeRemaining = txConfig.timeRemaining --This is to prevent rewriting the txconfig line every time it is referenced lol

txConfig.RestartMsgData = {
    title = 'Stormchasers Alert',
    desc = 'A tsunami is bound for Los Santos in approx. ',
    icon = "https://cdn-icons-png.flaticon.com/512/4201/4201973.png",
}
local msgData = txConfig.RestartMsgData --same as before, to reduce amount of text



AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
for i=1, #timeRemaining do
    if eventData.secondsRemaining == timeRemaining[i] then 
        return TriggerEvent('cheese-warning:SendTsunamiAlert', timeRemaining[i])
    end
end
end)

RegisterNetEvent('cheese-warning:SendTsunamiAlert')
AddEventHandler('cheese-warning:SendTsunamiAlert', function(timeMsg)
    exports["yseries"]:CellBroadcast(
    -1,
    msgData.title,
    msgData.desc .. math.floor(timeMsg/60) .. ' minutes!',
    msgData.icon)
end)

--[[
========= txAdmin Player Alerts ===========================
These are the 'Announcements' admins can do to the whole city. Nothing really needs to be edited here tbh
]]

AddEventHandler('txAdmin:events:announcement', function(eventData)
    exports["yseries"]:CellBroadcast(
        -1,
        "City Broadcast",
        eventData.message,
        ""
    )
end)