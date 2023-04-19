Config = {}

Config.openMenuCommand = 'respawn' -- do not set false here, it will break the script
Config.teleportCommand = 'tp' -- do not set false here, it will break the script
Config.openMenuKey = 'k' -- false or the specific key
Config.teleportKey = 'g' -- false or the specific key
Config.maxDist = 500.0 -- The distance from waypoint where you can still use it or false to disable it


Lang = {
    MenuTitle = 'Respawns menu'
    setRespawn = 'Set Spawnpoint',
    notifySetTitle = 'Spawnpoint successfuly set',
    notifySetDesc = '[G] - Teleport to the point',
    unsetRespawn = 'Remove spawnpoint',
    keybindsTpToRespawn = 'TP to respawn',
    keybindsOpenMenu = 'Open respawn menu',
    toFarNotifyTitle = 'You are way to far',
    toFarNotifyDesc = 'Get closer to the waypoint to tp back to it'
}

MenuIcons = { -- https://fontawesome.com/icons
    setRespawn = 'location-crosshairs',
    unsetRespawn = 'xmark'
}