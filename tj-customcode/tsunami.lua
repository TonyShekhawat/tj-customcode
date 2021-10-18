local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData) -- Gets called every [30, 15, 10, 5, 4, 3, 2, 1] minutes by default according to config
    if eventData.secondsRemaining == 1800 then -- 30mins
        TriggerEvent('qb-weathersync:server:setWeather', "OVERCAST")
        TriggerClientEvent('chat:addMessage', -1, {
            color = { 71, 0, 0},
            template = '<div class="chat-message advert"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
            args = { "☔ Nature Warning ☔", "🌊 ❗  Tsunami inbound in 30 minutes, Head to safety ❗ 🌊" }
        })
    elseif eventData.secondsRemaining == 900 then -- 15mins
        TriggerEvent('qb-weathersync:server:setWeather', "RAIN")
        TriggerClientEvent('chat:addMessage', -1, {
            color = { 71, 0, 0},
            template = '<div class="chat-message advert"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
            args = { "☔ Nature Warning ☔", "🌊 ❗ Tsunami inbound in 15 minutes, Head to safety ❗ 🌊" }
        })
    elseif eventData.secondsRemaining == 300 then -- 5mins
        TriggerEvent('qb-weathersync:server:setWeather', "THUNDER")
        TriggerClientEvent('chat:addMessage', -1, {
            color = { 71, 0, 0},
            template = '<div class="chat-message advert"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
            args = { "⚡ Nature Warning ⚡", "🌊 ❗ Tsunami inbound in 5 minutes, Head to safety ❗ 🌊" }
       })
    elseif eventData.secondsRemaining == 120 then -- 2mins
        TriggerClientEvent('chat:addMessage', -1, {
            color = { 71, 0, 0},
            template = '<div class="chat-message advert"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
            args = { "⚡ Nature Warning ⚡", "🌊 ❗ Tsunami inbound in 2 minutes, Head to safety ❗ 🌊" }
        })
    elseif eventData.secondsRemaining == 60 then -- 1min
        TriggerEvent('qb-weathersync:server:toggleBlackout')
        TriggerClientEvent('chat:addMessage', -1, {
            color = { 71, 0, 0},
            template = '<div class="chat-message advert"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
            args = { "🏴 Nature Warning 🏴", "🌊 ❗ Tsunami inbound in 1 minutes, Head to safety ❗ 🌊" }
        })
        Citizen.Wait(30000) -- Because this event does not get called at the 30second mark
        TriggerClientEvent('chat:addMessage', -1, {
            color = { 71, 0, 0},
            template = '<div class="chat-message advert"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
            args = { "🏴 Nature Final Warning ❗ 🏴", "🌊 ❗ Tsunami inbound in 30 seconds, Get to safety immediately ❗ 🌊" }
        })
		Citizen.Wait(30000)
		restart()
    end
end)

function restart()
	local xPlayers = QBCore.Functions.GetPlayers()
	for i=1, #xPlayers, 1 do
		DropPlayer(xPlayers[i], "🌊 A tsunami has wiped out the city... Don't worry ❗ Your progress has been saved and will be back in a couple minutes.😄")
	end
	Citizen.Wait(10000)
	os.exit()
end

QBCore.Commands.Add("restartcity", "5 Minute City Restart", {}, false, function(source, args, user)
    Citizen.CreateThread(function()
        TriggerEvent('qb-weathersync:server:setWeather', "Thunder")
		TriggerClientEvent('chat:addMessage', -1, {
            color = { 71, 0, 0},
            template = '<div class="chat-message advert"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
            args = { "⚡ Nature Warning ⚡", "🌊 ❗ Tsunami inbound in 5 minutes, Head to safety ❗ 🌊" }
		})
		Citizen.Wait(180000)
        TriggerClientEvent('chat:addMessage', -1, {
            color = { 71, 0, 0},
            template = '<div class="chat-message advert"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
            args = { "⚡ Nature Warning ⚡", "🌊 ❗ Tsunami inbound in 2 minutes, Head to safety ❗ 🌊" }
		})
		Citizen.Wait(60000)
        TriggerEvent('qb-weathersync:server:toggleBlackout')
        TriggerClientEvent('chat:addMessage', -1, {
            color = { 71, 0, 0},
            template = '<div class="chat-message advert"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
            args = { "🏴 Nature Warning 🏴", "🌊 ❗ Tsunami inbound in 1 minutes, Head to safety ❗ 🌊" }
		})
		Citizen.Wait(30000)
        TriggerClientEvent('chat:addMessage', -1, {
            color = { 71, 0, 0},
            template = '<div class="chat-message advert"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
            args = { "🏴 Nature Final Warning 🏴", "🌊 ❗ Tsunami inbound in 30 seconds, Get to safety immediately ❗ 🌊" }
		})
		Citizen.Wait(30000)
		restart()
	end)
end, "god")

QBCore.Commands.Add("restartcitynow", "Restart the city instantly.", {}, false, function(source, args, user)
    Citizen.CreateThread(function()
		restart()
	end)
end, "god")


-------------------------------------------------------------------------------------------------
