QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand("bugreport", function(source)
    local dialog = exports['qb-input']:ShowInput({
        header = "Report a Bug to City Devs",
        submitText = "Report!",
        inputs = {
            {
                text = "What is it that your reporting?",  
                name = "bugreport", 
                type = "text", 
                isRequired = true 
            },
            {
                text = "User Reporting (Your Name)", 
                name = "userreporting", 
                type = "text", 
                isRequired = true 
            },
        },


    })

    if dialog ~= nil then
        TriggerServerEvent('qb-bugreport:server:SendToDiscord', dialog.bugreport, dialog.userreporting)
    end
    
end)