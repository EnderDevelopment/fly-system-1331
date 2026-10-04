ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('fly_system:toggleFly')
AddEventHandler('fly_system:toggleFly', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        if xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'superadmin' then
            local currentTime = os.time()
            local lastToggle = xPlayer.get('lastFlyToggle') or 0
            
            if currentTime - lastToggle >= Config.FlyCooldown then
                xPlayer.set('lastFlyToggle', currentTime)
                TriggerClientEvent('fly_system:toggleFly', source, true)
            else
                local remainingTime = Config.FlyCooldown - (currentTime - lastToggle)
                TriggerClientEvent('fly_system:toggleFly', source, false, 'You must wait ' .. remainingTime .. ' seconds before toggling fly mode again.')
            end
        else
            TriggerClientEvent('fly_system:toggleFly', source, false, 'You do not have permission to use this command.')
        end
    else
        TriggerClientEvent('fly_system:toggleFly', source, false, 'Player not found.')
    end
end)

RegisterCommand(Config.FlyCommand, function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        if xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'superadmin' then
            TriggerEvent('fly_system:toggleFly')
        else
            TriggerClientEvent('chat:addMessage', source, {
                args = {'^1SYSTEM', 'You do not have permission to use this command.'}
            })
        end
    else
        TriggerClientEvent('chat:addMessage', source, {
            args = {'^1SYSTEM', 'Player not found.'}
        })
    end
end, false)