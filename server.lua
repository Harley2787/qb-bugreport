--[[
Webhook = "DISCORD LINK" <---- Example
]]--

QBCore = exports['qb-core']:GetCoreObject()

Webhook = "https://discord.com/api/webhooks/1018981802519580713/iJLdsV2AzkpAVub38Xwo3Uu57fpVfwiZShRLWg2-SKtoaIn5ZUMMhd2XdsSXftCLvg7U" -- Change to "PUT LINK HERE"

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        if Webhook ~= nil then
            print("^2Webhook Found | Bug Reports Resource Started!")
        else
            print("^5 You Need to put a webhook in server.lua line 7!")
            Citizen.Wait(250)
            StopResource(resource)
        end
    end
end)

RegisterNetEvent('qb-bugreport:server:SendToDiscord', function(message, user_report)
    message = message .." | This Bug Report Was Send From: " ..user_report
    PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = "Bug Report!", content = message}), { ['Content-Type'] = 'application/json' })
end)
