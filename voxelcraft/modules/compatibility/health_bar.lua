require "voxelcraft:logger/logger"
require "voxelcraft:health/health"
require "voxelcraft:gamemode/gamemode"

---@diagnostic disable-next-line: lowercase-global
health_bar = {}

health_bar.on_health_bar_open = function (player_id)
    logger.info(string.format(
        "opened health bar for player %s",
        player_id
    ))
    if gamemode.get_gamemode() == "survival" then
        hud.open_permanent("voxelcraft:health_bar")
    end
end
