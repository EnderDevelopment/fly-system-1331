local isFlying = false
local lastFlyToggle = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if IsControlJustReleased(0, 288) and IsInputDisabled(0) then -- F1 key
            TriggerServerEvent('fly_system:toggleFly')
        end
    end
end)

RegisterNetEvent('fly_system:toggleFly')
AddEventHandler('fly_system:toggleFly', function(success, message)
    if success then
        isFlying = not isFlying
        lastFlyToggle = GetGameTimer()
        
        if isFlying then
            SetPlayerControl(PlayerId(), false, 0)
            SetEntityInvincible(PlayerPedId(), true)
            SetEntityVisible(PlayerPedId(), false, false)
            SetEntityCollision(PlayerPedId(), false, false)
            FreezeEntityPosition(PlayerPedId(), true)
            
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            
            RequestCollisionAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
            
            while not HasCollisionLoadedAroundEntity(playerPed) do
                Citizen.Wait(0)
            end
            
            SetEntityVisible(PlayerPedId(), true, false)
            SetEntityCollision(PlayerPedId(), true, true)
            FreezeEntityPosition(PlayerPedId(), false)
            
            SetPlayerControl(PlayerId(), true, 0)
            SetEntityInvincible(PlayerPedId(), false)
            
            if Config.EnableNotifications then
                ESX.ShowNotification('Fly mode enabled')
            end
        else
            SetPlayerControl(PlayerId(), true, 0)
            SetEntityInvincible(PlayerPedId(), false)
            
            if Config.EnableNotifications then
                ESX.ShowNotification('Fly mode disabled')
            end
        end
    else
        if Config.EnableNotifications then
            ESX.ShowNotification(message)
        end
    end
end)

function IsInputDisabled(control)
    return IsControlEnabled(0, control) and not IsPauseMenuActive()
end