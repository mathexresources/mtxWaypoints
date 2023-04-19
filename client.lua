local waypoint = nil
local heading = nil
local entity = nil
local canTp = true

RegisterNetEvent('mtxRespawn:toggleTp')
AddEventHandler('mtxRespawn:toggleTp', function(toggle)
    canTp = toggle
end)

Citizen.CreateThread(function()
    while true do
        entity = GetVehiclePedIsIn(PlayerPedId(), false) or PlayerPedId()
        Wait(2000)
    end
end)

function generateContext()
    local opt = {{
        title = Lang.setRespawn,
        icon = MenuIcons.setRespawn,
        description = Lang.setRespawnDesc,
        onSelect = function()
            waypoint = GetEntityCoords(entity)
            heading = GetEntityHeading(entity)
            lib.notify({
                title = Lang.notifySetTitle,
                description = Lang.notifySetDesc,
                type = 'success'
            })
        end
    }}
    if waypoint then
        table.insert(opt, {
            title = Lang.unsetRespawn,
            icon = MenuIcons.unsetRespawn,
            onSelect = function()
                waypoint, heading = nil, nil
            end
        })
    end
    lib.registerContext({
        id = 'waypoints',
        title = Lang.menuTitle',
        options = opt
    })
    lib.showContext('waypoints')
end


RegisterCommand(Config.openMenuCommand, function(source, args, raw)
    generateContext()
end, false)

RegisterCommand(Config.teleportCommand, function(source, args, raw)
    if waypoint and canTp and not IsNuiFocused() then
        local coords = GetEntityCoords(PlayerPedId())
        local dist = #(coords - waypoint)
        if Config.maxDist == false or (dist < Config.maxDist) then
            SetEntityCoords(entity, table.unpack(waypoint))
            SetEntityHeading(entity, heading)
            SetGameplayCamRelativeHeading(0)
        else
            lib.notify({
                title = Lang.toFarNotifyTitle,
                description = Lang.toFarNotifyDesc,
                type = 'error'
            })
        end
    end
end, false)

if Config.teleportKey then
    RegisterKeyMapping('tp', keybindsTpToRespawn, 'keyboard', Config.teleportKey)
end

if Config.openMenuKey then
    RegisterKeyMapping('respawn', lang.keybindsOpenMenu, 'keyboard', Config.openMenuKey)
end